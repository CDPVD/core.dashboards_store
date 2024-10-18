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
    Compute the number of retirees and the age they retired at per school year, job group, workplace, engagement status, and employment status.

    Because of the double-granularity difference (age and school_year) with the rtmrt_report_active_employees_age table, a surrogate key is generated to allow the user to filter on both dimensions at the same time
#}
{{ config(alias="report_retirement_age") }}

-- Add some metadata : the school year and the job group
with
    source as (
        select
            case
                when month(src.retirement_date) < {{ var("mois_reference")}}
                then year(src.retirement_date) - 1
                else year(src.retirement_date)
            end as school_year,
            src.matr as matricule,
            dos.sexe,
            coalesce(job.job_group_category, 'Inconnu') as job_group_category,
            coalesce(src.lieu_trav, 'Inconnu') as lieu_trav,
            coalesce(src.stat_eng, 'Inconnu') as stat_eng,
            coalesce(src.etat, 'Inconnu') as etat,
            src.retirement_age
        from {{ ref("fact_retirement") }} as src
        left join
            {{ ref("dim_mapper_job_group") }} as job on src.corp_empl = job.job_group  -- Add the job group category here as I want to aggreagte by job group categories and not by job group.
        left join {{ ref("i_pai_dos") }} as dos on src.matr = dos.matr

    -- Compute some aggregated statistics
    ),
    aggregated as (
        select
            sexe,
            etat,
            school_year,
            job_group_category,
            lieu_trav,
            stat_eng,
            retirement_age,
            count(*) as n_retirees
        from source
        where school_year >= {{ store.get_current_year() }} - 10
        group by
            sexe,
            etat,
            school_year,
            job_group_category,
            lieu_trav,
            stat_eng,
            retirement_age
    )

-- Flag the current year
select
    sexe,
    etat,
    job_group_category,
    lieu_trav,
    stat_eng,
    convert(
        date, concat(school_year, '-', {{ var("mois_reference")}}, '-01')
        , 102) as school_year,
    case
        when {{ store.get_current_year() }} = school_year then 1 else 0
    end as is_current_year,
    retirement_age,
    n_retirees,
    {{
        dbt_utils.generate_surrogate_key(
            ["sexe", "job_group_category", "lieu_trav", "stat_eng", "etat"]
        )
    }} as filter_key
from aggregated
