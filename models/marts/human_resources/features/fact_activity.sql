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
    Compute the activity status over time of an employee
#}
-- Only keep the last 10 years of historical data
with
    source as (
        select school_year, matr, etat_empl
        from {{ ref("stg_employment_history") }} as hemp
        where hemp.school_year >= {{ store.get_current_year() - 10 }}

    ),
    filtered as (
        select src.*
        from source as src
        inner join
            {{ ref("dim_etat_empl_yearly") }} as etat_empl
            on src.etat_empl = etat_empl.etat_empl
            and src.school_year = etat_empl.school_year
            and etat_empl.etat_actif = 1

    )

select * matr, school_year
from filtered
group by matr
