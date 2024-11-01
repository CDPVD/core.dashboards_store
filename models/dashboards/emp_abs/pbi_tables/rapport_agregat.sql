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
{{ config(alias="emp_abs_report_final") }}

select distinct
    annee,
    matricule,
    -- ref_empl,
    -- gr_paie,
    genre,
    corp_empl,
    categories,
    abs.lieu_trav,
    total,
    nbrjour,
    moyenne,
    nombre_absence_cat as nbr_abs,
    lundi,
    mardi,
    mercredi,
    jeudi,
    vendredi,
    taux,
    -- jour_trav,
    sec.secteur_id as secteur,
    tranche_age,
    {{
        dbt_utils.generate_surrogate_key(
            ["annee", "abs.corp_empl", "lieu_trav", "abs.categories", "genre"]
        )
    }} as filter_key
from {{ ref("emp_abs_fact_dash") }} as abs

inner join {{ ref("dim_mapper_workplace") }} as wk on abs.lieu_trav = wk.workplace

inner join {{ ref("secteur") }} as sec on abs.lieu_trav = sec.ua_id
