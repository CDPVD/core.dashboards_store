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
{{ config(alias="indicateur_epreuves") }}


with
    src as (
        select
            case
                when ind.id_indicateur_css is null
                then ind.id_indicateur_cdpvd  -- Permet d'utiliser l'indicateur défaut de la CDPVD
                else ind.id_indicateur_css
            end as id_indicateur,
            ind.description_indicateur,
            ind.cible,
            res.annee,
            sch.annee_scolaire,
            res.fiche,
            case
                when sch.school_friendly_name is null
                then '-'
                else sch.school_friendly_name
            end as school_friendly_name,
            case when el.genre is null then '-' else el.genre end as genre,
            case
                when y_stud.plan_interv_ehdaa is null
                then '-'
                else y_stud.plan_interv_ehdaa
            end as plan_interv_ehdaa,
            case
                when y_stud.population is null then '-' else y_stud.population
            end as population,
            case
                when y_stud.class is null then '-' else y_stud.class
            end as classification,
            case when y_stud.dist is null then '-' else y_stud.dist end as distribution,
            ind.code_matiere,
            ind.no_competence,
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
            {{ ref("pevr_dim_indicateurs") }} as ind
            on res.code_matiere = ind.code_matiere
            and res.no_comp = ind.no_competence
        where
            res.annee
            between {{ store.get_current_year() }}
            - 3 and {{ store.get_current_year() }}
            and etape = 'EX'
            and id_indicateur_cdpvd in ('4')  -- Au cas-où qu'on utilise le champs code_matière pour d'autre indicateur
    ),

    agg as (
        select
            id_indicateur,
            description_indicateur,
            cible,
            annee_scolaire,
            school_friendly_name,
            genre,
            plan_interv_ehdaa,
            population,
            classification,
            distribution,
            code_matiere,
            count(fiche) nb_resultat,
            cast(avg(is_maitrise) as decimal(5, 3)) as taux_maitrise,
            cast(((avg(is_maitrise)) - cible) as decimal(5, 3)) as ecart_cible
        from src
        group by
            id_indicateur,
            description_indicateur,
            annee_scolaire,
            code_matiere,
            cible, cube (
                school_friendly_name,
                genre,
                plan_interv_ehdaa,
                population,
                classification,
                distribution
            )
    ),

    _coalesce as (
        select
            id_indicateur,
            description_indicateur,
            annee_scolaire,
            coalesce(school_friendly_name, 'CSS') as ecole,
            coalesce(genre, 'Tout') as genre,
            coalesce(plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            coalesce(population, 'Tout') as population,
            coalesce(classification, 'Tout') as classification,
            coalesce(distribution, 'Tout') as distribution,
            nb_resultat,
            taux_maitrise,
            ecart_cible,
            cible
        from agg
    )

select
    id_indicateur,
    description_indicateur,
    annee_scolaire,
    nb_resultat,
    taux_maitrise,  -- Possibilité d'avoir un null à cause du res_etape_num peut être nulle. A voir.
    ecart_cible,  -- Même affaire.
    cible,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "ecole",
                "plan_interv_ehdaa",
                "genre",
                "population",
                "classification",
                "distribution",
            ]
        )
    }} as id_filtre
from _coalesce
