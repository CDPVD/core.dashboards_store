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
        alias="report_liste_eleves_epreuves_uniques",
    )
}}

select
    {{
        dbt_utils.generate_surrogate_key(
            [
                "annee_scolaire",
                "mapper_school.school_friendly_name",
                "mois_resultat",
                "code_matiere",
                "groupe",
            ]
        )
    }} as id_epreuve,
    src.fiche,
    nom_prenom_fiche,
    annee_scolaire,
    mapper_school.eco as code_ecole,
    mapper_school.school_friendly_name as ecole,
    population,
    genre,
    is_francisation,
    age_30_sept,
    plan_interv_ehdaa,
    dist,
    class,
    code_matiere,
    description_matiere,
    mois_resultat,
    groupe,
    res_ecole_brute,
    res_ecole_brute_min,
    res_ecole_modere,
    res_ministere_brute,
    res_ministere_conv,
    res_ministere_final,
    ind_reussite_charl,
    moderation,
    res_ministere_num,
    res_final_num,
    ecart_res_ecole_finale,
    ecart_res_epreuve,
    case when is_reussite_epr = 1 then 'Oui' else 'Non' end as descr_is_reussite_epr,
    is_reussite_epr,
    case
        when is_difficulte_epreuve = 1 then 'Oui' else 'Non'
    end as descr_is_difficulte_epreuve,
    is_difficulte_epreuve,
    case
        when is_maitrise_epreuve = 1 then 'Oui' else 'Non'
    end as descr_is_maitrise_epreuve,
    is_maitrise_epreuve,
    case when is_echec_epreuve = 1 then 'Oui' else 'Non' end as descr_is_echec_epreuve,
    is_echec_epreuve,
    case
        when is_reussite_final = 1 then 'Oui' else 'Non'
    end as descr_is_reussite_final,
    is_reussite_final,
    case
        when is_difficulte_final = 1 then 'Oui' else 'Non'
    end as descr_is_difficulte_final,
    is_difficulte_final,
    case
        when is_maitrise_final = 1 then 'Oui' else 'Non'
    end as descr_is_maitrise_final,
    is_maitrise_final,
    case when is_echec_final = 1 then 'Oui' else 'Non' end as descr_is_echec_final,
    is_res_epreuve_non_numerique,
    case
        when is_res_epreuve_non_numerique = 1 then 'Oui' else 'Non'
    end as descr_is_res_epreuve_non_numerique,
    is_echec_final
from {{ ref("rstep_fact_epreuves_uniques") }} src
inner join
    {{ ref("fact_yearly_student") }} as el_y
    on src.fiche = el_y.fiche
    and src.annee = el_y.annee
inner join {{ ref("dim_eleve") }} as el on src.fiche = el.fiche
inner join
    {{ ref("dim_mapper_schools") }} as mapper_school
    on el_y.eco = mapper_school.eco
    and src.annee = mapper_school.annee
