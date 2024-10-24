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
{{ config(alias="indicateur_ppp") }}

with
    src as (
        select
            '6' as id_indicateur,
            sch.annee_scolaire,
            sch.annee,
            case
                when sch.school_friendly_name is null
                then '-'
                else sch.school_friendly_name
            end as school_friendly_name,
            case when ele.genre is null then '-' else ele.genre end as genre,
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
            case when y_stud.is_ppp = 1 then 1. else 0. end as is_ppp
        from {{ ref("fact_yearly_student") }} y_stud
        inner join {{ ref("dim_eleve") }} as ele on y_stud.fiche = ele.fiche
        inner join {{ ref("dim_mapper_schools") }} as sch on y_stud.id_eco = sch.id_eco
        where
            ordre_ens = 4
            and sch.annee
            between {{ store.get_current_year() }}
            - 3 and {{ store.get_current_year() }}
    ),

    ind_pevr as (
        select
            case
                when ind.id_indicateur_css is null
                then ind.id_indicateur_cdpvd  -- Permet d'utiliser l'indicateur défaut de la CDPVD
                else ind.id_indicateur_css
            end as id_indicateur,
            ind.description_indicateur,
            ind.cible,
            is_ppp,
            annee_scolaire,
            school_friendly_name,
            genre,
            plan_interv_ehdaa,
            population,
            classification,
            distribution
        from src
        inner join
            "tbe_dev"."busquef_dashboard_pevr"."dim_indicateurs_pevr" as ind
            on src.id_indicateur = ind.id_indicateur_cdpvd
    ),

    ppp as (
        select
            annee_scolaire,
            school_friendly_name,
            genre,
            plan_interv_ehdaa,
            population,
            classification,
            distribution,
            id_indicateur,
            description_indicateur,
            sum(is_ppp) as nb_ppp,
            avg(is_ppp) as taux_ppp,
            cast(((avg(is_ppp)) - cible) as decimal(5, 3)) as ecart_cible,
            cible
        from ind_pevr
        group by
            annee_scolaire,
            id_indicateur,
            description_indicateur,
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
            nb_ppp,
            taux_ppp,
            ecart_cible,
            cible
        from ppp
    )

select
    id_indicateur,
    description_indicateur,
    annee_scolaire,
    nb_ppp,
    taux_ppp,
    ecart_cible,
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
