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
        alias="fact_epreuves_uniques",
    )
}}

with
    src as (
        select
            res.fiche,
            case
                when mois_resultat = 1 and (res_eco_brute = 'RIN' or res_eco_brute = '')
                then res.annee - 1
                else res.annee
            end as annee,
            annee_resultat,
            res.matiere as code_matiere,
            description_matiere,
            mois_resultat,
            groupe,
            resb.res_num_som as res_ecole_brute,
            res_eco_brute as res_ecole_brute_min,
            res_eco_mod as res_ecole_modere,
            res_off_brute as res_ministere_brute,
            res_off_conv as res_ministere_conv,
            res_off_final as res_ministere_final,
            ind_reus_charl as ind_reussite_charl,
            case
                when res_eco_mod = 'RIN'
                then null
                when res_eco_mod = ''
                then null
                else cast(res_eco_mod as int) - cast(res_eco_brute as int)
            end as moderation,
            case
                when isnumeric(res_off_brute) <> 0 then res_off_brute else null
            end as res_ministere_brute_num,
            case
                when isnumeric(res_off_final) <> 0 then res_off_final else null
            end as res_ministere_final_num,
            case
                when res_off_brute = ''
                then null
                when
                    (
                        (isnumeric(res_off_brute) = 1 and res_off_brute > 59)
                        or res_off_brute in ('ACC', 'EQU', 'XMT', 'SUC')
                    )
                then 1.
                when
                    (
                        (isnumeric(res_off_brute) = 1 and res_off_brute < 60)
                        or res_off_brute
                        in ('ABN', 'ABS', 'DMC', 'ANN', 'ECH', 'RIN', 'INC')
                    )
                then 0.
                else null
            end as is_reussite_epr,
            case
                when isnumeric(res_off_brute) = 1 and isnumeric(res_off_conv) = 0
                then res_off_brute
                when isnumeric(res_off_brute) = 1 and isnumeric(res_off_conv) = 1
                then res_off_conv
                else null
            end as res_ministere_num,
            case
                when isnumeric(res_off_final) = 1 then res_off_final else null
            end as res_final_num,
            row_number() over (
                partition by res.fiche, res.annee_resultat, mois_resultat, matiere
                order by date_heure_recup desc
            ) as seqid
        from {{ ref("i_e_ri_resultats") }} res
        inner join
            {{ ref("rstep_liste_matiere_epr_unique") }} as dim
            on dim.code_matiere = res.matiere  -- Only keep the tracked courses
        left join
            {{ ref("fact_resultat_bilan_matiere") }} resb
            on res.fiche = resb.fiche
            and res.annee = resb.annee
            and res.matiere = resb.code_matiere
        where
            type_form_charl = 'FG'
            and secteur_enseign_freq = 'JE'
            and ecole like ('{{ var("res_epreuves")["cod_css"] }}')
            and res.annee >= {{ store.get_current_year() }} - 5
    )
select
    fiche,
    annee,
    annee_resultat,
    code_matiere,
    description_matiere,
    mois_resultat,
    groupe,
    res_ecole_brute,
    res_ecole_brute_min,
    case
        when res_ecole_modere = '' then null else res_ecole_modere
    end as res_ecole_modere,
    case
        when res_ministere_brute = '' then null else res_ministere_brute
    end as res_ministere_brute,
    case
        when res_ministere_conv = '' then null else res_ministere_conv
    end as res_ministere_conv,
    res_ministere_final,
    ind_reussite_charl,
    moderation,
    res_ministere_num,
    res_final_num,
    case
        when res_ecole_brute is null
        then null
        when res_ecole_brute > 59
        then 1.
        when res_ecole_brute < 60
        then 0.
    end as is_reussite_ecole_brute,
    case
        when res_ecole_modere = ''
        then null
        when res_ecole_modere > 59
        then 1.
        when res_ecole_modere < 60
        then 0.
    end as is_reussite_ecole_modere,
    case
        when res_ministere_brute in ('ACC', 'EQU', 'XMT', 'SUC')
        then 1.
        when res_ministere_brute in ('ABN', 'ABS', 'DMC', 'ANN', 'ECH', 'RIN', 'INC')
        then 0.
        when isnumeric(res_ministere_brute) = 1 and res_ministere_brute > 59
        then 1.
        when isnumeric(res_ministere_brute) = 1 and res_ministere_brute < 60
        then 0.
    end as is_reussite_epr,
    case
        when res_ministere_final in ('ACC', 'EQU', 'XMT', 'SUC')
        then 1.
        when res_ministere_final in ('ABN', 'ABS', 'DMC', 'ANN', 'ECH', 'RIN', 'INC')
        then 0.
        when isnumeric(res_ministere_final) = 1 and res_ministere_final > 59
        then 1.
        when isnumeric(res_ministere_final) = 1 and res_ministere_final < 60
        then 0.
    end as is_reussite_final,
    case
        when res_ecole_modere = 'RIN'
        then null
        when res_ecole_brute is null
        then null
        else cast(res_ministere_final_num as int) - cast(res_ecole_brute as int)
    end as ecart_res_ecole_finale,
    case
        when res_ministere_conv = ''
        then null
        else cast(res_ministere_conv as int) - cast(res_ecole_brute as int)
    end as ecart_res_epreuve,
    case
        when res_ministere_brute = ''
        then null
        when res_ministere_num is null
        then null
        when res_ministere_num between 60 and 69
        then 1.
        else 0.
    end as is_difficulte_epreuve,
    case
        when res_ministere_brute = ''
        then null
        when res_ministere_num is null
        then null
        when res_ministere_num >= 70
        then 1.
        else 0.
    end as is_maitrise_epreuve,
    case
        when res_ministere_brute = ''
        then null
        when res_ministere_num is null
        then null
        when res_ministere_num < 60
        then 1.
        else 0.
    end as is_echec_epreuve,
    case
        when res_final_num is null
        then null
        when res_final_num between 60 and 69
        then 1.
        else 0.
    end as is_difficulte_final,
    case
        when res_final_num is null then null when res_final_num >= 70 then 1. else 0.
    end as is_maitrise_final,
    case
        when res_final_num is null then null when res_final_num < 60 then 1. else 0.
    end as is_echec_final,
    case
        when isnumeric(res_ministere_brute) = 0 and isnumeric(res_ministere_final) = 0
        then 1
        else 0
    end as is_res_epreuve_non_numerique
from src
where seqid = 1
