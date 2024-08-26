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
{{ config(alias="fact_effectif_css") }}


with
    src as (
        select *
        from {{ ref("fact_yearly_student") }}
        where annee between {{ get_current_year() }} -4 and {{ get_current_year() }} + 1
    ),

    el as (
        select
            src.code_perm,
            annee,
            population,
            ele.genre,
            eco,
            -- eco.nom_eco,
            classe,
            class,
            ordre_ens,
            plan_interv_ehdaa,
            difficulte,
            niveau_scolaire,
            dist,
            is_doubleur,
            is_francisation,
            type_mesure,
            grp_rep
        from src
        left join {{ ref("dim_eleve") }} as ele on src.fiche = ele.fiche
    )

select *
from el
