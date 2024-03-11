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
    Centralize common filters used accross dashboard
#}
{{ config(alias="report_filters") }}

-- Select all the models and targets
with
    models as (
        select model, target
        from {{ ref("i_core_models_reporting_probabilities") }}
        group by model, target

    -- Select all the populations and add a "Tous les élèves" population
    ),
    populations as (
        select
            coalesce(eco, 'Toutes les écoles') as eco,
            coalesce(population, 'Tous les élèves') as population
        from {{ ref("spine") }} as spi
        where
            fiche in (
                select distinct fiche
                from {{ ref("i_core_models_reporting_probabilities") }}
            )  -- Only keep the schools we have at least one student with a valid prediction
            and annee = {{ store.get_current_year() }}
            and seqid = 1

        group by cube (population, eco)

    -- Combine the filters and add a filter key    
    ),
    crossed as (
        select
            mdl.model,
            mdl.target,
            pop.population,
            coalesce(ecl.school_friendly_name, pop.eco) as school
        from models as mdl
        cross join populations as pop
        left join
            {{ ref("dim_mapper_schools") }} as ecl
            on pop.eco = ecl.eco
            and ecl.annee = {{ store.get_current_year() }}
    )

-- Compute the filter key by hashing up the model, target, population and school
select
    concat(model, ' - ', target) as model_target,
    population,
    school,
    {{ dbt_utils.generate_surrogate_key(["model", "target", "population", "school"]) }}
    as filter_key
from crossed
