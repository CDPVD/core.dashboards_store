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
    dan as (
        select dan.fiche, eco.annee, eco.eco, dan.date_deb, dan.id_eco
        from {{ ref("i_gpm_e_dan") }} as dan
        left join {{ ref("i_gpm_t_eco") }} as eco on dan.id_eco = eco.id_eco
        where dan.statut_don_an = 'A'
    ),

    -- Remove the students with duplicated code perm, as it'schould be unique.
    blacklist as (
        select ele.code_perm
        from {{ ref("i_gpm_e_ele") }} as ele
        group by ele.code_perm
        having count(*) > 1
    ),

    fiche as (
        select stg.code_perm, stg.id_eco, stg.annee, ele.fiche, stg.population
        from {{ ref("stg_populations_fgj") }} as stg
        left join {{ ref("i_gpm_e_ele") }} as ele on stg.code_perm = ele.code_perm
    )

select
    fiche.*,
    dan.eco,
    row_number() over (
        partition by code_perm, fiche.annee order by date_deb desc
    ) as seqid
from fiche
left join dan on dan.fiche = fiche.fiche and dan.id_eco = fiche.id_eco
where fiche.code_perm not in (select * from blacklist)
