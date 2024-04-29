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
    ecole as (
        select distinct school_friendly_name from {{ ref("pevr_indicateur_des") }}
    ),
    _plan as (select distinct plan_interv_ehdaa from {{ ref("pevr_indicateur_des") }}),
    gre as (select distinct genre from {{ ref("pevr_indicateur_des") }}),
    pop as (select distinct population from {{ ref("pevr_indicateur_des") }}),
    dis as (select distinct dist from {{ ref("pevr_indicateur_des") }}),
    grp_r as (select distinct grp_rep from {{ ref("pevr_indicateur_des") }}),
    classi as (select distinct class from {{ ref("pevr_indicateur_des") }})

select
    ecole.school_friendly_name,
    _plan.plan_interv_ehdaa,
    gre.genre,
    pop.population,
    dis.dist,
    grp_r.grp_rep,
    classi.class,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "school_friendly_name",
                "plan_interv_ehdaa",
                "genre",
                "population",
                "dist",
                "grp_rep",
                "class",
            ]
        )
    }} as filter_key
from ecole
cross join _plan as _plan
cross join gre as gre
cross join pop as pop
cross join dis as dis
cross join grp_r as grp_r
cross join classi as classi
where
    ecole.school_friendly_name is not null
    and _plan.plan_interv_ehdaa is not null
    and gre.genre is not null
    and pop.population is not null
    and dis.dist is not null
    and grp_r.grp_rep is not null
    and classi.class is not null
