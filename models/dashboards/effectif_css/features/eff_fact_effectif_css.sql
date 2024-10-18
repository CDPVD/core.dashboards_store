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
{{ config(alias="fact_effectif_css") }}


with
    spine as (
        select *
        from {{ ref("spine") }}
        where
            annee between {{ get_current_year() }} -4 and {{ get_current_year() }} + 1
            and seqid = 1
    ),

    el as (
        select
            spi.code_perm,
            spi.annee,
            spi.population,
            ele.sexe,
            spi.eco,
            eco.nom_eco,
            dan.classe,
            dan.ordre_ens,
            dan.plan_interv_ehdaa,
            dan.difficulte,
            case
                when
                    dan.ordre_ens = '3'
                    and (
                        dan.cycle_ref = '1'
                        and (dan.annee_cycle_ref = '1' or dan.annee_cycle_ref = '7')
                    )
                then 'Primaire 1'
                when
                    dan.ordre_ens = '3'
                    and (
                        dan.cycle_ref = '1'
                        and (dan.annee_cycle_ref = '2' or dan.annee_cycle_ref = '8')
                    )
                then 'Primaire 2'
                when
                    dan.ordre_ens = '3'
                    and (
                        dan.cycle_ref = '2'
                        and (dan.annee_cycle_ref = '1' or dan.annee_cycle_ref = '7')
                    )
                then 'Primaire 3'
                when
                    dan.ordre_ens = '3'
                    and (
                        dan.cycle_ref = '2'
                        and (dan.annee_cycle_ref = '2' or dan.annee_cycle_ref = '8')
                    )
                then 'Primaire 4'
                when
                    dan.ordre_ens = '3'
                    and (
                        dan.cycle_ref = '3'
                        and (dan.annee_cycle_ref = '1' or dan.annee_cycle_ref = '7')
                    )
                then 'Primaire 5'
                when
                    dan.ordre_ens = '3'
                    and (
                        dan.cycle_ref = '3'
                        and (dan.annee_cycle_ref = '2' or dan.annee_cycle_ref = '8')
                    )
                then 'Primaire 6'
                when dan.ordre_ens = '1'
                then 'Maternelle 4'
                when dan.ordre_ens = '2'
                then 'Maternelle 5'
                when
                    dan.ordre_ens = '4'
                    and (
                        dan.cycle_ref = '1'
                        and (dan.annee_cycle_ref = '1' or dan.annee_cycle_ref = '7')
                    )
                then 'Secondaire 1'
                when
                    dan.ordre_ens = '4'
                    and (
                        dan.cycle_ref = '1'
                        and (dan.annee_cycle_ref = '2' or dan.annee_cycle_ref = '8')
                    )
                then 'Secondaire 2'
                when
                    dan.ordre_ens = '4'
                    and (
                        (
                            dan.cycle_ref = '2'
                            and (dan.annee_cycle_ref = '1' or dan.annee_cycle_ref = '7')
                        )
                        or dan.classe = '3'
                    )
                then 'Secondaire 3'
                when
                    dan.ordre_ens = '4'
                    and (
                        (
                            dan.cycle_ref = '2'
                            and (dan.annee_cycle_ref = '2' or dan.annee_cycle_ref = '8')
                        )
                        or dan.classe = '4'
                    )
                then 'Secondaire 4'
                when
                    dan.ordre_ens = '4'
                    and (
                        (
                            dan.cycle_ref = '2'
                            and (dan.annee_cycle_ref = '3' or dan.annee_cycle_ref = '9')
                        )
                        or dan.classe in ('5', '7', '8')
                    )
                then 'Secondaire 5'
                else '-'
            end as cod_niveau_scolaire,
            dan.dist,
            dan.grp_rep
        from spine as spi
        left join {{ ref("i_gpm_t_eco") }} as eco on spi.eco = eco.eco
        left join
            {{ ref("i_gpm_e_dan") }} as dan
            on spi.fiche = dan.fiche
            and eco.id_eco = dan.id_eco
        left join {{ ref("i_gpm_e_ele") }} as ele on spi.fiche = ele.fiche
        where spi.annee = eco.annee
    )

select *
from el
