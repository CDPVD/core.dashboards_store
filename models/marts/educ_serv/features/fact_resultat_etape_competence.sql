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
    step1 as (
        select
            mat_ele.fiche,
            mat_ele.annee,
            mat_ele.id_eco,
            mat_ele.code_matiere,
            mat_ele.groupe_matiere,
            mat_ele.id_obj_mat,
            mat_ele.no_comp,
            mat_ele.etat,
            mat_ele.etape,
            mat_ele.res_comp_etape,
            leg.seuil_reus,
            mat_ele.etape_eval,
            cote.note_equiv,
            cote.cote,
            cote.indic_reus_echec,
            mat_ele.is_reprise
        from {{ ref("stg_res_etape_comp") }} as mat_ele
        left join
            {{ ref("i_gpm_t_leg") }} as leg
            on leg.id_eco = mat_ele.id_eco
            and leg.leg = mat_ele.legende
        left join
            {{ ref("i_gpm_t_cotes") }} as cote
            on cote.id_eco = leg.id_eco
            and cote.leg = leg.leg
            and cote.cote = mat_ele.res_comp_etape
    ),
    res_num as (
        select
            annee,
            fiche,
            id_eco,
            code_matiere,
            groupe_matiere,
            id_obj_mat,
            no_comp,
            etat,
            etape,
            is_reprise,
            case
                when cote is not null
                then note_equiv
                when isnumeric(res_comp_etape) = 1
                then convert(int, res_comp_etape)
                else null
            end as res_etape_num,
            case
                when cote is not null and indic_reus_echec = '1'
                then 'R'
                when cote is not null and indic_reus_echec = '2'
                then 'E'
                when (seuil_reus is null) or (isnumeric(res_comp_etape) <> 1)
                then 'N/A'
                when res_comp_etape >= seuil_reus
                then 'R'
                when res_comp_etape < seuil_reus
                then 'E'
                else 'N/A'
            end as is_reussite
        from step1
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
    etape,
    is_reprise,
    res_etape_num,
    is_reussite,
    case when res_etape_num < 60 then 1 else 0 end as is_echec,
    case when (res_etape_num between 60 and 69) then 1 else 0 end as is_difficulte,
    case when res_etape_num >= 70 then 1 else 0 end as is_maitrise
from res_num
