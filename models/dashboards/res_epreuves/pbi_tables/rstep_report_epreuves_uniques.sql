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
            eco,
            population,
            plan_interv_ehdaa,
            code_matiere,
            description_matiere,
            mois_resultat,
            groupe,
            count(res.fiche) as nb_eleve,
            avg(is_reussite_epr) * 100 as taux_reussite_epreuve,
            avg(is_reussite_final) * 100 as taux_reussite_final,
            avg(is_reussite_ecole_brute) * 100 as taux_reussite_ecole_brute,
            avg(is_reussite_ecole_modere) * 100 as taux_reussite_ecole_modere,
            avg(is_difficulte_epreuve) * 100 as taux_difficulte_epreuve,
            avg(is_maitrise_epreuve) * 100 as taux_maitrise_epreuve,
            avg(is_echec_epreuve) * 100 as taux_echec_epreuve,
            avg(is_difficulte_final) * 100 as taux_difficulte_final,
            avg(is_maitrise_final) * 100 as taux_maitrise_final,
            avg(is_echec_final) * 100 as taux_echec_final,
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
        inner join {{ ref("dim_eleve") }} as dim_el on res.fiche = dim_el.fiche
        group by
            res.annee,
            code_matiere,
            description_matiere,
            mois_resultat, cube (eco, groupe, population, plan_interv_ehdaa)
    -- Add the statistis
    ),
    src as (
        select
            annee,
            mois_resultat,
            code_matiere,
            description_matiere,
            coalesce(eco, 'CSS') as ecole,
            coalesce(population, 'Tout') as population,
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
            taux_difficulte_epreuve,
            taux_maitrise_epreuve,
            taux_echec_epreuve,
            taux_difficulte_final,
            taux_maitrise_final,
            taux_echec_final,
            moyenne_final,
            ecart_type_ecole_brute,
            ecart_type_epreuve,
            moyenne_moderation,
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
    )
select
    {{
        dbt_utils.generate_surrogate_key(
            ["annee", "ecole", "mois_resultat", "code_matiere", "groupe"]
        )
    }} as id_epreuve,
    annee,
    mois_resultat,
    code_matiere,
    description_matiere,
    ecole,
    population,
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
    taux_reussite_epreuve - taux_reussite_epreuve_css as ecart_reussite_epr_ecole_css,
    taux_reussite_final - taux_reussite_final_css as ecart_reussite_final_ecole_css,
    moyenne_epreuve - moyenne_epreuve_css as ecart_moyenne_epr_ecole_css,
    moyenne_final - moyenne_final_css as ecart_moyenne_final_ecole_css,
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
    taux_reussite_ecole_brute_css,
    taux_reussite_ecole_modere_css,
    moyenne_ecole_brute_css,
    moyenne_ecole_modere_css,
    taux_reussite_epreuve_css,
    taux_reussite_final_css,
    moyenne_epreuve_css,
    moyenne_final_css,
    ecart_type_ecole_css,
    ecart_type_final_css,
    moyenne_moderation_css,
    moyenne_ecart_res_ecole_finale_css,
    moyenne_ecart_res_epreuve_css
from
    src as a
    cross apply(
        select
            avg(is_reussite_ecole_brute) * 100 as taux_reussite_ecole_brute_css,
            avg(is_reussite_ecole_modere) * 100 as taux_reussite_ecole_modere_css,
            avg(cast(res_ecole_brute as int)) as moyenne_ecole_brute_css,
            avg(cast(res_ecole_modere as int)) as moyenne_ecole_modere_css,
            avg(is_reussite_epr) * 100 as taux_reussite_epreuve_css,
            avg(is_reussite_final) * 100 as taux_reussite_final_css,
            avg(cast(res_ministere_num as int)) as moyenne_epreuve_css,
            avg(cast(res_final_num as int)) as moyenne_final_css,
            cast(
                stdev(cast(res_ecole_brute as int)) as decimal(4, 2)
            ) as ecart_type_ecole_css,
            cast(
                stdev(cast(res_final_num as int)) as decimal(4, 2)
            ) as ecart_type_final_css,
            cast(
                avg(cast(moderation as decimal(4, 2))) as decimal(4, 2)
            ) as moyenne_moderation_css,
            cast(
                avg(cast(ecart_res_ecole_finale as decimal(5, 2))) as decimal(4, 2)
            ) as moyenne_ecart_res_ecole_finale_css,
            cast(
                avg(cast(ecart_res_epreuve as decimal(5, 2))) as decimal(4, 2)
            ) as moyenne_ecart_res_epreuve_css
        from {{ ref("rstep_fact_epreuves_uniques") }} as b
        where
            b.annee = a.annee
            and b.code_matiere = a.code_matiere
            and b.mois_resultat = a.mois_resultat
        group by annee, code_matiere, description_matiere, mois_resultat
    ) c
