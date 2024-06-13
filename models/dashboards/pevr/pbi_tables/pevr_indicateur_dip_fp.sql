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
{{ config(alias="indicateur_dip_fp") }}

with
    src as (
        select ind.id_indicateur, ind.description_indicateur
        from {{ ref("pevr_dim_indicateurs") }} as ind
        where ind.id_indicateur = '1.2.2.8'  -- Indicateur du taux d'obtention d'un diplome au FP.
    ),

    _data as (
        select
            src.id_indicateur,
            src.description_indicateur,
            pevr_charl.annee_scolaire,
            pevr_charl.taux
        from src
        inner join
            {{ ref("indicateur_pevr_charl") }} as pevr_charl
            on src.id_indicateur = pevr_charl.id_indicateur
    )

select *
from _data
