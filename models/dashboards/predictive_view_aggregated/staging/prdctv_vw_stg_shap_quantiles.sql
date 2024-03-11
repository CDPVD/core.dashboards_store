{#
Dashboards Store - Helping students, one dashboard at a time.
Copyright (C) 2023  Sciance Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
#}
{# 
    Approximate Shap value quantile with respect to model, target and categories.
    The quantiles are computed individually for each target, model and category.
    
    Rational : 
    Since the distribution shape of Shap value is untracable (and cannot be assumed normal), quantile can't be infered using a rescaling to a Normal distribution of params (0, 1)
    To approximate the quantiles, I have to use the Empirical Cumulated Distributed Function (ecdf).
    
    Algorithm :
    let's define an anchor as a theorical quantile I am looking the shap value for. 
    The set of admissible shap values is the set of empirical shap values outputed by the model and summed up within a category for each student.
    For each anchor, the approximate quantile is the shap value for which the ecdf is the closest to the anchor.
#}
{{ config(alias="stg_shap_quantiles") }}


-- Summarize the output of a model (shap values) by student and category.
-- Statistically motivated because of the additivity of the shap decomposition..
with
    aggregated as (
        select fiche, category, model, target, sum(shap_value) as shap_value
        from {{ ref("i_core_models_reporting_shap") }}
        group by fiche, category, model, target

    -- Define two scope we we wan't to approximate the quantiles for. One for all
    -- students, one for only students with a risk level > 'negligeable'.
    ),
    by_scope as (
        select category, model, target, shap_value, 'all_risk_level' as scope
        from aggregated
        union all
        select
            src.category,
            src.model,
            src.target,
            src.shap_value,
            'risk_level_above_negligeable' as scope
        from aggregated as src
        join
            {{ ref("i_core_models_reporting_probabilities") }} as prb
            on prb.risk_level_french != 'negligeable'
            and src.fiche = prb.fiche
            and src.model = prb.model
            and src.target = prb.target

    -- Compute the ecdf of the summed-up shap values .
    ),
    ecdf as (
        select
            category,
            model,
            target,
            shap_value,
            scope,
            (row_id * 1.)
            / max(row_id) over (partition by category, model, target, scope) as ecdf
        from
            (
                select
                    category,
                    model,
                    target,
                    scope,
                    shap_value,
                    row_number() over (
                        partition by category, model, target, scope order by shap_value
                    ) as row_id
                from by_scope
            ) as src

    -- Extract the anchors quantiles we want to approximate.
    ),
    anchors as (
        select seq_value / 20.0 as anchor
        from {{ ref("int_sequence_0_to_1000") }}
        where seq_value between 0 and 20.0

    -- Compute the approximate quantile for each anchor (the closest ecdf value to the
    -- anchor)
    ),
    approximate as (
        select
            category,
            model,
            target,
            scope,
            shap_value,
            anchor,
            ecdf,
            abs(ecdf - anchor) as distance,
            row_number() over (
                partition by category, model, target, anchor, scope
                order by abs(ecdf - anchor)
            ) as rank_distance,
            var(shap_value) over (
                partition by category, model, target, scope
            ) as variance  -- To check for the existence of quantile : if the variance is null, then all the shap values are the same, and no meaningfull quantile can be approximate
        from ecdf as ecdf
        cross join anchors
        where ecdf.ecdf between anchors.anchor - 0.02 and anchors.anchor + 0.02  -- To reduce numbering off points : since the domain of ecdf is [0, 1], only 50 students are required for a match to be found (this is a reasonnable assumption for any css)
    )

select model, target, category, anchor as quantile, shap_value, scope
from approximate
where
    rank_distance = 1  -- Take the closest absolute one
    and variance > 0  -- Remove the unmeaningfull quantile
