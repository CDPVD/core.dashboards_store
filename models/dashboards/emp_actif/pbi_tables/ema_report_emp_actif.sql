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
{{
    config(
        alias="report_emp_actif",
    )
}}
with
    empl_actif as (
        select
            util.matr,
            nom,
            prnom as prenom,
            adr_electrnq_portail as courriel_portail,
            lieu.lieu_trav as lieu,
            lieu.descr as desc_lieu,
            corp.corp_empl as corp,
            corp.descr as desc_corp,
            etat.etat_empl as etat_empl,
            etat.descr as desc_etat_empl,
            empl.stat_eng as stat_eng,
            eng.descr_stat_eng as desc_stat_eng,
            etat,
            perm.code_perm,
            row_number() over (
                partition by util.matr, adr_electrnq_portail, lieu.lieu_trav
                order by date_eff desc
            ) as seqid

        from {{ ref("i_pai_dos") }} as util
        left join {{ ref("i_pai_dos_2") }} as info on util.matr = info.matr
        left join {{ ref("i_pai_dos_empl") }} as empl on empl.matr = util.matr
        left join
            {{ ref("i_pai_tab_corp_empl") }} as corp on corp.corp_empl = empl.corp_empl
        left join
            {{ ref("i_pai_tab_lieu_trav") }} as lieu on lieu.lieu_trav = empl.lieu_trav
        left join {{ ref("i_pai_tab_stat_eng") }} as eng on eng.stat_eng = empl.stat_eng
        left join {{ ref("i_pai_tab_etat_empl") }} as etat on etat.etat_empl = empl.etat
        left join {{ ref("i_pai_dos_perc") }} as perm on perm.matr = empl.matr

        where
            empl.ind_empl_princ = '1'  -- emploi principal
            and adr_electrnq_portail is not null
            and etat_doss = 'A'  -- Actif
            and date_eff >= '2020-07-01 00:00:00'
            and date_dern_paie > dateadd(
                week,
                -{{ var("emp_actif", {"nbrs_sem_dern_paie": 1})["nbrs_sem_dern_paie"] }},
                getdate()
            )  -- moins nombre de semaine: par défaut 1
    )

select
    matr,
    concat(prenom, ' ', nom) as nom_empl,
    courriel_portail,
    concat(lieu, ' - ', desc_lieu) as lieu_trav,
    concat(corp, ' - ', desc_corp) as corps_empl,
    concat(statut.etat_empl, ' - ', desc_etat_empl) as etat_empl,
    concat(stat_eng, ' - ', desc_stat_eng) as stat_eng,
    case when code_perm = 1 then 1 else 0 end as isemployepermanent
from empl_actif
inner join
    {{ ref("dim_employment_status_yearly") }} as statut
    on statut.etat_empl = etat
    and statut.etat_actif = 1
    and statut.is_current = 1  -- Only keep the currently valid employment status mapping
where seqid = 1
