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
{{ config(alias="emp_abs_fact_dash") }}

with
    joursem as (
        select
            annee,
            matricule,
            ref_empl,
            motif_abs,
            lieu_trav,
            reg_abs,
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
        group by
            annee,
            matricule,
            ref_empl,
            motif_abs,
            lieu_trav,
            startdate,
            enddate,
            reg_abs
    ),

    stepone as (
        select
            annee,
            matricule,
            ref_empl,
            motif_abs,
            lieu_trav,
            startdate,
            enddate,
            al.gr_paie,
            pourc_sal,
            ((count(case when cal.jour_sem not in (6, 0) then 1 end) * duree) / 7)
            / 100 as nbrjour
        from {{ ref("fact_abs_list") }} as al

        inner join
            {{ ref("i_pai_tab_cal_jour") }} as cal
            on cal.date_jour between startdate and enddate
        where cal.jour_sem not in (6, 0)  -- Exclude weekends

        group by
            annee,
            matricule,
            ref_empl,
            motif_abs,
            lieu_trav,
            startdate,
            enddate,
            al.gr_paie,
            duree,
            pourc_sal

    ),

    moyenne as (
        select
            annee,
            matricule,
            ref_empl,
            motif_abs,
            lieu_trav,
            round(avg((nbrjour)), 2) as moyenne
        from stepone
        group by annee, matricule, ref_empl, motif_abs, lieu_trav
    ),

    nbrjour as (
        select
            annee,
            matricule,
            ref_empl,
            motif_abs,
            lieu_trav,
            gr_paie,
            round(sum(nbrjour), 2) as nbrjour,
            pourc_sal
        from stepone
        group by annee, matricule, ref_empl, motif_abs, lieu_trav, gr_paie, pourc_sal
    ),

    total as (
        select annee, matricule, ref_empl, lieu_trav, round(sum(nbrjour), 2) as total
        from stepone
        group by annee, matricule, ref_empl, lieu_trav, gr_paie
    )

select
    jo.annee,
    jo.matricule,
    jo.ref_empl,
    jo.gr_paie,
    jo.motif_abs,
    jo.lieu_trav,
    js.reg_abs,
    total,
    nbrjour,
    mo.moyenne,
    max(lundi) as 'lundi',
    max(mardi) as 'mardi',
    max(mercredi) as 'mercredi',
    max(jeudi) as 'jeudi',
    max(vendredi) as 'vendredi',
    round((nbrjour / (cal.jour_trav * pourc_sal)) * 100, 2) as taux,
    (cal.jour_trav * pourc_sal) / 100 as jour_trav,
    cal.jour_trav as temp
from nbrjour as jo

inner join
    moyenne as mo
    on jo.annee = mo.annee
    and jo.motif_abs = mo.motif_abs
    and jo.lieu_trav = mo.lieu_trav
    and jo.matricule = mo.matricule
inner join
    total as tot
    on jo.annee = tot.annee
    and jo.lieu_trav = tot.lieu_trav
    and jo.matricule = tot.matricule
    and jo.ref_empl = tot.ref_empl
inner join
    joursem as js
    on jo.annee = js.annee
    and jo.motif_abs = js.motif_abs
    and jo.lieu_trav = js.lieu_trav
    and jo.matricule = js.matricule
    and jo.ref_empl = js.ref_empl
inner join
    {{ ref("fact_abs_cal") }} as cal
    on jo.annee = cal.an_budg
    and jo.gr_paie = cal.gr_paie
group by
    jo.annee,
    jo.matricule,
    jo.ref_empl,
    jo.gr_paie,
    jo.motif_abs,
    jo.lieu_trav,
    nbrjour,
    mo.moyenne,
    total,
    jour_trav,
    pourc_sal,
    js.reg_abs
