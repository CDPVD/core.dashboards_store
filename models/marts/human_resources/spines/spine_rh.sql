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
with
    employees as (select distinct matr from {{ ref("i_pai_dos_empl") }}),
    years as (
        select distinct year(years.date_eff) year from {{ ref("i_paie_hemp") }} years
    ),
    past_10_years as (
        select * from years where year >= (select max(year) from years) - 10
    )

select employees.matr, year years
from employees
cross join past_10_years
