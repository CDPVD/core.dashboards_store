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
    Select the employees currently working and compute their age at the start of the year

    Because of the double-granularity difference (age and school_year) with the rtmrt_report_retirement_age table, a surrogate key is generated to allow the user to filter on both dimensions at the same time
#}
{{ config(alias="report_employees_age") }}

-- Create the start-of-year date
with
    current_year as (
        select concat({{ store.get_current_year() }}, '-09-01') as current_year

    -- Add the birth date and the sex to the active employes table
    ),
    with_metadata as (
        select
            src.matr,
            src.etat_empl as etat,
            src.lieu_trav,
            src.corp_empl,
            src.stat_eng,
            dos.birth_date,
            dos.sex
        from {{ ref("fact_activity_current") }} as src
        left join {{ ref("dim_employees") }} as dos on src.matr = dos.matr
        where src.matr not in (select matr from {{ ref("fact_retirement") }})  -- Remove the already retired employes

    -- Get the age of the employes currently active
    ),
    active_employees_age as (  -- Get the employees' age at the start of the year
        select
            act.matr,
            act.etat,
            act.lieu_trav,
            act.corp_empl,
            act.stat_eng,
            act.sex,
            datediff(year, birth_date, current_year) as age  -- Age at september the first of the current year
        from with_metadata as act
        cross join current_year

    -- Adding friendly dimensions
    ),
    friendly_name as (
        select
            src.matr,
            src.sex,
            src.age,
            coalesce(job.job_group_category, 'Inconnu') as job_group_category,
            coalesce(src.lieu_trav, 'Inconnu') as lieu_trav,
            coalesce(src.stat_eng, 'Inconnu') as stat_eng,
            coalesce(src.etat, 'Inconnu') as etat
        from active_employees_age as src
        left join
            {{ ref("dim_mapper_job_group") }} as job on src.corp_empl = job.job_group

    -- Aggregate the data for the report
    ),
    aggregated as (
        select
            sex,
            lieu_trav,
            stat_eng,
            etat,
            job_group_category,
            age,
            count(*) as n_employees
        from friendly_name
        group by sex, lieu_trav, stat_eng, etat, job_group_category, age

    -- Add the filter surrogate key
    )
select
    sex as sexe,
    etat,
    job_group_category,
    lieu_trav,
    stat_eng,
    age,
    n_employees,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "sex",
                "job_group_category",
                "lieu_trav",
                "stat_eng",
                "etat",
            ]
        )
    }} as filter_key
from aggregated
