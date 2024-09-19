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
    ppp as (
        select
            '1.3.4.11' as id_indicateur,
            annee_scolaire,
            school_friendly_name,
            genre,
            plan_interv_ehdaa,
            population,
            classification,
            distribution,
            sum(is_ppp) as nb_ppp,
            avg(is_ppp) as taux_ppp
        from src
        group by
            annee_scolaire, cube (
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
            ind.id_indicateur,
            ind.description_indicateur,
            ppp.annee_scolaire,
            coalesce(ppp.school_friendly_name, 'CSS') as ecole,
            coalesce(ppp.genre, 'Tout') as genre,
            coalesce(ppp.plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            coalesce(ppp.population, 'Tout') as population,
            coalesce(ppp.classification, 'Tout') as classification,
            coalesce(ppp.distribution, 'Tout') as distribution,
            nb_ppp,
            taux_ppp
        from ppp
        inner join
            {{ ref("pevr_dim_indicateurs") }} as ind
            on ppp.id_indicateur = ind.id_indicateur
    )

select
    id_indicateur,
    description_indicateur,
    annee_scolaire,
    nb_ppp,
    taux_ppp,
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
