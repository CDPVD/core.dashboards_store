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
    List all current ACTIVES employes at the time of the ETL run and provide some metadata such as worplace and employment category.

    For an employes to be active it must have been paid in the last two weeks and have a status set as active (from the seed).

    This table first pull the yearly active employees from the activity table.
    Employees list is then filter down using the last_pay_date to remove any employee having left in the current school year.
 #}
-- Fetch the current active employees from the yearly table
with
    actives_etat_empl as (
        select matr, corp_empl, etat_empl, lieu_trav, stat_eng
        from {{ ref("fact_activity_yearly") }}
        where school_year = {{ store.get_current_year() }} and is_main_job = 1  -- Retain metadata for the main job only
    )

select src.matr, src.corp_empl, src.etat_empl, src.lieu_trav, src.stat_eng
from actives_etat_empl as src
left join {{ ref("dim_employees") }} as dme on src.matr = dme.matr
where last_pay_date > dateadd(week, -2, getdate())  -- Make sure the activte employes have been paid in the last two weeks
