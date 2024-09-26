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
{{ config(alias="resignation_report_age") }}

with

    with_metadata as (
        select
            src.matr,
            src.etat as etat_empl,
            src.corp_empl,
            src.ref_empl,
            src.lieu_trav,
            src.stat_eng,
            src.demission_date,
            src.demission_age,
            src.school_year,
            src.sexe,
            src.days_employment,
            job.job_group_description,
            job.job_group_category
        from {{ ref("fact_resignation") }} as src
        inner join
            {{ ref("dim_mapper_job_group") }} as job on job.job_group = src.corp_empl
        where src.school_year >= {{ store.get_current_year() }} - 10

    )

select
    matr,
    etat_empl,
    corp_empl,
    ref_empl,
    lieu_trav,
    sexe,
    stat_eng,
    demission_date,
    demission_age,
    school_year,
    job_group_description,
    job_group_category,
    days_employment,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "corp_empl",
                "sexe",
                "job_group_category",
                "lieu_trav",
                "stat_eng",
                "school_year",
            ]
        )
    }} as filter_key
from with_metadata
