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
    Computed aggregated high-level metrics for each school and the schoolbard.
#}
{{ config(alias="report_aggregated_metrics") }}

-- Extract metadata for each student
with
    metadata as (
        select spi.fiche, spi.eco, spi.population
        from {{ ref("spine") }} as spi
        where spi.seqid = 1 and spi.annee = {{ store.get_current_year() }}

    -- Extract the risks level for each student
    ),
    risks as (
        select
            mtd.fiche,
            mtd.eco,
            mtd.population,
            prb.model,
            prb.target,
            prb.risk_level_french as risk_level
        from {{ ref("i_core_models_reporting_probabilities") }} as prb
        join metadata as mtd on prb.fiche = mtd.fiche

    -- Summarize the risks level for each school
    ),
    summarized as (
        select
            coalesce(eco, 'Toutes les écoles') as eco,
            coalesce(population, 'Tous les élèves') as population,
            model,
            target,
            risk_level,
            count(*) as n_students
        from risks
        group by cube (population, eco), model, target, risk_level

    -- Normalize the n_students to get a proportion
    ),
    normalized as (
        select
            eco,
            population,
            model,
            target,
            risk_level,
            n_students,
            cast(n_students as float) / sum(n_students) over (
                partition by eco, population, model, target
            ) as proportion
        from summarized

    -- Add the metadata for each school    
    ),
    meta as (
        select
            coalesce(ecl.school_friendly_name, nrm.eco) as school,
            risk_level,
            n_students,
            proportion,
            model,
            target,
            population
        from normalized as nrm
        left join
            {{ ref("dim_mapper_schools") }} as ecl
            on nrm.eco = ecl.eco
            and ecl.annee = {{ store.get_current_year() }}
    )

select src.filter_key, src.risk_level, src.n_students, src.proportion
from
    (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    ["model", "target", "population", "school"]
                )
            }} as filter_key, school, risk_level, n_students, proportion
        from meta
    ) as src
