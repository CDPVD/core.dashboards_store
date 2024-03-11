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
{{ config(alias="emp_actif_report_filter") }}
with
    one_for_all as (
        select
            src.sex_friendly_name,
            src.workplace_name,
            src.job_class,
            src.job_department,
            src.is_current,
            src.type,
            src.filter_key,
            max(src.filter_source) as filter_source
        from
            (
                select
                    sex_friendly_name,
                    workplace_name,
                    job_class,
                    job_department,
                    is_current,
                    type,
                    'stat' as filter_source,
                    filter_key
                from {{ ref("emp_actif_report_stat") }}
                union all
                select
                    sex_friendly_name,
                    workplace_name,
                    job_class,
                    job_department,
                    is_current,
                    type,
                    'desc' as filter_source,
                    filter_key
                from {{ ref("emp_actif_report_emp_actif") }}
            ) as src
        group by
            src.sex_friendly_name,
            src.workplace_name,
            src.job_class,
            src.job_department,
            src.type,
            src.is_current,
            src.filter_key
    )
-- Join the friendly name
select
    src.sex_friendly_name,
    src.workplace_name,
    src.job_class,
    src.job_department,
    src.type,
    src.is_current,
    src.filter_key,
    src.filter_source
from one_for_all as src
