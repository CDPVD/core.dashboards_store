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
    res_num as (
        select
            mat_ele.id_eco,
            annee,
            fiche,
            id_mat_ele,
            code_matiere,
            groupe_matiere,
            etat,
            res_som,
            mat_ele.res_meq,
            mat_ele.unites,
            case
                when cote is not null
                then note_equiv
                when isnumeric(res_som) = 1
                then convert(int, res_som)
                else null
            end as res_num_som,
            case
                when cote is not null and indic_reus_echec = '1'
                then 'R'
                when cote is not null and indic_reus_echec = '2'
                then 'E'
                when (seuil_reus is null) or (isnumeric(res_som) <> 1)
                then 'N/A'
                when res_som >= seuil_reus
                then 'R'
                when res_som < seuil_reus
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
        from {{ ref("stg_res_bilan_mat") }} as mat_ele
        left join
            {{ ref("i_gpm_t_leg") }} as leg
            on leg.id_eco = mat_ele.id_eco
            and leg.leg = mat_ele.leg_som
        left join
            {{ ref("i_gpm_t_cotes") }} as cote
            on cote.id_eco = leg.id_eco
            and cote.leg = leg.leg
            and cote.cote = mat_ele.res_som
    )
select
    id_eco,
    annee,
    fiche,
    id_mat_ele,
    code_matiere,
    groupe_matiere,
    etat,
    is_reussite,
    case
        when annee = 2019 and res_som in ('NR')
        then 0
        when annee = 2019 and res_som in ('R')
        then 100
        else res_num_som
    end as res_num_som,
    res_som,
    res_meq,
    unites,
    is_reprise,
    case
        when res_num_som < 60 and is_current_year = 1 then 1 else 0
    end as is_current_echec,
    case
        when (res_num_som between 60 and 69) and is_current_year = 1 then 1 else 0
    end as is_current_difficulte,
    case
        when res_num_som >= 70 and is_current_year = 1 then 1 else 0
    end as is_current_maitrise,
    case
        when res_num_som < 60 and is_previous_year = 1 then 1 else 0
    end as is_previous_echec,
    case
        when (res_num_som between 60 and 69) and is_previous_year = 1 then 1 else 0
    end as is_previous_difficulte,
    case
        when res_num_som >= 70 and is_previous_year = 1 then 1 else 0
    end as is_previous_maitrise
from res_num
