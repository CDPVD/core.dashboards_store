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
{{
    config(
        alias="report_epreuves_uniques",
    )
}}

with
    stat_css as (
        select
            res.annee,
            annee_scolaire,
            mapper_school.school_friendly_name as ecole,
            population,
            genre,
            plan_interv_ehdaa,
            code_matiere,
            description_matiere,
            mois_resultat,
            groupe,
            count(res.fiche) as nb_eleve,
            avg(is_reussite_epr) as taux_reussite_epreuve,
            avg(is_reussite_final) as taux_reussite_final,
            avg(is_reussite_ecole_brute) as taux_reussite_ecole_brute,
            avg(is_reussite_ecole_modere) as taux_reussite_ecole_modere,
            avg(is_difficulte_epreuve) as taux_difficulte_epreuve,
            avg(is_maitrise_epreuve) as taux_maitrise_epreuve,
            avg(is_echec_epreuve) as taux_echec_epreuve,
            avg(is_difficulte_final) as taux_difficulte_final,
            avg(is_maitrise_final) as taux_maitrise_final,
            avg(is_echec_final) as taux_echec_final,
            sum(is_reussite_epr) as nb_reussite_epreuve,
            sum(is_reussite_final) as nb_reussite_final,
            sum(is_difficulte_epreuve) as nb_difficulte_epreuve,
            sum(is_maitrise_epreuve) as nb_maitrise_epreuve,
            sum(is_echec_epreuve) as nb_echec_epreuve,
            sum(is_difficulte_final) as nb_difficulte_final,
            sum(is_maitrise_final) as nb_maitrise_final,
            sum(is_echec_final) as nb_echec_final,
            avg(cast(res_ministere_num as int)) as moyenne_epreuve,
            avg(cast(res_final_num as int)) as moyenne_final,
            avg(cast(res_ecole_brute as int)) as moyenne_ecole_brute,
            avg(cast(res_ecole_modere as int)) as moyenne_ecole_modere,
            cast(
                stdev(cast(res_ecole_brute as int)) as decimal(4, 2)
            ) as ecart_type_ecole_brute,
            cast(
                stdev(cast(res_ministere_num as int)) as decimal(4, 2)
            ) as ecart_type_epreuve,
            cast(
                avg(cast(moderation as decimal(4, 2))) as decimal(4, 2)
            ) as moyenne_moderation,
            cast(
                avg(cast(ecart_res_ecole_finale as decimal(5, 2))) as decimal(4, 2)
            ) as moyenne_ecart_res_ecole_finale,
            cast(
                avg(cast(ecart_res_epreuve as decimal(5, 2))) as decimal(4, 2)
            ) as moyenne_ecart_res_epreuve
        from {{ ref("rstep_fact_epreuves_uniques") }} res
        inner join
            {{ ref("fact_yearly_student") }} as el
            on res.fiche = el.fiche
            and res.annee = el.annee
        inner join
            {{ ref("dim_eleve") }} as dim_el
            on res.fiche = dim_el.fiche
            and genre != 'x'
        inner join
            {{ ref("dim_mapper_schools") }} as mapper_school
            on el.eco = mapper_school.eco
            and res.annee = mapper_school.annee
        where res_ministere_num is not null or res_final_num is not null
        group by
            res.annee,
            annee_scolaire,
            code_matiere,
            description_matiere,
            mois_resultat, cube (
                mapper_school.school_friendly_name,
                groupe,
                population,
                genre,
                plan_interv_ehdaa
            )
    -- Add the statistis
    ),
    src as (
        select
            annee,
            annee_scolaire,
            mois_resultat,
            code_matiere,
            description_matiere,
            coalesce(ecole, 'CSS') as ecole,
            coalesce(population, 'Tout') as population,
            coalesce(genre, 'Tout') as genre,
            coalesce(plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            coalesce(groupe, 'Tout') as groupe,
            nb_eleve,
            taux_reussite_ecole_brute,
            moyenne_ecole_brute,
            taux_reussite_ecole_modere,
            moyenne_ecole_modere,
            taux_reussite_epreuve,
            moyenne_epreuve,
            taux_reussite_final,
            moyenne_final,
            moyenne_moderation,
            taux_difficulte_epreuve,
            taux_maitrise_epreuve,
            taux_echec_epreuve,
            taux_difficulte_final,
            taux_maitrise_final,
            taux_echec_final,
            ecart_type_ecole_brute,
            ecart_type_epreuve,
            moyenne_ecart_res_ecole_finale,
            moyenne_ecart_res_epreuve,
            nb_reussite_epreuve,
            nb_reussite_final,
            nb_difficulte_epreuve,
            nb_maitrise_epreuve,
            nb_echec_epreuve,
            nb_difficulte_final,
            nb_maitrise_final,
            nb_echec_final
        from stat_css
    ),
    css as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    [
                        "annee_scolaire",
                        "ecole",
                        "mois_resultat",
                        "code_matiere",
                        "groupe",
                    ]
                )
            }} as id_epreuve,
            annee_scolaire,
            mois_resultat,
            code_matiere,
            description_matiere,
            ecole,
            population,
            genre,
            plan_interv_ehdaa,
            groupe,
            nb_eleve,
            taux_reussite_ecole_brute,
            moyenne_ecole_brute,
            taux_reussite_ecole_modere,
            moyenne_ecole_modere,
            taux_reussite_epreuve,
            moyenne_epreuve,
            taux_reussite_final,
            moyenne_final,
            ecart_type_ecole_brute,
            ecart_type_epreuve,
            moyenne_moderation,
            moyenne_ecart_res_ecole_finale,
            moyenne_ecart_res_epreuve,
            (taux_reussite_epreuve - taux_reussite_epreuve_css)
            * 100 as ecart_reussite_epr_ecole_css,
            (taux_reussite_final - taux_reussite_final_css)
            * 100 as ecart_reussite_final_ecole_css,
            moyenne_epreuve - moyenne_epreuve_css as ecart_moyenne_epr_ecole_css,
            moyenne_final - moyenne_final_css as ecart_moyenne_final_ecole_css,
            taux_reussite_epreuve_css,
            taux_reussite_final_css,
            moyenne_epreuve_css,
            moyenne_final_css,
            taux_difficulte_epreuve,
            taux_maitrise_epreuve,
            taux_echec_epreuve,
            taux_difficulte_final,
            taux_maitrise_final,
            taux_echec_final,
            nb_reussite_epreuve,
            nb_reussite_final,
            nb_difficulte_epreuve,
            nb_maitrise_epreuve,
            nb_echec_epreuve,
            nb_difficulte_final,
            nb_maitrise_final,
            nb_echec_final
        from
            src as a
            cross apply(
                select
                    taux_reussite_ecole_brute as taux_reussite_ecole_brute_css,
                    moyenne_ecole_brute as moyenne_ecole_brute_css,
                    taux_reussite_ecole_modere as taux_reussite_ecole_modere_css,
                    moyenne_ecole_modere as moyenne_ecole_modere_css,
                    taux_reussite_epreuve as taux_reussite_epreuve_css,
                    moyenne_epreuve as moyenne_epreuve_css,
                    taux_reussite_final as taux_reussite_final_css,
                    moyenne_final as moyenne_final_css,
                    ecart_type_ecole_brute as ecart_type_ecole_css,
                    ecart_type_epreuve as ecart_type_final_css,
                    moyenne_moderation as moyenne_moderation_css,
                    moyenne_ecart_res_ecole_finale
                    as moyenne_ecart_res_ecole_finale_css,
                    moyenne_ecart_res_epreuve as moyenne_ecart_res_epreuve_css
                from src as b
                where
                    b.annee = a.annee
                    and b.code_matiere = a.code_matiere
                    and b.mois_resultat = a.mois_resultat
                    and b.ecole = 'CSS'
                    and b.genre = 'tout'
                    and b.population = 'tout'
                    and b.plan_interv_ehdaa = 'tout'
                    and b.groupe = 'Tout'
            ) c
    ),
    provincial as (
        select
            id_epreuve,
            annee_scolaire,
            mois_resultat,
            code_matiere,
            description_matiere,
            ecole,
            population,
            genre,
            plan_interv_ehdaa,
            groupe,
            nb_eleve,
            taux_reussite_ecole_brute,
            moyenne_ecole_brute,
            taux_reussite_ecole_modere,
            moyenne_ecole_modere,
            taux_reussite_epreuve,
            moyenne_epreuve,
            taux_reussite_final,
            moyenne_final,
            ecart_type_ecole_brute,
            ecart_type_epreuve,
            moyenne_moderation,
            moyenne_ecart_res_ecole_finale,
            moyenne_ecart_res_epreuve,
            ecart_reussite_epr_ecole_css,
            ecart_reussite_final_ecole_css,
            ecart_moyenne_epr_ecole_css,
            ecart_moyenne_final_ecole_css,
            (taux_reussite_epreuve - taux_reussite_epreuve_provincial)
            * 100 as ecart_reussite_epr_ecole_provincial,
            (taux_reussite_final - taux_reussite_final_provincial)
            * 100 as ecart_reussite_final_ecole_provincial,
            moyenne_epreuve
            - moyenne_epreuve_provincial as ecart_moyenne_epr_ecole_provincial,
            moyenne_final
            - moyenne_final_provincial as ecart_moyenne_final_ecole_provincial,
            taux_reussite_epreuve_css,
            taux_reussite_final_css,
            moyenne_epreuve_css,
            moyenne_final_css,
            taux_reussite_epreuve_provincial,
            taux_reussite_final_provincial,
            moyenne_epreuve_provincial,
            moyenne_final_provincial,
            taux_difficulte_epreuve,
            taux_maitrise_epreuve,
            taux_echec_epreuve,
            taux_difficulte_final,
            taux_maitrise_final,
            taux_echec_final,
            nb_reussite_epreuve,
            nb_reussite_final,
            nb_difficulte_epreuve,
            nb_maitrise_epreuve,
            nb_echec_epreuve,
            nb_difficulte_final,
            nb_maitrise_final,
            nb_echec_final,
            moyenne_moderation_provincial
        from
            css as a
            cross apply(
                select
                    taux_reussite_ecole_brute as taux_reussite_ecole_brute_provincial,
                    moyenne_ecole_brute as moyenne_ecole_brute_provincial,
                    taux_reussite_ecole_modere as taux_reussite_ecole_modere_provincial,
                    moyenne_ecole_modere as moyenne_ecole_modere_provincial,
                    taux_reussite_epreuve as taux_reussite_epreuve_provincial,
                    moyenne_epreuve as moyenne_epreuve_provincial,
                    taux_reussite_final as taux_reussite_final_provincial,
                    moyenne_final as moyenne_final_provincial,
                    moderation as moyenne_moderation_provincial,
                    moyenne_ecart_res_ecole_finale
                    as moyenne_ecart_res_ecole_finale_provincial,
                    moyenne_ecart_res_epreuve as moyenne_ecart_res_epreuve_provincial
                from {{ ref("rstep_stg_resultats_ministere") }} as b
                where
                    b.annee_scolaire = a.annee_scolaire
                    and b.code_matiere = a.code_matiere
                    and b.mois_resultat = a.mois_resultat
                    and ecole = 'Provincial'

            ) c

    ),
    regional as (
        select
            id_epreuve,
            annee_scolaire,
            mois_resultat,
            code_matiere,
            description_matiere,
            ecole,
            population,
            genre,
            plan_interv_ehdaa,
            groupe,
            nb_eleve,
            taux_reussite_ecole_brute,
            moyenne_ecole_brute,
            taux_reussite_ecole_modere,
            moyenne_ecole_modere,
            taux_reussite_epreuve,
            moyenne_epreuve,
            taux_reussite_final,
            moyenne_final,
            ecart_type_ecole_brute,
            ecart_type_epreuve,
            moyenne_moderation,
            moyenne_ecart_res_ecole_finale,
            moyenne_ecart_res_epreuve,
            ecart_reussite_epr_ecole_css,
            ecart_reussite_final_ecole_css,
            ecart_moyenne_epr_ecole_css,
            ecart_moyenne_final_ecole_css,
            ecart_reussite_epr_ecole_provincial,
            ecart_reussite_final_ecole_provincial,
            ecart_moyenne_epr_ecole_provincial,
            ecart_moyenne_final_ecole_provincial,
            (taux_reussite_epreuve - taux_reussite_epreuve_régional)
            * 100 as ecart_reussite_epr_ecole_régional,
            (taux_reussite_final - taux_reussite_final_régional)
            * 100 as ecart_reussite_final_ecole_régional,
            moyenne_epreuve
            - moyenne_epreuve_régional as ecart_moyenne_epr_ecole_régional,
            moyenne_final
            - moyenne_final_régional as ecart_moyenne_final_ecole_régional,
            taux_reussite_epreuve_css,
            taux_reussite_final_css,
            moyenne_epreuve_css,
            moyenne_final_css,
            taux_reussite_epreuve_provincial,
            taux_reussite_final_provincial,
            moyenne_epreuve_provincial,
            moyenne_final_provincial,
            taux_reussite_epreuve_régional,
            taux_reussite_final_régional,
            moyenne_epreuve_régional,
            moyenne_final_régional,
            taux_difficulte_epreuve,
            taux_maitrise_epreuve,
            taux_echec_epreuve,
            taux_difficulte_final,
            taux_maitrise_final,
            taux_echec_final,
            nb_reussite_epreuve,
            nb_reussite_final,
            nb_difficulte_epreuve,
            nb_maitrise_epreuve,
            nb_echec_epreuve,
            nb_difficulte_final,
            nb_maitrise_final,
            nb_echec_final,
            moyenne_moderation_provincial,
            moyenne_moderation_régional
        from
            provincial as a
            cross apply(
                select
                    taux_reussite_ecole_brute as taux_reussite_ecole_brute_régional,
                    moyenne_ecole_brute as moyenne_ecole_brute_régional,
                    taux_reussite_ecole_modere as taux_reussite_ecole_modere_régional,
                    moyenne_ecole_modere as moyenne_ecole_modere_régional,
                    taux_reussite_epreuve as taux_reussite_epreuve_régional,
                    moyenne_epreuve as moyenne_epreuve_régional,
                    taux_reussite_final as taux_reussite_final_régional,
                    moyenne_final as moyenne_final_régional,
                    moderation as moyenne_moderation_régional,
                    moyenne_ecart_res_ecole_finale
                    as moyenne_ecart_res_ecole_finale_régional,
                    moyenne_ecart_res_epreuve as moyenne_ecart_res_epreuve_régional
                from {{ ref("rstep_stg_resultats_ministere") }} as b
                where
                    b.annee_scolaire = a.annee_scolaire
                    and b.code_matiere = a.code_matiere
                    and b.mois_resultat = a.mois_resultat
                    and ecole = 'Régional'

            ) c

    )
select *
from regional
