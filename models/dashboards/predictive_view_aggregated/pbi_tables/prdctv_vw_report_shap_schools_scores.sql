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
    For each model, target, category, school and population compute the percentile the averaged school shap value belongs to.
    
    By using the quantile (over the (schoolboard level) distribution of students) we get a relative comparison of a school to the general population and hence a better understanding of the school's performance without expliciting ranking the schools between them.
#}
{{ config(alias="report_shap_schools_scores") }}

-- Compute students shap values for all students
with
    students_shap as (
        select fiche, category, model, target, sum(shap_value) as shap_value  -- By additivity of shap values
        from {{ ref("i_core_models_reporting_shap") }}
        group by fiche, category, model, target

    -- Define two scope we wan't to approximate the quantile for. 
    ),
    by_scope as (
        select fiche, category, model, target, shap_value, 'all_risk_level' as scope
        from students_shap
        union all
        select
            src.fiche,
            src.category,
            src.model,
            src.target,
            src.shap_value,
            'risk_level_above_negligeable' as scope
        from students_shap as src
        join
            {{ ref("i_core_models_reporting_probabilities") }} as prb
            on prb.risk_level_french != 'negligeable'
            and src.fiche = prb.fiche
            and src.model = prb.model
            and src.target = prb.target

    -- Compute students metadata
    ),
    metadata as (
        select spi.fiche, spi.eco, spi.population
        from {{ ref("spine") }} as spi
        where spi.seqid = 1 and spi.annee = {{ store.get_current_year() }}

    -- Compute the un-normazlided score
    ),
    unnormalized_score as (
        select
            mtd.eco,
            coalesce(mtd.population, 'Tous les élèves') as population,
            shp.category,
            shp.model,
            shp.target,
            shp.scope,
            avg(shp.shap_value) as shap_value_avg
        from by_scope as shp
        join metadata as mtd on shp.fiche = mtd.fiche
        group by
            mtd.eco, cube (mtd.population),
            shp.category,
            shp.model,
            shp.target,
            shp.scope

    -- Normalizing the value by looking up the population-level for a given model /
    -- target / category quantile.
    ),
    normalized as (
        select
            unrm.eco,
            unrm.population,
            unrm.category,
            unrm.model,
            unrm.target,
            unrm.scope,
            unrm.shap_value_avg,
            qtl.quantile,
            row_number() over (
                partition by
                    unrm.eco,
                    unrm.population,
                    unrm.category,
                    unrm.model,
                    unrm.target,
                    unrm.scope
                order by abs(unrm.shap_value_avg - qtl.shap_value)
            ) as rank_distance
        from unnormalized_score as unrm
        inner join
            {{ ref("prdctv_vw_stg_shap_quantiles") }} as qtl
            on unrm.model = qtl.model
            and unrm.target = qtl.target
            and unrm.category = qtl.category
            and unrm.scope = qtl.scope

    -- Add school metadata 
    ),
    meta as (
        select
            model,
            target,
            population,
            coalesce(ecl.school_friendly_name, nrm.eco) as school,
            scope,
            category,
            shap_value_avg,
            quantile
        from normalized as nrm
        left join
            {{ ref("dim_mapper_schools") }} as ecl
            on nrm.eco = ecl.eco
            and ecl.annee = {{ store.get_current_year() }}
        where rank_distance = 1
    )

select
    {{ dbt_utils.generate_surrogate_key(["model", "target", "population", "school"]) }}
    as filter_key,
    case
        when scope = 'all_risk_level'
        then 'Avec les élèves à risque négligeable'
        when scope = 'risk_level_above_negligeable'
        then 'Sans les élèves à risque négligeable'
    end as scope_friendly_name,
    category,
    shap_value_avg,
    quantile
from meta
