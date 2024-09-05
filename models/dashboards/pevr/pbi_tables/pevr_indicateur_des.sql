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

{{ config(alias="indicateur_des") }}
with
    --Jumelage du perimetre élèves avec la table mentions
    perimetre as (
        select
            sch.annee,
            sch.annee_scolaire,
            src.fiche,
            sch.school_friendly_name,
            mentions.ind_obtention
        from {{ ref("stg_perimetre_eleve_diplomation_des") }} as src
        inner join {{ ref("dim_mapper_schools") }} as sch on src.id_eco = sch.id_eco
        left join {{ ref("stg_ri_mentions")}} as mentions on src.fiche = mentions.fiche and sch.annee = mentions.annee
        where
            sch.annee
            between {{ store.get_current_year() }}
            - 3 and {{ store.get_current_year() }}
    ),

    --Ajout des filtres utilisés dans le tableau de bord.
    _filtre as (
        select
            perim.annee,
            perim.annee_scolaire,
            perim.fiche,
            perim.school_friendly_name,
            perim.ind_obtention,
            ele.genre,
            y_stud.plan_interv_ehdaa,
            y_stud.population,
            case
                when y_stud.class is null then '-' else y_stud.class
            end as classification
        from perimetre as perim
        inner join
            {{ ref("fact_yearly_student") }} as y_stud
            on perim.fiche = y_stud.fiche
            and perim.annee = y_stud.annee
        inner join {{ ref("dim_eleve") }} as ele on perim.fiche = ele.fiche
    ),

    --Début de l'aggrégration
    agg_dip as (
        select
            '1.1.1.1' as id_indicateur,
            annee_scolaire,
            school_friendly_name,
            genre,
            plan_interv_ehdaa,
            population,
            classification,
            count(fiche) nb_resultat,
            avg(ind_obtention) as taux_diplomation
        from _filtre
        group by
            annee_scolaire, cube (
                school_friendly_name,
                genre,
                plan_interv_ehdaa,
                population,
                classification
            )
    ),

    --Coalesce pour crée le choix 'Tout' dans les filtres.
    _coalesce as (
        select
            ind.id_indicateur,
            ind.description_indicateur,
            agg_dip.annee_scolaire,
            coalesce(agg_dip.school_friendly_name, 'CSS') as ecole,
            coalesce(agg_dip.genre, 'Tout') as genre,
            coalesce(agg_dip.plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            coalesce(agg_dip.population, 'Tout') as population,
            coalesce(agg_dip.classification, 'Tout') as classification,
            agg_dip.nb_resultat,
            agg_dip.taux_diplomation
        from agg_dip
        inner join
            {{ ref("pevr_dim_indicateurs") }} as ind
            on agg_dip.id_indicateur = ind.id_indicateur
    )

select
    id_indicateur,
    description_indicateur,
    annee_scolaire,
    nb_resultat,
    taux_diplomation,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "ecole",
                "plan_interv_ehdaa",
                "genre",
                "population",
                "classification",
            ]
        )
    }} as id_filtre
from _coalesce
