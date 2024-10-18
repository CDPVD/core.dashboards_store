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
    Aggreagtes and compute the metric per year, schools and evaluation
#}
{{
    config(
        alias="report_evaluation_grades",
    )
}}

with
    agg as (
        select
            annee,
            friendly_name,
            count(fiche) as n_obs,
            cast(sum(cod_reussite) as float) as n_success,
            cast(sum(cod_reussite_threshold) as float) as n_success_threshold,
            avg(resultat_numerique) as resultat_avg,
            coalesce(stdev(resultat_numerique), 0) as resultat_stdev
        from {{ ref("rstep_fact_evaluations_grades") }}
        group by annee, friendly_name

    -- Add the statistis
    ),
    stats as (
        select
            annee,
            friendly_name,
            -- Compute the point-in-time statistics
            n_obs,
            resultat_avg,
            resultat_stdev,
            n_success,
            n_success / n_obs as percent_of_success,
            n_success_threshold,
            n_success_threshold / n_obs as percent_of_thresholded_success,
            -- Compute the running statistics
            cast(running_resultat_avg as float)
            / running_count as running_resultat_avg_ma5,
            cast(running_resultat_stdev as float)
            / running_count as running_resultat_stdev_ma5,
            running_success / running_count as percent_of_success_ma5,
            running_thresholded_success
            / running_count as percent_of_thresholded_success_ma5
        from
            (
                select
                    annee,
                    friendly_name,
                    n_obs,
                    n_success,
                    n_success_threshold,
                    resultat_avg,
                    resultat_stdev,
                    -- Add the RUNNING raw statistics
                    sum(resultat_avg * n_obs) over (
                        partition by friendly_name
                        order by annee
                        rows between 5 preceding and current row
                    ) as running_resultat_avg,
                    sum(resultat_stdev * n_obs) over (
                        partition by friendly_name
                        order by annee
                        rows between 5 preceding and current row
                    ) as running_resultat_stdev,
                    sum(n_success) over (
                        partition by friendly_name
                        order by annee
                        rows between 5 preceding and current row
                    ) as running_success,
                    sum(n_success_threshold) over (
                        partition by friendly_name
                        order by annee
                        rows between 5 preceding and current row
                    ) as running_thresholded_success,
                    sum(n_obs) over (
                        partition by friendly_name
                        order by annee
                        rows between 5 preceding and current row
                    ) as running_count
                from agg
            ) as src

    )

-- Add the school friendly name
select
    -- Dimensions
    {{ dbt_utils.generate_surrogate_key(["stats.annee", "stats.friendly_name"]) }}
    as id_friendly_name,
    stats.annee,
    stats.friendly_name,
    -- Metrics
    stats.n_obs,
    stats.resultat_avg,
    stats.resultat_stdev,
    stats.percent_of_success,
    stats.percent_of_thresholded_success,
    stats.running_resultat_avg_ma5,
    stats.running_resultat_stdev_ma5,
    stats.percent_of_success_ma5,
    stats.percent_of_thresholded_success_ma5
from stats
