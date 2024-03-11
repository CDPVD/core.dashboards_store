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
{{ config(alias="report_suivi_resultats") }}

with
    perim as (
        select fiche, id_eco, ordre_ens
        from {{ ref("fact_yearly_student") }}
        where annee = {{ store.get_current_year() }}
    ),
    src as (
        select
            el.id_eco,
            el.fiche,
            mat.annee,
            el.ordre_ens,
            mat.code_matiere,
            mat.groupe_matiere,
            mat.etat,
            dim.description_matiere,
            res_num_som,
            mat.is_previous_echec as is_previous_matiere_echec,
            mat.is_previous_difficulte as is_previous_matiere_difficulte,
            mat.is_previous_maitrise as is_previous_matiere_maitrise,
            mat.is_current_echec as is_current_matiere_echec,
            mat.is_current_difficulte as is_current_matiere_difficulte,
            mat.is_current_maitrise as is_current_matiere_maitrise,
            mat.is_reussite as is_reussite_mat,
            no_comp,
            res_num_comp,
            comp.is_previous_echec as is_previous_competence_echec,
            comp.is_previous_difficulte as is_previous_competence_difficulte,
            comp.is_previous_maitrise as is_previous_competence_maitrise,
            comp.is_current_echec as is_current_competence_echec,
            comp.is_current_difficulte as is_current_competence_difficulte,
            comp.is_current_maitrise as is_current_competence_maitrise,
            comp.is_reussite as is_reussite_comp,
            niveau_res
        from perim as el
        left join
            {{ ref("fact_resultat_bilan_matiere") }} as mat
            on mat.fiche = el.fiche
            and mat.annee
            between {{ store.get_current_year() }}
            - 4 and {{ store.get_current_year() }}
        left join
            {{ ref("fact_resultat_bilan_competence") }} as comp
            on mat.fiche = comp.fiche
            and mat.code_matiere = comp.code_matiere
            and mat.groupe_matiere = comp.groupe_matiere
            and mat.id_eco = comp.id_eco
        inner join
            {{ ref("srslt_dim_matieres_suivi") }} as dim
            on dim.code_matiere = mat.code_matiere  -- Only keep the tracked courses           
        where
            mat.etat != 0
            and comp.etat != 0
            and mat.is_reprise = 0
            and comp.is_reprise = 0

    -- ajouter le flag years
    ),
    res_y as (
        select
            id_eco,
            fiche,
            annee,
            ordre_ens,
            null as code_matiere,
            null as groupe_matiere,
            null as etat,
            null as description_matiere,
            null as res_num_som,
            null as is_previous_matiere_echec,
            null as is_previous_matiere_difficulte,
            null as is_previous_matiere_maitrise,
            null as is_current_matiere_echec,
            null as is_current_matiere_difficulte,
            null as is_current_matiere_maitrise,
            null as is_reussite_mat,
            null as no_comp,
            null as res_num_comp,
            null as is_previous_competence_echec,
            null as is_previous_competence_difficulte,
            null as is_previous_competence_maitrise,
            null as is_current_competence_echec,
            null as is_current_competence_difficulte,
            null as is_current_competence_maitrise,
            null as is_reussite_comp,
            niveau_res
        from src
        where annee = {{ store.get_current_year() }}
    ),
    merg as (
        select *
        from src
        union
        select *
        from res_y

    ),
    tag as (
        select
            id_eco,
            annee,
            fiche,
            ordre_ens,
            code_matiere,
            etat,
            groupe_matiere,
            description_matiere,
            res_num_som,
            is_previous_matiere_echec,
            is_previous_matiere_difficulte,
            is_previous_matiere_maitrise,
            is_current_matiere_echec,
            is_current_matiere_difficulte,
            is_current_matiere_maitrise,
            is_reussite_mat,
            no_comp,
            res_num_comp,
            is_previous_competence_echec,
            is_previous_competence_difficulte,
            is_previous_competence_maitrise,
            is_current_competence_echec,
            is_current_competence_difficulte,
            is_current_competence_maitrise,
            is_reussite_comp,
            niveau_res
        from merg
    -- ajouter le flag difficulté
    ),
    dif as (
        select
            id_eco,
            annee,
            fiche,
            ordre_ens,
            code_matiere,
            groupe_matiere,
            etat,
            description_matiere,
            res_num_som,
            is_reussite_mat,
            no_comp,
            res_num_comp,
            is_reussite_comp,
            case
                when
                    (ordre_ens = 3 and is_current_competence_echec = 1)
                    or (ordre_ens = 4 and is_current_matiere_echec = 1)
                then 1
                else 0
            end as is_echec_current_y,
            case
                when
                    (ordre_ens = 3 and is_current_competence_difficulte = 1)
                    or (ordre_ens = 4 and is_current_matiere_difficulte = 1)
                then 1
                else 0
            end as is_diff_current_y,
            case
                when
                    (ordre_ens = 3 and is_current_competence_maitrise = 1)
                    or (ordre_ens = 4 and is_current_matiere_maitrise = 1)
                then 1
                else 0
            end as is_maitrise_current_y,
            case
                when
                    (ordre_ens = 3 and is_previous_competence_echec = 1)
                    or (ordre_ens = 4 and is_previous_matiere_echec = 1)
                then 1
                else 0
            end as is_echec_previous_y,
            case
                when
                    (ordre_ens = 3 and is_previous_competence_difficulte = 1)
                    or (ordre_ens = 4 and is_previous_matiere_difficulte = 1)
                then 1
                else 0
            end as is_diff_previous_y,
            case
                when
                    (ordre_ens = 3 and is_previous_competence_maitrise = 1)
                    or (ordre_ens = 4 and is_previous_matiere_maitrise = 1)
                then 1
                else 0
            end as is_maitrise_previous_y,
            niveau_res
        from tag
    ),
    step1 as (
        select
            id_eco,
            annee,
            fiche,
            ordre_ens,
            code_matiere,
            groupe_matiere,
            etat,
            description_matiere,
            niveau_res,
            res_num_som,
            is_reussite_mat,
            no_comp,
            res_num_comp,
            is_reussite_comp,

            max(is_echec_current_y) over (
                partition by fiche, description_matiere
            ) as is_echec_course_current,
            max(is_diff_current_y) over (
                partition by fiche, description_matiere
            ) as is_diff_course_current,
            max(is_echec_previous_y) over (
                partition by fiche, description_matiere
            ) as is_echec_course_previous,
            max(is_diff_previous_y) over (
                partition by fiche, description_matiere
            ) as is_diff_course_previous,
            max(is_maitrise_current_y) over (
                partition by fiche, description_matiere
            ) as is_maitrise_course_current,
            max(is_maitrise_previous_y) over (
                partition by fiche, description_matiere
            ) as is_maitrise_course_previous
        from dif
    )
select
    step1.id_eco,
    step1.annee,
    step1.fiche,
    el_y.eco,
    el_y.nom_ecole,
    el.nom_prenom_fiche,
    el_y.population,
    step1.ordre_ens,
    step1.code_matiere,
    groupe_matiere,
    descr_mat.description_abreg as discipline,
    etat,
    step1.description_matiere,
    step1.res_num_som,
    niveau_scolaire,
    grp_rep,
    dist,
    niveau_res,
    step1.no_comp,
    descr_comp.description_abreg as description_competence_abreg,
    step1.res_num_comp,
    case
        when is_echec_course_current = 1 then 'Oui' else 'Non'
    end as is_echec_course_current,
    case
        when is_diff_course_current = 1 then 'Oui' else 'Non'
    end as is_diff_course_current,
    case
        when is_echec_course_previous = 1 then 'Oui' else 'Non'
    end as is_echec_course_previous,
    case
        when is_diff_course_previous = 1 then 'Oui' else 'Non'
    end as is_diff_course_previous,
    case
        when is_maitrise_course_current = 1 then 'Oui' else 'Non'
    end as is_maitrise_course_current,
    case
        when is_maitrise_course_previous = 1 then 'Oui' else 'Non'
    end as is_maitrise_course_previous

from step1
inner join
    {{ ref("fact_yearly_student") }} as el_y
    on step1.fiche = el_y.fiche
    and step1.id_eco = el_y.id_eco
inner join {{ ref("dim_eleve") }} as el on step1.fiche = el.fiche
inner join {{ ref("stg_descr_mat") }} as descr_mat on step1.code_matiere = descr_mat.mat
inner join
    {{ ref("stg_descr_comp") }} as descr_comp
    on step1.code_matiere = descr_comp.mat
    and step1.no_comp = descr_comp.obj_01
