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
        alias="report_liste_eleves_epreuves_obligatoires_internes",
    )
}}

select
    {{
        dbt_utils.generate_surrogate_key(
            ["src.annee_scolaire", "src.ecole", "description_matiere"]
        )
    }} as id_epreuve,
    src.fiche,
    nom_prenom_fiche,
    src.annee_scolaire,
    src.ecole,
    eco as code_ecole,
    population,
    genre,
    is_francisation,
    age_30_sept,
    plan_interv_ehdaa,
    dist,
    class,
    grp_rep,
    difficulte,
    description_matiere,
    res_comp_etape,
    res_etape_num,
    is_reussite,
    is_echec,
    is_difficulte,
    is_maitrise,
    case when is_reussite = 1 then 'Oui' else 'Non' end as descr_is_reussite,
    case when is_echec = 1 then 'Oui' else 'Non' end as descr_is_echec,
    case when is_difficulte = 1 then 'Oui' else 'Non' end as descr_is_difficulte,
    case when is_maitrise = 1 then 'Oui' else 'Non' end as descr_is_maitrise,
    is_reprise
from {{ ref("rstep_fact_epreuves_obligatoires_internes") }} src
left join
    {{ ref("fact_yearly_student") }} as el_y
    on src.fiche = el_y.fiche
    and src.annee = el_y.annee
left join {{ ref("dim_eleve") }} as el on src.fiche = el.fiche
