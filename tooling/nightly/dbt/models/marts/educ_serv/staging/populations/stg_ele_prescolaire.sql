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
select distinct ele.code_perm, eco.id_eco, eco.annee
from {{ ref("i_gpm_e_dan") }} as eledan
left join {{ ref("i_gpm_t_eco") }} as eco on eledan.id_eco = eco.id_eco
left join {{ ref("i_gpm_e_ele") }} as ele on eledan.fiche = ele.fiche
where
    eledan.statut_don_an = 'A'
    and (
        (eledan.ordre_ens = '1' and eledan.grp_rep in ('MA4', 'MA5', 'M41', 'M42'))

        or (
            eledan.ordre_ens = '2'
            and (eledan.grp_rep not like '9%' or eledan.grp_rep is null)
            and (eledan.grp_rep != '008' or eledan.grp_rep is null)
        )
    )
