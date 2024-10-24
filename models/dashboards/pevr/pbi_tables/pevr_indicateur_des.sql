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
    -- Jumelage du perimetre élèves avec la table mentions
    perimetre as (
        select
            '1.1' as id_indicateur,
            sch.annee,
            sch.annee_scolaire,
            src.fiche,
            sch.school_friendly_name,
            mentions.ind_obtention,
            row_number() over (
                partition by src.fiche, sch.annee order by mentions.date_exec_sanct desc
            ) as seqid
        from {{ ref("stg_perimetre_eleve_frequentation_des") }} as src
        inner join {{ ref("dim_mapper_schools") }} as sch on src.id_eco = sch.id_eco
        left join
            {{ ref("fact_ri_mentions") }} as mentions
            on src.fiche = mentions.fiche
            and sch.annee = mentions.annee
        where
            sch.annee
            between {{ store.get_current_year() }}
            - 3 and {{ store.get_current_year() }}
            and mentions.indice_des = 1.0  -- dip DES
    ),

    -- Ajout des filtres utilisés dans le tableau de bord.
    _filtre as (
        select
            perim.annee,
            perim.annee_scolaire,
            perim.fiche,
            case
                when ind.id_indicateur_css is null
                then ind.id_indicateur_cdpvd  -- Permet d'utiliser l'indicateur défaut de la CDPVD
                else ind.id_indicateur_css
            end as id_indicateur,
            ind.description_indicateur,
            ind.cible,
            case
                when perim.school_friendly_name is null
                then '-'
                else perim.school_friendly_name
            end as school_friendly_name,
            perim.ind_obtention,
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
            case when y_stud.dist is null then '-' else y_stud.dist end as distribution
        from perimetre as perim
        inner join
            {{ ref("fact_yearly_student") }} as y_stud
            on perim.fiche = y_stud.fiche
            and perim.annee = y_stud.annee
        inner join
            {{ ref("dim_eleve") }} as ele on perim.fiche = ele.fiche
        inner join
            {{ ref("pevr_dim_indicateurs") }} as ind
            on perim.id_indicateur = ind.id_indicateur_cdpvd
        where seqid = 1
    ),

    -- Début de l'aggrégration
    agg_dip as (
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
            count(fiche) nb_resultat,
            cast(avg(ind_obtention) as decimal(5, 3)) as taux_diplomation,
            cast(((avg(ind_obtention)) - cible) as decimal(5, 3)) as ecart_cible,
            cible
        from _filtre
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

    -- Coalesce pour crée le choix 'Tout' dans les filtres.
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
            taux_diplomation,
            ecart_cible,
            cible
        from agg_dip
    )

select
    id_indicateur,
    description_indicateur,
    annee_scolaire,
    nb_resultat,
    taux_diplomation,
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
