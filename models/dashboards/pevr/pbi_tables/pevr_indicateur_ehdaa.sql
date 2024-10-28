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
{{ config(alias="indicateur_ehdaa") }}

with
    src as (
        select
            case
                when ind.id_indicateur_css is null
                then ind.id_indicateur_cdpvd  -- Permet d'utiliser l'indicateur défaut de la CDPVD
                else ind.id_indicateur_css
            end as id_indicateur,
            ind.description_indicateur,
            pevr_charl.annee_scolaire,
            pevr_charl.taux
        from {{ ref("pevr_dim_indicateurs") }} as ind
        inner join
            {{ ref("indicateur_pevr_charl") }} as pevr_charl
            on ind.id_indicateur_cdpvd = pevr_charl.id_indicateur_cdpvd
        where ind.id_indicateur_cdpvd = '3'  -- Indicateur du taux des EHDAA.
    )

select *
from src