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
    Compute aggregated statistics over time at a school level
#}
{{ config(alias="report_absences_high_level_metrics") }}

-- Agregated absences at a student X school level X year level X category_abs
with
    absences_aggregated as (
        select
            fiche,
            eco,
            school_year,
            category_abs,
            count(*) as n_absences,
            avg(1.0 * absences_sequence_length) as avg_absences_sequence_length,
            max(absences_sequence_length) as max_absences_sequence_length
        from {{ ref("fact_absences_sequence") }}
        where school_year > {{ store.get_current_year() - 10 }}
        group by fiche, eco, school_year, category_abs

    -- Left join on the population table to get the 0 absences case, AND the
    -- populations at the same time
    ),
    padded as (
        select
            spi.fiche,
            spi.eco,
            spi.annee as school_year,
            spi.population,
            dim_abs.category_abs,
            abs.n_absences,  -- Keep the null as the the average schould not took into account the 0 absences
            abs.avg_absences_sequence_length,  -- Keep the null as the the average schould not took into account the 0 absences
            abs.max_absences_sequence_length  -- Keep the null as the the average schould not took into account the 0 absences
        from {{ ref("spine") }} as spi
        cross join
            (
                select distinct category_abs from {{ ref("fact_absences_sequence") }}
            ) as dim_abs
        left join
            absences_aggregated as abs
            on spi.fiche = abs.fiche
            and spi.eco = abs.eco
            and spi.annee = abs.school_year
            and dim_abs.category_abs = abs.category_abs
        where spi.seqid = 1

    -- Aggregated absences at a school X year X population X category_abs
    ),
    aggregated as (
        select
            eco,
            school_year,
            population,
            category_abs,
            avg(
                case when n_absences is not null then 1. else 0 end
            ) as proportion_of_absentees,
            -- For student with at least one absence
            avg(1. * n_absences) as avg_n_absences_for_absentees,
            avg(
                1. * avg_absences_sequence_length
            ) as avg_avg_absences_sequence_length_for_absentees,
            avg(
                1. * max_absences_sequence_length
            ) as avg_max_absences_sequence_length_for_absentees,
            count(*) as n_students
        from padded
        group by eco, school_year, population, category_abs

    )

select
    {{
        dbt_utils.generate_surrogate_key(
            ["eco", "school_year", "population", "category_abs"]
        )
    }} as filter_key,
    school_year,
    proportion_of_absentees,
    avg_n_absences_for_absentees,
    avg_avg_absences_sequence_length_for_absentees,
    avg_max_absences_sequence_length_for_absentees,
    n_students
from aggregated
