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
    indice as (
        select distinct
            type_mesure,
            case
                when type_mesure in ('11', '22', '23', '32', '33', '34') then 1 else 0
            end as is_francisation
        from {{ ref("i_gpm_e_mesures") }}

    ),
    franci as (
        select
            mes.fiche,
            mes.id_eco,
            string_agg(mes.type_mesure, ', ') as type_mesure,
            max(ind.is_francisation) is_francisation
        from {{ ref("i_gpm_e_mesures") }} mes
        inner join indice ind on mes.type_mesure = ind.type_mesure
        group by mes.fiche, mes.id_eco
    )

select fiche, id_eco, is_francisation, type_mesure
from franci
