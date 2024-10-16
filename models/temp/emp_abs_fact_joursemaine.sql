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
{{ config(alias="emp_abs_fact_joursemaine") }}


select
    année,
    matricule,
    ref_empl,
    motif_abs,
    [lieu de travail],
    count(case when jour_sem = 1 then jour_sem end) / 7 as lundi,
    count(case when jour_sem = 2 then jour_sem end) / 7 as mardi,
    count(case when jour_sem = 3 then jour_sem end) / 7 as mercredi,
    count(case when jour_sem = 4 then jour_sem end) / 7 as jeudi,
    count(case when jour_sem = 5 then jour_sem end) / 7 as vendredi
from {{ ref("fact_abs_list") }}
inner join
    {{ ref("i_pai_tab_cal_jour") }} as cal
    on cal.date_jour between startdate and enddate
where cal.jour_sem not in (6, 0)  -- Exclude weekends
group by année, matricule, ref_empl, motif_abs, [lieu de travail], startdate, enddate
