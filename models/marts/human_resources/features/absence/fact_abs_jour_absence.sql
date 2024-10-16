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
{{ config(alias="fact_abs_jour_absence") }}

select
    case
        when month(absence. [date]) >= 1 and month(absence. [date]) < 7
        then concat(year(absence. [date]) - 1, '', year(absence. [date]))
        else concat(year(absence. [date]), '', year(absence. [date]) + 1)
    end as [annee],
    absence. [matr] as [matricule],
    absence. [date],
    absence.mot_abs as motif_abs,
    [dure] * emp.pourc_sal as [duree],
    absence.lieu_trav as lieu_trav,
    emp.pourc_sal,
    emp.gr_paie,
    absence.ref_empl,
    absence.reg_abs
from {{ ref("i_pai_habs") }} as absence
inner join
    {{ ref("i_paie_hemp") }} as emp
    on absence.matr = emp.matr
    and absence.ref_empl = emp.ref_empl
where
    year(absence.date) >= 2019
    and dure != 0
    and emp.pourc_sal != 0

    and absence.mot_abs != '05'
    and absence.mot_abs != '09'
    and absence.mot_abs != '13'
    and absence.mot_abs != '14'
    and absence.mot_abs != '16'

    and absence.ref_empl = emp.ref_empl
    and absence.corp_empl = emp.corp_empl
    and absence.date between emp.date_eff and emp.date_fin
    and absence.sect = emp.sect
