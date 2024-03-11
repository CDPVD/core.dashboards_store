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
    res_mat as (
        select
            mat_ele.id_mat_ele,
            mat_ele.annee,
            mat_ele.fiche,
            mat_ele.id_eco,
            mat_ele.code_matiere,
            mat_ele.groupe_matiere,
            mat_ele.id_obj_mat,
            mat_ele.no_comp,
            mat_ele.etat,
            mat_ele.res_comp,
            leg.seuil_reus,
            cote.note_equiv,
            cote.cote,
            cote.indic_reus_echec,
            mat_ele.is_reprise
        from {{ ref("stg_res_bilan_comp") }} as mat_ele
        left join
            {{ ref("i_gpm_t_leg") }} as leg
            on leg.id_eco = mat_ele.id_eco
            and leg.leg = mat_ele.leg_obj_final
        left join
            {{ ref("i_gpm_t_cotes") }} as cote
            on cote.id_eco = leg.id_eco
            and cote.leg = leg.leg
            and cote.cote = mat_ele.res_comp
    ),

    res_num as (
        select
            id_mat_ele,
            annee,
            fiche,
            id_eco,
            code_matiere,
            groupe_matiere,
            id_obj_mat,
            no_comp,
            etat,
            res_comp,
            case
                when cote is not null
                then note_equiv
                when isnumeric(res_comp) = 1
                then convert(int, res_comp)
                else null
            end as res_num_comp,
            case
                when cote is not null and indic_reus_echec = '1'
                then 'R'
                when cote is not null and indic_reus_echec = '2'
                then 'E'
                when (seuil_reus is null) or (isnumeric(res_comp) <> 1)
                then 'N/A'
                when res_comp >= seuil_reus
                then 'R'
                when res_comp < seuil_reus
                then 'E'
                else 'N/A'
            end as is_reussite,
            is_reprise,
            case
                when annee = {{ store.get_current_year() }} then 1 else 0
            end as is_current_year,
            case
                when annee = {{ store.get_current_year() }} - 1 then 1 else 0
            end as is_previous_year
        from res_mat
    )
select
    annee,
    fiche,
    id_eco,
    code_matiere,
    groupe_matiere,
    id_obj_mat,
    no_comp,
    etat,
    res_comp,
    is_reussite,
    is_reprise,
    case
        when annee = 2019 and res_comp in ('NR')
        then 0
        when annee = 2019 and res_comp in ('R')
        then 100
        else res_num_comp
    end as res_num_comp,
    case
        when res_num_comp < 60 and is_current_year = 1 then 1 else 0
    end as is_current_echec,
    case
        when (res_num_comp between 60 and 69) and is_current_year = 1 then 1 else 0
    end as is_current_difficulte,
    case
        when res_num_comp >= 70 and is_current_year = 1 then 1 else 0
    end as is_current_maitrise,
    case
        when res_num_comp < 60 and is_previous_year = 1 then 1 else 0
    end as is_previous_echec,
    case
        when (res_num_comp between 60 and 69) and is_previous_year = 1 then 1 else 0
    end as is_previous_difficulte,
    case
        when res_num_comp >= 70 and is_previous_year = 1 then 1 else 0
    end as is_previous_maitrise
from res_num
