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
    Compute a `concentration` of absences sequences for differents brackets of absences.

    The script estimate the lorenz curve for the absences : how many absences are `trusted` by the most absents students ?
    This table can serve as an input for computing the Gini coefficient of such concentrations estimation.

    The aggregatiopn bracket can be configured through the overriding of the repartition_brackets.

#}
{{ config(alias="report_absences_concentration") }}

-- Agregated absences at a student X school X year X absence length
-- AND Map each absences_sequence_length to a bucket the analysis is splitted by
with
    absences_aggregated as (
        select
            src.fiche,
            spi.population,
            src.eco,
            src.school_year,
            src.category_abs,
            bra.name as bracket_name,
            count(src.absence_sequence_id) as n_absences
        from {{ ref("fact_absences_sequence") }} as src
        inner join
            {{ ref("spine") }} as spi
            on src.fiche = spi.fiche
            and src.eco = spi.eco
            and src.school_year = spi.annee
            and spi.seqid = 1
        inner join
            {{ ref("repartition_brackets") }} as bra
            on src.absences_sequence_length >= bra.lower_bound
            and src.absences_sequence_length < bra.upper_bound
        where school_year > {{ store.get_current_year() - 10 }}
        group by
            src.fiche,
            spi.population,
            src.eco,
            src.school_year,
            src.category_abs,
            bra.name

    ),
    running as (
        select
            eco,
            population,
            category_abs,
            school_year,
            bracket_name,
            1.0 * count(fiche) over (
                partition by population, eco, school_year, category_abs, bracket_name
                order by n_absences desc
                rows between unbounded preceding and current row
            ) as running_count_students,
            1.0 * sum(n_absences) over (
                partition by population, eco, school_year, category_abs, bracket_name
                order by n_absences desc
                rows between unbounded preceding and current row
            ) as running_sum_absences
        from absences_aggregated

    -- Normalize lorenz values
    ),
    normalized as (
        select
            eco,
            population,
            category_abs,
            school_year,
            bracket_name,
            running_count_students / max(running_count_students) over (
                partition by population, eco, school_year, category_abs, bracket_name
            ) as percentage_of_students,
            running_sum_absences / max(running_sum_absences) over (
                partition by population, eco, school_year, category_abs, bracket_name
            ) as percentage_of_absences,
            running_count_students as weight  -- To ponderate the comnbinated graphs
        from running

    -- To reduce the number of points, I only keep the 10th, 20th, 30th, 40th, 50th,
    -- 60th, 70th, 80th, 90th and 100th percentiles
    -- Fetch the target percentile
    ),
    perc_target as (
        select (1.0 * seq_value) / 10 as perc_target
        from {{ ref("int_sequence_0_to_1000") }}
        where seq_value between 1 and 10

    -- Cross join the percentile and compute the distance between observed values and
    -- targets percentiles
    ),
    distance as (
        select
            dst.population,
            dst.eco,
            dst.school_year,
            dst.category_abs,
            dst.bracket_name,
            dst.percentage_of_absences,
            dst.distance,
            dst.perc_target,
            dst.weight,
            row_number() over (
                partition by
                    dst.population,
                    dst.eco,
                    dst.category_abs,
                    dst.school_year,
                    dst.bracket_name,
                    dst.perc_target
                order by distance
            ) as rank
        from
            (
                select
                    obs.population,
                    obs.eco,
                    obs.category_abs,
                    obs.school_year,
                    obs.bracket_name,
                    obs.percentage_of_students,
                    obs.percentage_of_absences,
                    trg.perc_target,
                    abs(trg.perc_target - obs.percentage_of_students) as distance,
                    obs.weight
                from normalized as obs
                inner join
                    perc_target as trg  -- Instead of a cross join, I use an inner join to avoid the cartesian product and reduce the needs for distance computation
                    on obs.percentage_of_students
                    between trg.perc_target - 0.05 and trg.perc_target + 0.05
            ) as dst
    )

select
    {{
        dbt_utils.generate_surrogate_key(
            ["eco", "school_year", "population", "category_abs"]
        )
    }} as filter_key, bracket_name, percentage_of_absences, perc_target, weight
from distance
where rank = 1  -- Keep only the closest distance for each target percentile
