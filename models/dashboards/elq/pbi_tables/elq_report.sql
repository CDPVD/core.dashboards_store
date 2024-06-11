-- depends_on: {{ ref('dim_mapper_workplace') }}
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
{{ config(alias="elq_report") }}
select
    ensq.matr as matricule,
    ensq.birth_date,
    case
        when datediff(year, ensq.birth_date, getdate()) < 25
        then '24 ans et moins'
        when
            datediff(year, ensq.birth_date, getdate()) >= 25
            and datediff(year, ensq.birth_date, getdate()) < 35
        then '25 à 34 ans'
        when
            datediff(year, ensq.birth_date, getdate()) >= 35
            and datediff(year, ensq.birth_date, getdate()) < 45
        then '35 à 44 ans'
        when
            datediff(year, ensq.birth_date, getdate()) >= 45
            and datediff(year, ensq.birth_date, getdate()) < 55
        then '45 à 54 ans'
        when
            datediff(year, ensq.birth_date, getdate()) >= 55
            and datediff(year, ensq.birth_date, getdate()) < 65
        then '55 à 64 ans'
        when datediff(year, ensq.birth_date, getdate()) >= 65
        then '65 ans et plus'
    end as 'tranche_age',
    ensq.genre,
    lieu.workplace_name as lieu_principal,
    job_class.code_job_name as corp_empl,
    stat.stateng_name as stat_eng,
    case
        when qualif.code is null then 'Aucune' else qualif.code + ' - ' + qualif.descr
    end as qualification,
    qualif.is_qualified 'elq',
    state.descr as etat_empl,
    case when genre = 'femme' then 1 end as total_femme,
    case when genre = 'homme' then 1 end as total_homme,
    case when qualif.is_qualified = 1 then 1 end as total_elq,
    case when genre = 'femme' or genre = 'homme' then 1 end as total_ens

from {{ ref("fact_ens_qualif") }} as ensq

left join {{ ref("dim_mapper_workplace") }} lieu on ensq.workplace = lieu.workplace
left join {{ ref("etat_empl") }} state on ensq.etat_empl = state.etat_empl
inner join
    {{ ref("dim_mapper_job_class") }} as job_class
    on job_class.code_job = ensq.corp_empl
inner join {{ ref("dim_mapper_stat_eng") }} stat on ensq.stat_eng = stat.stat_eng
left join  -- Requis pour aller chercher uniquement les codes concernés
    {{ ref("ens_qualification") }} qualif on ensq.type_qualif = qualif.code
