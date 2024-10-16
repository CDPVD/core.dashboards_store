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
{{ config(alias="emp_abs_fact_abs") }}

select distinct
    jo.année,
    jo.matricule,
    jo.ref_empl,
    jo.gr_paie,
    jo. [motif d 'absence],
  	jo.[Lieu de travail],
	total,
	nbrJour,
	mo.moyenne,
	max(lundi) as ' lundi ',
	max(mardi) as ' mardi ',
	max(Mercredi) as ' mercredi ',
	max(Jeudi) as ' jeudi ',
	max(Vendredi) as ' vendredi ',
	(nbrJour / (cal.jour_trav * POURC_SAL)) * 100 AS taux,
	(cal.jour_trav * POURC_SAL) / 100 AS jour_trav,
	cal.jour_trav AS TEMP
FROM {{ ref("emp_abs_fact_nbrjour") }} as jo
inner join {{ref("emp_abs_fact_moyenne")}} as mo 
	on jo.Année = mo.Année 
	and jo.[Motif d' absence] = mo. [motif d 'absence] 
	and jo.[Lieu de travail] = mo.[Lieu de travail] 
	and jo.Matricule = mo.Matricule
inner join {{ref("emp_abs_fact_total")}} as tot 
	on jo.Année = tot.Année 
	and jo.[Lieu de travail] = tot.[Lieu de travail] 
	and jo.Matricule = tot.Matricule 
	AND jo.REF_EMPL = tot.REF_EMPL
inner join {{ ref("emp_abs_fact_joursemaine")}} as js 
	on jo.Année = js.Année 
	and jo.[Motif d' absence] = js. [motif d 'absence] 
	and jo.[Lieu de travail] = js.[Lieu de travail] 
	and jo.Matricule = js.Matricule 
	AND jo.REF_EMPL = js.REF_EMPL
INNER JOIN {{ref("fact_abs_cal")}} AS CAL 
	ON JO.Année = CAL.AN_BUDG 
	AND JO.GR_PAIE = CAL.GR_PAIE
group by jo.Année, jo.Matricule, JO.REF_EMPL, jo.GR_PAIE, jo.[Motif d' absence],
    jo. [lieu de travail],
    nbrjour,
    mo.moyenne,
    total,
    jour_trav,
    pourc_sal
