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
{{ config(alias="indicateurs_ppp") }}

with
    src as (
        select annee, fiche, eco, case when is_ppp = 1 then 1. else 0. end as is_ppp
        from {{ ref("fact_yearly_student") }}
        where
            ordre_ens = 4
            and annee
            between {{ store.get_current_year() }}
            - 2 and {{ store.get_current_year() }}
    ),
    ppp as (
        select
            '1.3.4.11' as id_indicateur,
            annee,
            eco,
            sum(is_ppp) as nb_ppp,
            avg(is_ppp) as tx_ppp
        from src
        group by annee, cube (eco)
    )
select
    ind.id_indicateur,
    ind.description_indicateur,
    ppp.annee,
    coalesce(ppp.eco, 'CSS') as eco,
    coalesce(school_friendly_name, 'CSS') as nom_ecole,
    nb_ppp,
    tx_ppp
from ppp
left join
    {{ ref("dim_mapper_schools") }} as sch
    on ppp.annee = sch.annee
    and ppp.eco = sch.eco
inner join
    {{ ref("pevr_dim_indicateurs") }} as ind on ppp.id_indicateur = ind.id_indicateur
