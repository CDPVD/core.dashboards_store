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
{{ config(alias="indicateurs_ppp") }}

with
    src as (
        select
            y_stud.annee,
            y_stud.fiche,
            y_stud.eco,
            ele.genre,
            y_stud.plan_interv_ehdaa,
            y_stud.population,
            case
                when y_stud.dist is null then '-' else y_stud.dist
            end as code_distribution,
            case
                when y_stud.grp_rep is null then '-' else y_stud.grp_rep
            end as grp_rep,
            case
                when y_stud.class is null then '-' else y_stud.class
            end as classification
            case when y_stud.is_ppp = 1 then 1. else 0. end as is_ppp
        from {{ ref("fact_yearly_student") }} y_stud
        inner join {{ ref("dim_eleve") }} as ele on y_stud.fiche = ele.fiche
        where
            ordre_ens = 4
            and annee
            between {{ store.get_current_year() }}
            - 3 and {{ store.get_current_year() }}
    ),
    ppp as (
        select
            '1.3.4.11' as id_indicateur,
            annee,
            eco,
            genre,
            plan_interv_ehdaa,
            population,
            code_distribution,
            grp_rep,
            classification,
            sum(is_ppp) as nb_ppp,
            avg(is_ppp) as taux_ppp
        from src
        group by
            annee, cube (
                eco,
                genre,
                plan_interv_ehdaa,
                population,
                code_distribution,
                grp_rep,
                classification
            )
    ),

    _coalesce as (
        select
            ind.id_indicateur,
            ind.description_indicateur,
            ppp.annee,
            coalesce(sch.school_friendly_name, 'CSS') as school_friendly_name,
            coalesce(ppp.genre, 'Tout') as genre,
            coalesce(ppp.plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            coalesce(ppp.population, 'Tout') as population,
            coalesce(ppp.code_distribution, 'Tout') as code_distribution,
            coalesce(ppp.grp_rep, 'Tout') as grp_rep,
            coalesce(ppp.classification, 'Tout') as classification,
            nb_ppp,
            taux_ppp
        from ppp
        left join
            {{ ref("dim_mapper_schools") }} as sch
            on ppp.annee = sch.annee
            and ppp.eco = sch.eco
        inner join
            {{ ref("pevr_dim_indicateurs") }} as ind
            on ppp.id_indicateur = ind.id_indicateur
    )

select
    id_indicateur,
    description_indicateur,
    annee,
    nb_resultat,
    taux_ppp,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "school_friendly_name",
                "plan_interv_ehdaa",
                "genre",
                "population",
                "code_distribution",
                "grp_rep",
                "classification",
            ]
        )
    }} as id_filtre
from _coalesce
