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
{{ config(alias="emp_abs_report_abs") }}

select distinct
    annee,
    abs.matricule,
    round(age, 0) age,
    date_naissance,
    abs.corp_empl,
    genre,
    lieu_trav,
    wk.workplace_name as lieu_nom,
    sec.secteur_id as secteur,
    motif_abs,
    mo.descr,
    ta.categories,
    startdate as date_debut,
    enddate as date_fin,
    {{
        dbt_utils.generate_surrogate_key(
            ["annee", "abs.corp_empl", "lieu_trav", "categories", "genre"]
        )
    }} as filter_key
from {{ ref("fact_abs") }} as abs

inner join {{ ref("dim_mapper_workplace") }} as wk on abs.lieu_trav = wk.workplace

left join
    {{ ref("type_absence") }} as ta  -- À modifier
    on abs.motif_abs = ta.motif_id

inner join
    {{ ref("i_pai_tab_mot_abs") }} as mo  -- À modifier
    on abs.motif_abs = mo.mot_abs
    and abs.reg_abs = mo.reg_abs

inner join {{ ref("secteur") }} as sec on abs.lieu_trav = sec.ua_id
