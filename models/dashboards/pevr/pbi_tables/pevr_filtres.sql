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
    eco_unique as (
        select
            eco,
            school_friendly_name,
            row_number() over (partition by eco order by annee desc) as seqid
        from {{ ref("dim_mapper_schools") }}
    ),
    eco as (
        select school_friendly_name as ecole
        from eco_unique
        where seqid = 1
        union
        select 'CSS' as ecole
    ),
    edhaa as (
        select distinct plan_interv_ehdaa
        from {{ ref("fact_yearly_student") }}
        union
        select 'Tout' as plan_interv_ehdaa
    ),
    genre as (
        select distinct genre
        from {{ ref("dim_eleve") }}
        where genre != 'X'
        union
        select 'Tout' as genre
    ),
    pop as (
        select distinct population
        from {{ ref("fact_yearly_student") }}
        union
        select 'Tout' as population
    ),
    class as (
        select distinct class as classification
        from {{ ref("fact_yearly_student") }}
        union
        select 'Tout' as classification
    )

select
    eco.ecole,
    edhaa.plan_interv_ehdaa,
    genre.genre,
    pop.population,
    class.classification,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "ecole",
                "plan_interv_ehdaa",
                "genre",
                "population",
                "classification",
            ]
        )
    }} as id_filtre
from eco
cross join edhaa
cross join genre
cross join pop
cross join class
where
    eco.ecole is not null
    and edhaa.plan_interv_ehdaa is not null
    and genre.genre is not null
    and pop.population is not null
    and class.classification is not null
