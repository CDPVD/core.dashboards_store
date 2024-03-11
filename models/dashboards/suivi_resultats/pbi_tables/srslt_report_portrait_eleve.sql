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
{{ config(alias="report_portrait_eleve") }}

{% set courses = [
    "écrire",
    "lire",
    "raisonner",
    "résoudre",
    "comprendre",
    "communiquer",
] %}

with
    src_tab as (
        select
            fiche,
            id_eco,
            code_matiere,
            discipline,
            description_competence_abreg,
            niveau_res,
            no_comp,
            res_num_comp
        from {{ ref("srslt_report_suivi_resultats") }} as res

        where
            annee = {{ store.get_current_year() }}
            and (
                description_matiere like 'ANG%'
                or description_matiere like 'FRA%'
                or description_matiere like 'MAT%'
            )
    ),
    piv_tab as (
        select
            fiche,
            id_eco,
            niveau_res,
            max(lire) as lire,
            max(écrire) as écrire,
            max(résoudre) as résoudre,
            max(raisonner) as raisonner,
            max(communiquer) as communiquer,
            max(comprendre) as comprendre
        from
            (
                select
                    fiche,
                    id_eco,
                    niveau_res,
                    case
                        when description_competence_abreg = 'lire' then res_num_comp
                    end as 'Lire',
                    case
                        when description_competence_abreg = 'Écrire_fr'
                        then res_num_comp
                    end as 'Écrire',
                    case
                        when description_competence_abreg = 'Résoudre' then res_num_comp
                    end as 'Résoudre',
                    case
                        when description_competence_abreg = 'Raisonner'
                        then res_num_comp
                    end as 'Raisonner',
                    case
                        when description_competence_abreg = 'Communiquer_ang'
                        then res_num_comp
                    end as 'Communiquer',
                    case
                        when description_competence_abreg = 'Comprendre'
                        then res_num_comp
                    end as 'Comprendre'
                from src_tab
            ) as srctable
        group by fiche, id_eco, niveau_res

    )

select
    pt.fiche,
    dim_el.nom_prenom_fiche,
    el.population,
    el.eco,
    el.nom_ecole,
    el.annee,
    el.niveau_scolaire,
    el.grp_rep,
    el.is_doubleur,
    el.plan_interv_ehdaa,
    el.difficulte,
    el.type_mesure,
    el.age_30_sept,
    el.dist,
    niveau_res,
    -- indice echec    
    {% for i in courses %}
        case when {{ i }} < 60 then 'Oui' else 'Non' end as is_echec_{{ i }},
    {%- endfor -%}
    {% for i in courses %}
        case
            when {{ i }} between 60 and 69 then 'Oui' else 'Non'
        end as is_diff_{{ i }},
    {%- endfor -%}
    {% for i in courses %}
        case when {{ i }} >= 70 then 'Oui' else 'Non' end as is_maitrise_{{ i }},
    {%- endfor -%}

    -- résultats compétences    
    lire,
    écrire,
    résoudre,
    raisonner,
    communiquer,
    comprendre
from piv_tab as pt
inner join
    {{ ref("fact_yearly_student") }} as el
    on pt.fiche = el.fiche
    and pt.id_eco = el.id_eco
inner join {{ ref("dim_eleve") }} as dim_el on pt.fiche = dim_el.fiche
