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
{{ config(alias="fact_abs_jour") }}

select
    année,
    matricule,
    ref_empl,
    motif_abs,
    [lieu de travail],
    startdate,
    enddate,
    al.gr_paie,
    pourc_sal,
    ((count(case when cal.jour_sem not in (6, 0) then 1 end) * durée) / 7)
    / 100 as nbrjour
from {{ ref("fact_abs_list") }} as al

inner join
    {{ ref("i_pai_tab_cal_jour") }} as cal
    on cal.date_jour between startdate and enddate
where cal.jour_sem not in (6, 0)  -- Exclude weekends

group by
    année,
    matricule,
    ref_empl,
    motif_abs,
    [lieu de travail],
    startdate,
    enddate,
    al.gr_paie,
    durée,
    pourc_sal
