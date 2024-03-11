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
{{ config(alias="stg_populations_fgj") }}

select code_perm, id_eco, annee, 'Prescolaire' as population
from {{ source_or_ref("populations", "stg_ele_prescolaire") }}
union
select code_perm, id_eco, annee, 'Primaire régulier' as population
from {{ source_or_ref("populations", "stg_ele_primaire_reg") }}
union
select code_perm, id_eco, annee, 'Primaire adapté' as population
from {{ source_or_ref("populations", "stg_ele_primaire_adapt") }}
union
select code_perm, id_eco, annee, 'Secondaire régulier' as population
from {{ source_or_ref("populations", "stg_ele_secondaire_reg") }}
union
select code_perm, id_eco, annee, 'Secondaire adapté' as population
from {{ source_or_ref("populations", "stg_ele_secondaire_adapt") }}
union
select code_perm, id_eco, annee, population
from {{ ref("custom_fgj_populations") }}
