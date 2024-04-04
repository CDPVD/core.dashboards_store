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
{{ config(alias="emp_actif_fact_emp_actif") }}

select
    act.matr,
    emp.legal_name,
    emp.genre as gender,
    emp.email_address,
    emp.sex_friendly_name,
    lieu.workplace_name,
    state.employment_status_name,
    case
        when act.type = 'A' then 'Automatique' when act.type = 'P' then 'À la pièce'
    end as 'remuneration_type',
    case
        when act.mode_cour = 'A'
        then 'Annuel'
        when act.mode_cour = 'H' or act.mode_cour = 'L'
        then 'Heure'
        when act.mode_cour = 'E'
        then 'Enseigant(e) - 10 mois'
        when act.mode_cour = '1'
        then 'Suppléant(e)'
        else 'Autres'
    end as 'renumeration_mode',
    act.emp_actif,
    job_class.code_job_name as 'job_class',
    coalesce(job.job_group_category, 'Inconnu') as 'job_department',
    case when act.emp_actif = 1 then 'Oui' else 'Non' end as 'is_current',
    case when stat.is_reg = 1 then 'Oui' else 'Non' end as 'is_regular',
    case
        when stat.is_reg = 0 and act.type = 'A'
        then 'Temporaire (paie automatique)'
        when stat.is_reg = 0 and act.type = 'P'
        then 'Temporaire (sur pièce)'
        when stat.is_reg = 1
        then 'Régulier'
        else 'Autres'
    end as 'type'
from {{ ref("emp_actif_fact_base") }} as act
inner join {{ ref("dim_employees") }} as emp on act.matr = emp.matr
left join {{ ref("dim_mapper_workplace") }} lieu on act.workplace = lieu.workplace
left join
    {{ ref("dim_mapper_job_class") }} as job_class on job_class.code_job = act.corp_empl
left join {{ ref("dim_mapper_job_group") }} as job on act.corp_empl = job.job_group
left join {{ ref("stat_eng") }} stat on act.stat_eng = stat.stat_eng
left join
    {{ ref("dim_employment_status_yearly") }} as state
    on act.etat_empl = state.etat_empl

where state.school_year = {{ store.get_current_year() }}
