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
{{ config(alias="indicateurs_epreuves") }}


with
    src as (
        select
            res.annee,
            res.fiche,
            sch.eco,
            el.genre,
            y_stud.plan_interv_ehdaa,
            y_stud.population,
            y_stud.is_francisation,
            mat.code_matiere,
            mat.no_competence,
            etape,
            cast(is_maitrise as decimal(2, 1)) is_maitrise
        from {{ ref("fact_resultat_etape_competence") }} as res
        left join
            {{ ref("fact_yearly_student") }} as y_stud
            on y_stud.fiche = res.fiche
            and y_stud.id_eco = res.id_eco
        inner join {{ ref("dim_mapper_schools") }} as sch on res.id_eco = sch.id_eco
        inner join {{ ref("dim_eleve") }} as el on res.fiche = el.fiche
        inner join
            {{ ref("pevr_dim_indicateurs_matiere") }} as mat
            on res.code_matiere = mat.code_matiere
            and res.no_comp = mat.no_competence
        where
            res.annee
            between {{ store.get_current_year() }}
            - 2 and {{ store.get_current_year() }}
    ),
    agg as (
        select
            annee,
            eco,
            genre,
            plan_interv_ehdaa,
            population,
            is_francisation,
            code_matiere,
            no_competence,
            etape,
            count(fiche) nb_resultat,
            avg(is_maitrise) tx_maitrise
        from src
        group by
            annee,
            code_matiere,
            no_competence,
            etape, cube (eco, genre, plan_interv_ehdaa, population, is_francisation)
    )
select
    ind.id_indicateur,
    ind.description_indicateur,
    agg.annee,
    coalesce(agg.eco, 'CSS') as eco,
    coalesce(school_friendly_name, 'CSS') as nom_ecole,
    coalesce(genre, 'Tout') as genre,
    coalesce(plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
    coalesce(population, 'Tout') as population,
    coalesce(cast(is_francisation as varchar), 'Tout') as is_francisation,
    agg.code_matiere,
    agg.no_competence,
    etape,
    nb_resultat,
    tx_maitrise
from agg
left join
    {{ ref("dim_mapper_schools") }} as sch
    on agg.annee = sch.annee
    and agg.eco = sch.eco
inner join
    {{ ref("pevr_dim_indicateurs_matiere") }} as ind
    on agg.code_matiere = ind.code_matiere
