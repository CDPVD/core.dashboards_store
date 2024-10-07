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
with
    -- identifier le perimètre des élève de l'année en cours
    perim as (
        select fiche, ele.id_eco
        from {{ ref("stg_perimetre_eleve_frequentation_des") }} as ele
        inner join
            {{ ref("dim_mapper_schools") }} as eco
            on ele.id_eco = eco.id_eco
            and annee = {{ get_current_year() }}

    ),
    -- Prend les résultats au volet de la matière Français 5. Le volet est un critère
    -- à l'obtention pour ce cours.
    _volet as (
        select
            res_mat.annee,
            ele.fiche,
            min(
                (case when res_mat.res_num_som >= 50 then 1 else 0 end)
            ) as ind_reus_volet_fra_5
        from perim as ele
        left join
            {{ ref("fact_resultat_bilan_matiere") }} as res_mat
            on res_mat.fiche = ele.fiche
        where
            res_mat.etat = 1 and res_mat.code_matiere in ('132510', '132520', '132530')
        group by res_mat.annee, ele.fiche
    ),
    -- si un eleve a des resultats aux volets dans 2 annees différentes, on considere
    -- uniquement s'ils st validés ou non
    agg_volet as (
        select fiche, max(ind_reus_volet_fra_5) as ind_reus_volet_fra_5
        from _volet
        group by fiche
    ),
    -- Prend les résultats des matières en cours de l'année courante.
    src_res_mat as (
        select
            res_mat.annee,
            ele.fiche,
            res_mat.code_matiere as code_matiere,
            mat.friendly_name as regroupement_matière,
            case
                when left(right(res_mat.code_matiere, 3), 1) = '4' then 1 else 0
            end as is_g4,  -- Le cours est en secondaire 4
            case
                when left(right(res_mat.code_matiere, 3), 1) = '5' then 1 else 0
            end as is_g5,  -- Le cours est en secondaire 5
            res_mat.is_reussite as ind_reussite,
            agg_volet.ind_reus_volet_fra_5,
            res_mat.res_som as resultat,
            case when annee = {{ get_current_year() }} then 1 else 0 end as 'En_cours',  -- Est considéré comme 'En cours'
            res_mat.unites
        from perim as ele
        left join
            {{ ref("fact_resultat_bilan_matiere") }} as res_mat
            on res_mat.fiche = ele.fiche
        left join agg_volet on res_mat.fiche = agg_volet.fiche
        left join
            {{ ref("matiere_evalue") }} as mat
            on res_mat.code_matiere = mat.code_matiere
        where
            res_mat.unites is not null  -- Enlève les compétences
            and res_mat.etat = 1  -- La matière est actif pour l'année courante
            and left(right(res_mat.code_matiere, 3), 1) in ('4', '5')  -- Matière secondaire 4 et 5
            and (
                res_mat.code_matiere
                not in (select code_matiere from {{ ref("matiere_evalue") }})  -- ne prendre que les résultats de l'année en cours pour les matière avec des épreuve unique 
                or res_mat.annee = {{ get_current_year() }}
                and month(getdate()) < 7
            )  -- pour l'année antérieur nous allons récupérer les résultats ministériels   
    ),

    src_ri_res as (
        select
            ri_res.annee,
            ele.fiche,
            ri_res.matiere as code_matiere,
            mat.friendly_name as regroupement_matière,
            case
                when left(right(ri_res.matiere, 3), 1) = '4' then 1 else 0
            end as is_g4,
            case
                when left(right(ri_res.matiere, 3), 1) = '5' then 1 else 0
            end as is_g5,
            ri_res.res_off_final as resultat,
            ri_res.ind_reus_charl as ind_reussite,
            agg_volet.ind_reus_volet_fra_5,
            ri_res.nb_unite_charl as unites,
            case when annee = {{ get_current_year() }} then 1 else 0 end as 'En_cours',  -- Ne contient pas les résultats de l'année courante avant la fin de l'année.
            row_number() over (
                partition by ele.fiche, ri_res.matiere
                order by ri_res.date_resultat desc, date_heure_recup desc
            ) as seqid
        from perim as ele
        left join {{ ref("i_e_ri_resultats") }} as ri_res on ri_res.fiche = ele.fiche
        left join agg_volet on ri_res.fiche = agg_volet.fiche
        inner join
            {{ ref("matiere_evalue") }} as mat on ri_res.matiere = mat.code_matiere
        where left(right(ri_res.matiere, 3), 1) in ('4', '5')  -- Matière secondaire 4 et 5
    ),
    -- L'union des deux tables de résultat
    _union as (
        select
            annee,
            fiche,
            code_matiere,
            regroupement_matière,
            resultat,
            is_g4,
            is_g5,
            ind_reussite,
            ind_reus_volet_fra_5,
            unites,
            en_cours
        from src_ri_res
        where seqid = 1
        union  -- Fetch les résultats de l'année courante avec les résultats antérieurs pour le MEQ
        select
            annee,
            fiche,
            code_matiere,
            regroupement_matière,
            resultat,
            is_g4,
            is_g5,
            ind_reussite,
            ind_reus_volet_fra_5,
            unites,
            en_cours
        from src_res_mat
    ),

    -- L'aggrégation de toute les données.
    aggre as (
        select
            fiche,
            min(ind_reus_volet_fra_5) as ind_reus_volet_fra_5,
            string_agg(
                case
                    when regroupement_matière = 'Français 5' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Français 5' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ','
            ) as res_fra_5,  -- Le résultat en Français 5
            max(
                case
                    when
                        regroupement_matière = 'Français 5'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_fra_5,  -- L'indicateur d'une note de passage en Français 5
            string_agg(
                case
                    when regroupement_matière = 'Mathématique 4' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Mathématique 4' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_mat_4,  -- Le résultat en Mathématique 4
            max(
                case
                    when
                        regroupement_matière = 'Mathématique 4'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_mat_4,  -- L'indicateur d'une note de passage en Mathématique 4
            string_agg(
                case
                    when regroupement_matière = 'Anglais 5' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Anglais 5' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_ang_5,  -- Le résultat en Anglais 5
            max(
                case
                    when
                        regroupement_matière = 'Anglais 5'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_anglais_5,  -- L'indicateur d'une note de passage en Anglais 5
            string_agg(
                case
                    when regroupement_matière = 'Science 4' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Science 4' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_sci_4,  -- Le résultat en Science 4
            max(
                case
                    when
                        regroupement_matière = 'Science 4'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_science_4,  -- L'indicateur d'une note de passage en Science 4
            string_agg(
                case
                    when regroupement_matière = 'Histoire 4' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Histoire 4' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_hist_4,  -- Le résultat en Histoire 4
            max(
                case
                    when
                        regroupement_matière = 'Histoire 4'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_histoire_4,  -- L'indicateur d'une note de passage en Histoire 4
            string_agg(
                case
                    when
                        regroupement_matière = 'Complémentaire 4 (Arts)'
                        and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when
                        regroupement_matière = 'Complémentaire 4 (Arts)'
                        and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_compl_4_arts,  -- Le résultat en Complémentaire 4 (Arts)
            string_agg(
                case
                    when
                        regroupement_matière = 'Complémentaire 4 (Mus)'
                        and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when
                        regroupement_matière = 'Complémentaire 4 (Mus)'
                        and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_compl_4_mus,  -- Le résultat en Complémentaire 4 (Mus)
            string_agg(
                case
                    when
                        regroupement_matière = 'Complémentaire 4 (Art D.)'
                        and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when
                        regroupement_matière = 'Complémentaire 4 (Art D.)'
                        and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_compl_4_art_d,  -- Le résultat en Complémentaire 4 (Art D.)
            string_agg(
                case
                    when
                        regroupement_matière = 'Complémentaire 4 (Danse)'
                        and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when
                        regroupement_matière = 'Complémentaire 4 (Danse)'
                        and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_compl_4_danse,  -- Le résultat en Complémentaire 4 (Danse)
            max(
                case
                    when
                        (
                            regroupement_matière = 'Complémentaire 4 (Arts)'
                            and (ind_reussite = 'RE' or ind_reussite = 'R')
                            or regroupement_matière = 'Complémentaire 4 (Mus)'
                            and (ind_reussite = 'RE' or ind_reussite = 'R')
                            or regroupement_matière = 'Complémentaire 4 (Art D.)'
                            and (ind_reussite = 'RE' or ind_reussite = 'R')
                            or regroupement_matière = 'Complémentaire 4 (Danse)'
                            and (ind_reussite = 'RE' or ind_reussite = 'R')
                        )
                    then 1
                    else 0
                end
            ) as ind_sanct_complementaire_4,  -- L'indicateur d'une note de passage dans un cours complémentaire 4
            string_agg(
                case
                    when
                        regroupement_matière = 'Complémentaire 5 (Eth)'
                        and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when
                        regroupement_matière = 'Complémentaire 5 (Eth)'
                        and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_compl_5_eth,  -- Le résultat en Complémentaire 5 (Eth)
            string_agg(
                case
                    when
                        regroupement_matière = 'Complémentaire 5 (Éduc)'
                        and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when
                        regroupement_matière = 'Complémentaire 5 (Éduc)'
                        and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_compl_5_éduc,  -- Le résultat en Complémentaire 5 (Éduc)
            max(
                case
                    when
                        (
                            regroupement_matière = 'Complémentaire 5 (Eth)'
                            and (ind_reussite = 'RE' or ind_reussite = 'R')
                            or regroupement_matière = 'Complémentaire 5 (Éduc)'
                            and (ind_reussite = 'RE' or ind_reussite = 'R')
                        )
                    then 1
                    else 0
                end
            ) as ind_sanct_complementaire_5,  -- L'indicateur d'une note de passage dans un cours complémentaire 5
            sum(
                case
                    when
                        is_g4 = 1
                        and en_cours = '0'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_acquis_g4,  -- La somme des unités acquis en secondaire 4. Contient toutes les matières.
            sum(
                case
                    when is_g4 = 1 and en_cours = '1' then convert(int, unites) else 0
                end
            ) as nb_unites_g4_en_cours,  -- La somme des unités en cours en secondaire 4. Contient toutes les matières.
            sum(
                case
                    when
                        is_g5 = 1
                        and en_cours = '0'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_acquis_g5,  -- La somme des unités acquis en secondaire 5. Contient toutes les matières.
            sum(
                case
                    when is_g5 = 1 and en_cours = '1' then convert(int, unites) else 0
                end
            ) as nb_unites_g5_en_cours,  -- La somme des unités en cours en secondaire 5. Contient toutes les matières.
            sum(
                case
                    when (is_g4 = 1 and isnumeric(resultat) = 1 and resultat >= 60)
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_previsionnel_4,  -- La somme des unités prévisionnel en cours ou non en secondaire 4. Contient toutes les matières.
            sum(
                case
                    when (is_g5 = 1 and isnumeric(resultat) = 1 and resultat >= 60)
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_previsionnel_5,  -- La somme des unités prévisionnel en cours ou non en secondaire 5. Contient toutes les matières.
            sum(
                case
                    when
                        (
                            (is_g4 = 1 and isnumeric(resultat) = 1 and resultat >= 60)
                            or (
                                is_g5 = 1 and isnumeric(resultat) = 1 and resultat >= 60
                            )
                        )
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_previsionnel_total  -- La somme des unités prévisionnel 4 et 5
        from _union
        group by fiche
    ),

    _rgp_ind_sanct as (
        select
            *,
            case
                when
                    (
                        ind_reus_volet_fra_5 = 1
                        and ind_sanct_fra_5 = 1
                        and ind_sanct_mat_4 = 1
                        and ind_sanct_anglais_5 = 1
                        and ind_sanct_science_4 = 1
                        and ind_sanct_histoire_4 = 1
                        and ind_sanct_complementaire_4 = 1
                        and ind_sanct_complementaire_5 = 1
                    )
                then 1
                else 0
            end as rgp_ind_cours_sanction  -- Le regroupement des indicateurs pour les cours en sanction réussi.
        from aggre
    ),

    _diplomable as (
        select
            *,
            case
                when
                    (nb_unites_previsionnel_5 >= 20)
                    and (nb_unites_previsionnel_total >= 54)
                    and (rgp_ind_cours_sanction = 1)
                then 1
                else 0
            end as ind_obtention_dip_previsionnel  -- L'indicateur prévisionnel à la possibilité de l'obtention du diplôme.
        from _rgp_ind_sanct
    ),

    filtre_eleve as (
        select
            _diplomable.*,
            y_stud.annee,
            y_stud.id_eco,
            y_stud.code_perm,
            y_stud.population,
            y_stud.plan_interv_ehdaa,
            ele.genre,
            ele.nom_prenom_fiche,
            cast(y_stud.age_30_sept as nvarchar) as age_30_sept,
            case
                when y_stud.is_francisation = 0
                then 'Non'
                when y_stud.is_francisation = 1
                then 'Oui'
            end as francisation,
            case
                when y_stud.is_ppp = 0 then 'Non' when y_stud.is_ppp = 1 then 'Oui'
            end as ppp,
            y_stud.grp_rep,
            y_stud.dist,
            y_stud.class
        from _diplomable
        inner join
            {{ ref("fact_yearly_student") }} as y_stud
            on _diplomable.fiche = y_stud.fiche
            and y_stud.annee = {{ get_current_year() }}
        inner join {{ ref("dim_eleve") }} as ele on y_stud.fiche = ele.fiche

    )

select
    fiche,
    el.annee,
    nom_prenom_fiche,
    school_friendly_name as ecole,
    population,
    genre,
    plan_interv_ehdaa,
    age_30_sept,
    francisation,
    grp_rep,
    dist code_distribution,
    class as code_classification,
    res_fra_5,
    res_mat_4,
    res_ang_5,
    res_sci_4,
    res_hist_4,
    res_compl_4_arts,
    res_compl_4_mus,
    res_compl_4_art_d,
    res_compl_4_danse,
    res_compl_5_eth,
    res_compl_5_éduc,
    nb_unites_acquis_g4,
    nb_unites_g4_en_cours,
    nb_unites_acquis_g5,
    nb_unites_g5_en_cours,
    nb_unites_previsionnel_4,
    nb_unites_previsionnel_5,
    nb_unites_previsionnel_total,
    ind_obtention_dip_previsionnel
from filtre_eleve as el
left join {{ ref("dim_mapper_schools") }} as eco on el.id_eco = eco.id_eco
