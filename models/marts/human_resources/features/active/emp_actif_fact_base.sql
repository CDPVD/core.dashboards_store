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
    Compute a yearly version of the employment history restricted to only active status
#}
select
    util.matr,
    emp.etat as etat_empl,
    emp.lieu_trav as workplace,
    emp.stat_eng,
    emp.type,
    emp.mode_cour,
    emp.corp_empl,
    ca.emp_actif
from {{ ref("dim_employees") }} as util
left join {{ ref("i_pai_dos_empl") }} emp on util.matr = emp.matr
left join {{ ref("fact_activity_current") }} ca on util.matr = ca.matr
left join {{ ref("etat_empl") }} state on emp.etat = state.etat_empl
where state.etat_actif = 1 and emp.ind_empl_princ = 1
