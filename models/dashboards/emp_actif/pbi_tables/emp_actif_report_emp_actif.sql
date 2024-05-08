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
{{ config(alias="emp_actif_report_emp_actif") }}

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
from {{ ref("emp_actif_fact_emp_actif") }}
