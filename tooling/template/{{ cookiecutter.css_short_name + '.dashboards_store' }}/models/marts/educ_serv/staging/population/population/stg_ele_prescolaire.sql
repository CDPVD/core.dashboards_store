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
{# 
    UPDATE THIS FILE TO MATCH YOUR CSS REALITY.
#}
{% raw %}
select distinct ele.code_perm, eco.id_eco, eco.annee
from {{ ref("i_gpm_e_dan") }} as eledan
left join {{ ref("i_gpm_t_eco") }} as eco on eledan.id_eco = eco.id_eco
left join
    {{ ref("i_gpm_e_ele") }} as ele on eledan.fiche = ele.fiche
    /*WHERE 
    eledan.statut_don_an = 'A' AND (
        (
            eledan.ordre_ens = '1'
            AND eledan.grp_rep IN ('MA4','MA5','M41','M42')
        )

        OR (
            eledan.ordre_ens = '2'
            AND (eledan.grp_rep NOT LIKE '9%' OR eledan.grp_rep IS NULL)
            )
    )*/
    {% endraw %}
