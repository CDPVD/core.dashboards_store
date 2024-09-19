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
{{ config(alias="filtres") }}

with
    eco_unique as (
        select
            eco,
            school_friendly_name,
            cat_eco,
            row_number() over (partition by eco order by annee desc) as seqid
        from {{ ref("dim_mapper_schools") }}
        where cat_eco in ('PRI', 'SEC', 'PS')
    ),
    eco as (
        select eco, school_friendly_name as ecole
        from eco_unique
        where seqid = 1
        union
        select 'CSS' as eco, 'CSS' as ecole
    ),
    ehdaa as (
        select distinct plan_interv_ehdaa, eco
        from {{ ref("fact_yearly_student") }}
        union
        select 'Tout' as plan_interv_ehdaa, eco
        from eco
        union all
        select distinct plan_interv_ehdaa, 'CSS' as eco
        from {{ ref("fact_yearly_student") }}
    ),
    genre as (
        select distinct genre
        from {{ ref("dim_eleve") }}
        where genre != 'X'
        union
        select 'Tout' as genre
    ),
    pop as (
        select distinct population, eco
        from {{ ref("fact_yearly_student") }}
        union all
        select 'Tout' as population, eco
        from eco
        union all
        select distinct population, 'CSS' as eco
        from {{ ref("fact_yearly_student") }}
    ),
    class as (
        select classification, eco, population
        from
            (
                select distinct
                    case
                        when (cat_eco in ('PRI', 'SEC', 'PS') and el.class is null)
                        then '-'
                        else el.class
                    end as classification,
                    el.eco,
                    population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union
                select distinct 'Tout' as classification, eco, population
                from {{ ref("fact_yearly_student") }}
                union all
                select distinct
                    case
                        when (cat_eco in ('PRI', 'SEC', 'PS') and el.class is null)
                        then '-'
                        else el.class
                    end as classification,
                    'CSS' as eco,
                    population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union all
                select distinct
                    case
                        when (cat_eco in ('PRI', 'SEC', 'PS') and el.class is null)
                        then '-'
                        else el.class
                    end as classification,
                    el.eco,
                    'Tout' as population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union all
                select distinct 'Tout' as classification, 'CSS' as eco, population
                from {{ ref("fact_yearly_student") }}
                union all
                select distinct
                    case
                        when (cat_eco in ('PRI', 'SEC', 'PS') and el.class is null)
                        then '-'
                        else el.class
                    end as classification,
                    'CSS' as eco,
                    'Tout' as population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union all
                select distinct 'Tout' as classification, eco, 'Tout' as population
                from eco
            ) as tab
    ),
    distr as (
        select distribution, eco, population
        from
            (
                select distinct
                    case
                        when (cat_eco in ('PRI', 'SEC', 'PS') and el.dist is null)
                        then '-'
                        else el.dist
                    end as distribution,
                    el.eco,
                    population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union
                select distinct 'Tout' as distribution, eco, population
                from {{ ref("fact_yearly_student") }}
                union all
                select distinct
                    case when el.dist is null then '-' else el.dist end as distribution,
                    'CSS' as eco,
                    population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union all
                select distinct
                    case
                        when (cat_eco in ('PRI', 'SEC', 'PS') and el.dist is null)
                        then '-'
                        else el.dist
                    end as distribution,
                    el.eco,
                    'Tout' as population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union all
                select distinct 'Tout' as distribution, 'CSS' as eco, population
                from {{ ref("fact_yearly_student") }}
                union all
                select distinct
                    case when el.dist is null then '-' else el.dist end as distribution,
                    'CSS' as eco,
                    'Tout' as population
                from {{ ref("fact_yearly_student") }} el
                left join {{ ref("dim_mapper_schools") }} eco on el.id_eco = eco.id_eco
                union all
                select distinct 'Tout' as distribution, eco, 'Tout' as population
                from eco
            ) as tab
    )
select
    eco.ecole,
    ehdaa.plan_interv_ehdaa,
    genre.genre,
    pop.population,
    class.classification,
    distr.distribution,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "ecole",
                "plan_interv_ehdaa",
                "genre",
                "pop.population",
                "classification",
                "distribution",
            ]
        )
    }} as id_filtre
from eco
cross join ehdaa
cross join genre
cross join pop
cross join class
cross join distr
where
    ehdaa.eco = eco.eco
    and pop.eco = eco.eco
    and class.eco = eco.eco
    and class.population = pop.population
    and distr.eco = eco.eco
    and distr.population = pop.population
