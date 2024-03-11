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
{{ config(alias="fact_emp_conge") }}

with
    employes as (
        select
            case
                when month(emp.date_eff) < 7
                then year(emp.date_eff) - 1
                else year(emp.date_eff)
            end as annee,
            emp.date_eff as date_eff,
            emp.matr as matricule,
            emp.lieu_trav,
            lieu.descr as lieu_trav_descr,
            emp.corp_empl as corps_emploi,
            corp.descr as corps_demploi_description,
            emp.etat as etat,
            etat.descr as etat_description,
            empl_status.cong_lt
        from {{ ref("i_paie_hemp") }} as emp
        inner join {{ ref("i_pai_tab_etat_empl") }} as etat on emp.etat = etat.etat_empl
        inner join
            {{ ref("i_pai_tab_corp_empl") }} as corp on emp.corp_empl = corp.corp_empl
        inner join
            {{ ref("i_pai_tab_lieu_trav") }} as lieu on emp.lieu_trav = lieu.lieu_trav
        inner join
            {{ ref("dim_employment_status_yearly") }} as empl_status
            on emp.etat = empl_status.etat_empl
            and case
                when month(emp.date_eff) < 7
                then year(emp.date_eff) - 1
                else year(emp.date_eff)
            end
            = empl_status.school_year
        where empl_status.empl_cong = 1  -- Empl en congé  
    ),

    row_num as (
        select
            *,
            row_number() over (
                partition by annee, matricule, etat order by date_eff desc
            ) as seqid
        from employes
    ),

    columns as (
        select
            date_eff,
            annee,
            matricule,
            lieu_trav,
            lieu_trav_descr,
            corps_emploi,
            corps_demploi_description,
            etat_description,
            cong_lt
        from row_num
        where seqid = 1
    )

select *
from columns
