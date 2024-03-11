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
    Compute the distributions of the sequences length and the distribution of the number of sequences per length.
#}
{{ config(alias="report_absences_distributions") }}

-- Agregated absences at a student X school X year X sequence length level X
-- category_abs
with
    absences_aggregated as (
        select
            fiche,
            eco,
            school_year,
            absences_sequence_length,
            category_abs,
            count(*) as n_absences,
            max(absences_sequence_length) over (
                partition by fiche, eco, school_year, category_abs
            ) as max_sequence_length
        from {{ ref("fact_absences_sequence") }}
        where school_year > {{ store.get_current_year() - 10 }}
        group by fiche, eco, school_year, absences_sequence_length, category_abs

    -- Get rid of the students dimension : only keep the most up to date school for
    -- each student
    -- I can't compute the cumulated distributions with a table of such granularity.
    ),
    aggregated as (
        select
            spi.population,
            src.eco,
            src.school_year,
            src.category_abs,
            src.absences_sequence_length,
            src.n_absences,
            count(src.fiche) as n_students,
            count(
                case
                    when src.absences_sequence_length = src.max_sequence_length
                    then src.fiche
                end
            ) as n_students_with_max_sequence_length
        from absences_aggregated as src
        inner join
            {{ ref("spine") }} as spi
            on src.school_year = spi.annee
            and src.fiche = spi.fiche
            and src.eco = spi.eco
            and spi.seqid = 1
        group by
            spi.population,
            src.eco,
            src.school_year,
            src.category_abs,
            src.absences_sequence_length,
            src.n_absences

    )

select
    {{
        dbt_utils.generate_surrogate_key(
            ["eco", "school_year", "population", "category_abs"]
        )
    }} as filter_key,
    absences_sequence_length,
    n_absences,
    n_students,
    n_students_with_max_sequence_length
from aggregated
