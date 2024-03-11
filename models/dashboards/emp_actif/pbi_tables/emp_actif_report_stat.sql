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
{{ config(alias="emp_actif_report_stat") }}

with
    rankedemployees as (
        select
            *,
            row_number() over (
                partition by
                    job_department,
                    workplace_name,
                    job_class,
                    sex_friendly_name,
                    is_current,
                    matr
                order by matr desc
            ) as row_number
        from {{ ref("emp_actif_report_emp_actif") }} as act
    ),

    agg as (
        select
            sex_friendly_name,
            workplace_name,
            job_class,
            job_department,
            is_current,
            type,
            count(matr) as total_emp_by_group,
            sum(case when sex_friendly_name = 'homme' then 1 else 0 end) as total_men,
            sum(case when sex_friendly_name = 'femme' then 1 else 0 end) as total_women,
            sum(case when is_regular = 'Oui' then 1 else 0 end) as total_etp,
            sum(case when is_current = 'Oui' then 1 else 0 end) as emp_cur,
            count(
                case when is_current = 'Oui' then 1 else 0 end
            ) as total_emp_by_group_act,
            sum(
                case
                    when sex_friendly_name = 'homme' and is_current = 'Oui'
                    then 1
                    else 0
                end
            ) as total_men_act,
            sum(
                case
                    when sex_friendly_name = 'femme' and is_current = 'Oui'
                    then 1
                    else 0
                end
            ) as total_women_act,
            sum(
                case when is_regular = 'Oui' and is_current = 'Oui' then 1 else 0 end
            ) as total_etp_act,
            count(matr) as total_actif
        from rankedemployees
        where row_number = 1
        group by
            sex_friendly_name,
            workplace_name,
            job_class,
            job_department,
            type,
            is_current,
            emp_actif
    ),

    total_emp as (
        select
            sex_friendly_name,
            workplace_name,
            job_class,
            job_department,
            type,
            is_current,
            total_men,
            total_women,
            total_etp,
            total_men_act,
            total_women_act,
            total_etp_act,
            total_emp_by_group,
            total_emp_by_group_act,
            total_actif,
            emp_cur,
            sum(emp_cur) over () as total_count_emp_act,
            sum(total_emp_by_group) over () as total_count_emp
        from agg
    )

select
    *,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "job_department",
                "workplace_name",
                "job_class",
                "type",
                "sex_friendly_name",
                "is_current",
            ]
        )
    }} as filter_key
from total_emp
