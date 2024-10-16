{#
Dashboards Store - Helping students, one dashboard at a time.
Copyright (C) 2023  Sciance Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
#}
{{ config(alias="fact_abs_cal") }}

select [an_budg], [gr_paie], count(bal_jour_ouv) as jour_trav
from {{ ref("i_pai_tab_cal_jour") }}
where
    type_jour != 'C'
    and type_jour != 'E'
    and jour_sem != 0
    and jour_sem != 6
    and an_budg >= 20192020
group by an_budg, gr_paie
