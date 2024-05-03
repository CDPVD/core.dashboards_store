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
        where annee = {{ store.get_current_year() }}
        union
        select 'Tous' as plan_interv_ehdaa
    ),
    genre as (
        select distinct genre
        from {{ ref("dim_eleve") }}
        where genre != 'X'
        union
        select 'Tous' as genre
    ),
    pop as (
        select distinct population
        from {{ ref("fact_yearly_student") }}
        where annee = {{ store.get_current_year() }}
        union
        select 'Tous' as population
    ),
    dist as (
        select distinct dist as code_distribution
        from {{ ref("fact_yearly_student") }}
        where annee = {{ store.get_current_year() }}
        union
        select 'Tous' as code_distribution
    ),
    grp_rep as (
        select distinct grp_rep
        from {{ ref("fact_yearly_student") }}
        where annee = {{ store.get_current_year() }}
        union
        select 'Tous' as grp_rep
    ),
    class as (
        select distinct class as classification
        from {{ ref("fact_yearly_student") }}
        where annee = {{ store.get_current_year() }}
        union
        select 'Tous' as classification
    )

select
    eco.ecole,
    edhaa.plan_interv_ehdaa,
    genre.genre,
    pop.population,
    dist.code_distribution,
    grp_rep.grp_rep,
    class.classification,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "ecole",
                "plan_interv_ehdaa",
                "genre",
                "population",
                "code_distribution",
                "grp_rep",
                "classification",
            ]
        )
    }} as filter_key
from eco
cross join edhaa
cross join genre
cross join pop
cross join dist
cross join grp_rep
cross join class
where
    eco.ecole is not null
    and edhaa.plan_interv_ehdaa is not null
    and genre.genre is not null
    and pop.population is not null
    and dist.code_distribution is not null
    and grp_rep.grp_rep is not null
    and class.classification is not null
