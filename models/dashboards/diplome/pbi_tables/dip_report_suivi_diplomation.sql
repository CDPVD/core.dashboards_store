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
    _volet as (
        select
            res_mat.annee,
            ele.fiche,
            min(
                (case when res_mat.res_num_som >= 50 then 1 else 0 end)
            ) as ind_reus_volet_fra_5
        from {{ ref("fact_resultat_bilan_matiere") }} as res_mat
        inner join
            {{ ref("stg_perimetre_eleve_diplomation_des") }} as ele
            on res_mat.fiche = ele.fiche
        where
            res_mat.etat = 1 and res_mat.code_matiere in ('132510', '132520', '132530')
        group by res_mat.annee, ele.fiche
    ),
    src_res_mat as (
        select
            res_mat.annee,
            ele.fiche,
            ele.population,
            ele.genre,
            ele.plan_interv_ehdaa,
            cast(ele.age_30_sept as nvarchar) as age_30_sept,
            case
                when ele.is_francisation = 0
                then 'Non'
                when ele.is_francisation = 1
                then 'Oui'
            end as francisation,
            case
                when ele.is_ppp = 0 then 'Non' when ele.is_ppp = 1 then 'Oui'
            end as ppp,
            ele.grp_rep,
            ele.dist,
            ele.class,
            res_mat.code_matiere as code_matiere,
            mat.friendly_name as regroupement_matière,
            case
                when left(right(res_mat.code_matiere, 3), 1) = '4' then 1 else 0
            end as is_g4,
            case
                when left(right(res_mat.code_matiere, 3), 1) = '5' then 1 else 0
            end as is_g5,
            res_mat.is_reussite as ind_reussite,
            _volet.ind_reus_volet_fra_5,
            res_mat.res_som as resultat,
            '1' as 'En_cours',
            res_mat.unites
        from {{ ref("fact_resultat_bilan_matiere") }} as res_mat
        inner join
            {{ ref("stg_perimetre_eleve_diplomation_des") }} as ele
            on res_mat.fiche = ele.fiche
            and res_mat.annee = ele.annee
        inner join _volet on res_mat.fiche = _volet.fiche
        left join
            {{ ref("matiere_evalue") }} as mat
            on res_mat.code_matiere = mat.code_matiere
        where
            res_mat.annee = {{ get_current_year() }}  -- Prend seulement les résultat de l'année en cours
            and res_mat.unites is not null  -- Enlève les compétences
            and res_mat.etat = 1  -- La matière est actif pour l'année courante
            and left(right(res_mat.code_matiere, 3), 1) in ('4', '5')  -- Matière secondaire 4 et 5
    ),

    src_ri_res as (
        select
            ri_res.annee,
            ele.fiche,
            ele.population,
            ele.genre,
            ele.plan_interv_ehdaa,
            cast(ele.age_30_sept as nvarchar) as age_30_sept,
            case
                when ele.is_francisation = 0
                then 'Non'
                when ele.is_francisation = 1
                then 'Oui'
            end as francisation,
            case
                when ele.is_ppp = 0 then 'Non' when ele.is_ppp = 1 then 'Oui'
            end as ppp,
            ele.grp_rep,
            ele.dist,
            ele.class,
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
            _volet.ind_reus_volet_fra_5,
            ri_res.nb_unite_charl as unites,
            '0' as 'En_cours',
            row_number() over (
                partition by ele.fiche, ri_res.matiere
                order by ri_res.date_resultat desc
            ) as seqid
        from {{ ref("i_e_ri_resultats") }} as ri_res
        inner join
            {{ ref("stg_perimetre_eleve_diplomation_des") }} as ele
            on ri_res.fiche = ele.fiche
        inner join _volet on ri_res.fiche = _volet.fiche
        inner join
            {{ ref("matiere_evalue") }} as mat on ri_res.matiere = mat.code_matiere
        where
            nb_unite_charl != ''  -- Enlève les compétences
            and left(right(ri_res.matiere, 3), 1) in ('4', '5')  -- Matière secondaire 4 et 5
    ),

    _union as (
        select
            annee,
            fiche,
            population,
            genre,
            plan_interv_ehdaa,
            age_30_sept,
            francisation,
            ppp,
            grp_rep,
            dist,
            class,
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
            population,
            genre,
            plan_interv_ehdaa,
            age_30_sept,
            francisation,
            ppp,
            grp_rep,
            dist,
            class,
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

    aggre as (
        select
            max(annee) as annee,
            fiche,
            population,
            genre,
            plan_interv_ehdaa,
            age_30_sept,
            francisation,
            ppp,
            grp_rep,
            dist,
            class,
            min(ind_reus_volet_fra_5) as ind_reus_volet_fra_5,
            string_agg(
                case
                    when regroupement_matière = 'Français 5' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Français 5' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ','
            ) as res_fra_5,
            max(
                case
                    when
                        regroupement_matière = 'Français 5'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_fra_5,
            string_agg(
                case
                    when regroupement_matière = 'Mathématique 4' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Mathématique 4' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_mat_4,
            max(
                case
                    when
                        regroupement_matière = 'Mathématique 4'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_mat_4,
            string_agg(
                case
                    when regroupement_matière = 'Anglais 5' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Anglais 5' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_ang_5,
            max(
                case
                    when
                        regroupement_matière = 'Anglais 5'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_anglais_5,
            string_agg(
                case
                    when regroupement_matière = 'Science 4' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Science 4' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_sci_4,
            max(
                case
                    when
                        regroupement_matière = 'Science 4'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_science_4,
            string_agg(
                case
                    when regroupement_matière = 'Histoire 4' and en_cours = '0'
                    then convert(nvarchar, resultat)
                    when regroupement_matière = 'Histoire 4' and en_cours = '1'
                    then concat(convert(nvarchar, resultat), ' (En cours)')
                end,
                ', '
            ) as res_hist_4,
            max(
                case
                    when
                        regroupement_matière = 'Histoire 4'
                        and (ind_reussite = 'RE' or ind_reussite = 'R')
                    then 1
                    else 0
                end
            ) as ind_sanct_histoire_4,
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
            ) as res_compl_4_arts,
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
            ) as res_compl_4_mus,
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
            ) as res_compl_4_art_d,
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
            ) as res_compl_4_danse,
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
            ) as ind_sanct_complementaire_4,
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
            ) as res_compl_5_eth,
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
            ) as res_compl_5_éduc,
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
            ) as ind_sanct_complementaire_5,
            sum(
                case
                    when is_g4 = 1 and ind_reussite = 'RE'
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_acquis_g4,
            sum(
                case
                    when is_g4 = 1 and en_cours = '1' then convert(int, unites) else 0
                end
            ) as nb_unites_g4_en_cours,
            sum(
                case
                    when is_g5 = 1 and ind_reussite = 'RE'
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_acquis_g5,
            sum(
                case
                    when is_g5 = 1 and en_cours = '1' then convert(int, unites) else 0
                end
            ) as nb_unites_g5_en_cours,
            sum(
                case
                    when
                        (
                            (is_g4 = 1 and (en_cours = '1' or en_cours = '0'))
                            and convert(nvarchar, resultat) >= '60'
                        )
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_previsionnel_4,
            sum(
                case
                    when
                        (
                            (is_g5 = 1 and (en_cours = '1' or en_cours = '0'))
                            and convert(nvarchar, resultat) >= '60'
                        )
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_previsionnel_5,
            sum(
                case
                    when
                        (
                            (
                                (is_g4 = 1 and (en_cours = '1' or en_cours = '0'))
                                and convert(nvarchar, resultat) >= '60'
                            )
                            or (
                                (is_g5 = 1 and (en_cours = '1' or en_cours = '0'))
                                and convert(nvarchar, resultat) >= '60'
                            )
                        )
                    then convert(int, unites)
                    else 0
                end
            ) as nb_unites_previsionnel_total
        from _union
        group by
            fiche,
            population,
            genre,
            plan_interv_ehdaa,
            age_30_sept,
            francisation,
            ppp,
            grp_rep,
            dist,
            class
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
            end as rgp_ind_cours_sanction
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
            end as ind_obtention_dip_previsionnel
        from _rgp_ind_sanct
        where annee = {{ get_current_year() }}
    )

select
    annee,
    fiche,
    population,
    genre,
    plan_interv_ehdaa,
    age_30_sept,
    francisation,
    ppp,
    grp_rep,
    dist,
    class,
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
from _diplomable
