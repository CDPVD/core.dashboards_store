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
{{ config(alias="report_effectif_css") }}

with
    agg as (
        select
            annee,
            eco,
            ordre_ens,
            niveau_scolaire,
            plan_interv_ehdaa,
            difficulte,
            population,
            genre,
            dist,
            class,
            grp_rep,
            is_doubleur,
            is_francisation,
            type_mesure,
            count(code_perm) as total_ele
        from {{ ref("eff_fact_effectif_css") }}
        group by
            annee,
            eco,
            genre,
            ordre_ens,
            population,
            niveau_scolaire,
            dist,
            class,
            grp_rep,
            plan_interv_ehdaa,
            is_doubleur,
            is_francisation,
            type_mesure,
            difficulte
    )
select
    agg.annee,
    school_friendly_name as code_ecole,
    agg.ordre_ens,
    case
        when niveau_scolaire = 'mat 4'
        then 'Maternelle 4'
        when niveau_scolaire = 'mat 5'
        then 'Maternelle 5'
        when niveau_scolaire = 'Prim 1'
        then 'Primaire 1'
        when niveau_scolaire = 'Prim 2'
        then 'Primaire 2'
        when niveau_scolaire = 'Prim 3'
        then 'Primaire 3'
        when niveau_scolaire = 'Prim 4'
        then 'Primaire 4'
        when niveau_scolaire = 'Prim 5'
        then 'Primaire 5'
        when niveau_scolaire = 'Prim 6'
        then 'Primaire 6'
        else niveau_scolaire
    end as niveau_scolaire,
    plan_interv_ehdaa,
    difficulte,
    case
        when population = 'prescolaire'
        then 'Prescolaire'
        when population = 'primaire_reg'
        then 'Primaire régulier'
        when population = 'primaire_adapt'
        then 'Primaire adapté'
        when population = 'secondaire_reg'
        then 'Secondaire régulier'
        when population = 'secondaire_adapt'
        then 'Secondaire adapté'
        else population
    end as population,
    genre,
    dist,
    class,
    grp_rep,
    is_doubleur,
    is_francisation,
    type_mesure,
    total_ele
from agg
inner join
    {{ ref("dim_mapper_schools") }} as sch
    on agg.eco = sch.eco
    and agg.annee = sch.annee
