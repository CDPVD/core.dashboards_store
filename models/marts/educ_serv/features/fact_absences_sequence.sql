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
    Compute the sequence of days with at least one periode of absence.
#}
{# Extract the 'grille' selection variables : default to the one used by VDC #}
{% set grille_section = var(
    "marts", {"educ_serv": {"absences": {"grille": ("1", "A")}}}
) %}
{% set grille_value = grille_section["educ_serv"]["absences"]["grille"] %}
{% set is_grille_value_default = grille_value == ("1", "A") %}

{% if execute %}
    {% if is_grille_value_default %}
        {{
            log(
                "Warning : absences : the default 'grille' variable will be used to extract the absences. You might want to override it.",
                true,
            )
        }}
    {% endif %}
{% endif %}

-- Extract all the days a student is expected to be there 
with
    expected_cal as (
        select
            case
                when month(date_evenement) <= 7
                then year(date_evenement) - 1
                else year(date_evenement)
            end as school_year,
            id_eco,
            date_evenement
        from {{ ref("i_gpm_t_cal") }} as cal
        where jour_cycle is not null and grille in {{ grille_value }}

    -- Add a sequence id : day_id to later identify the break between two sequences of
    -- absences
    ),
    expected_cal_with_id as (
        select
            school_year,
            id_eco,
            date_evenement,
            row_number() over (
                partition by id_eco, school_year order by date_evenement
            ) as day_id
        from expected_cal
        where date_evenement <= getdate()

    -- Left join the observed absences on the calendar
    ),
    observed as (
        select
            exp.school_year,
            exp.id_eco,
            exp.date_evenement,
            exp.day_id,
            abs.fiche,
            abs.category_abs,
            abs.description_abs
        from expected_cal_with_id as exp
        inner join
            {{ ref("stg_absences_per_period") }} as abs
            on exp.id_eco = abs.id_eco
            and exp.date_evenement = abs.date_abs

    -- Get the between-sequences-of-absences breaks by checking if the previous day
    -- was a day of absence too (with respect to the absence category)
    ),
    breaks as (
        select
            school_year,
            id_eco,
            date_evenement,
            day_id,
            category_abs,
            description_abs,
            case
                when
                    day_id - lag(day_id) over (
                        partition by school_year, id_eco, fiche, category_abs
                        order by day_id
                    )
                    > 1
                then 1
                else 0
            end as sequence_break,
            fiche
        from observed

    -- SUM over the break id to get a sequence_id
    ),
    sequences as (
        select
            school_year,
            id_eco,
            date_evenement,
            day_id,
            fiche,
            category_abs,
            description_abs,
            sum(sequence_break) over (
                partition by school_year, id_eco, fiche, category_abs
                order by day_id
                rows between unbounded preceding and current row
            ) as absence_sequence_id
        from breaks

    ),

    -- Select the last description_abs of each sequence to give some context. Taking
    -- the last makes more sens than the first as the nature of the sequence might
    -- evolve accross time.
    contextualized as (
        select
            school_year,
            id_eco,
            date_evenement,
            day_id,
            fiche,
            category_abs,
            last_value(description_abs) over (
                partition by
                    school_year, fiche, id_eco, absence_sequence_id, category_abs
                order by day_id
                rows between unbounded preceding and unbounded following
            ) as last_description_abs,
            absence_sequence_id
        from sequences

    ),

    -- Create the final table : one row per fiche X school X year X sequence of
    -- absences
    aggregated as (
        select
            school_year,
            fiche,
            id_eco,
            absence_sequence_id,
            category_abs,
            min(last_description_abs) as last_description_abs,  -- Dummy aggregation
            min(date_evenement) as absence_start_date,
            max(date_evenement) as absence_end_date,
            max(day_id) - min(day_id) + 1 as absences_sequence_length
        from contextualized
        group by school_year, fiche, id_eco, absence_sequence_id, category_abs

    -- Add final dimensions 
    )

select
    src.school_year,
    src.fiche,
    eco.eco,
    src.category_abs,
    src.last_description_abs,
    src.absence_sequence_id,
    src.absence_start_date,
    src.absence_end_date,
    src.absences_sequence_length
from aggregated as src
left join {{ ref("i_gpm_t_eco") }} as eco on src.id_eco = eco.id_eco
