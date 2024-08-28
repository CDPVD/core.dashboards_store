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
    Compute the full set of slicers for the two reports tables.

    Because of the double-granularity difference (age and school_year) between the rtmrt_report_retirement_age table and the trmrt_report_active_employees_age table, I can't properly combine the two report tables.
    Since powerbi doesn't support many-to-many relations, the filters have to be implemented in a separated table.
    
    That's gross.
#}
{{ config(alias="resignation_report_filters") }}


with
    one_for_all as (
        select
            -- src.etat_empl,
            src.corp_empl,
            src.lieu_trav,
            src.sexe,
            src.stat_eng,
            src.school_year,
            src.job_group_category,
            src.filter_key,
            max(src.filter_source) as filter_source

        from
            (
                select
                    -- etat_empl,
                    corp_empl,
                    lieu_trav,
                    sexe,
                    stat_eng,
                    school_year,
                    job_group_category,
                    'age' as filter_source,
                    filter_key
                from {{ ref("resignation_report_age") }}
                union all
                select
                    -- etat_empl,
                    corp_empl,
                    lieu_trav,
                    sexe,
                    stat_eng,
                    school_year,
                    job_group_category,
                    'rate' as filter_source,
                    filter_key
                from {{ ref("resignation_report_rate") }}
            ) as src
        group by
            -- etat_empl,
            corp_empl,
            lieu_trav,
            sexe,
            stat_eng,
            school_year,
            job_group_category,
            filter_key

    )

-- Join the friendly name
select
    -- src.etat_empl,
    src.corp_empl,
    src.lieu_trav,
    src.sexe,
    src.stat_eng,
    src.school_year,
    src.job_group_category,
    src.filter_key,
    eng.stat_eng as engagement_status_name,
    work.workplace_name,
    src.filter_source

from one_for_all as src

left join
    {{ ref("dim_engagement_status_yearly") }} as eng
    on src.stat_eng = eng.stat_eng
    and eng.is_current = 1  -- Only keep the active valid data
left join {{ ref("dim_mapper_workplace") }} as work on src.lieu_trav = work.workplace
