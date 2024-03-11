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
{{ config(alias="report_details") }}

{# Extract the non-simulated parcours for the last 10 years #}
with
    parcours as (
        select annee, no_circ, no_parc, nom_parc, per, idparc
        from {{ ref("i_geo_p_parc") }}
        where
            simul = 0
            and annee >= {{ store.get_current_year() }} - 10
            and ind_active = 1

    {# Extract the non-simulated circuit for the last 10 years #}
    ),
    circuits as (
        select nom_circ, annee, no_circ
        from {{ ref("i_geo_p_circ") }}
        where simul = 0 and annee >= {{ store.get_current_year() }} - 10

    {# Compute the most granular table, mapping parcours to their circuit #}
    ),
    circ_parc as (
        select
            crc.annee,
            crc.no_circ as circuit_id,
            crc.nom_circ as circuit_name,
            prc.no_parc as parcours_id,
            prc.nom_parc as parcours_name,
            prc.per as parcours_periode,
            prc.idparc as id_parc_inter
        from circuits as crc
        left join
            parcours as prc  -- circ_parc outer join if not every parcours can be attached to a circuit ; LEFT JOIN + tests If ALL parcours schould be attached to a circuit
            on crc.annee = prc.annee
            and crc.no_circ = prc.no_circ
    {# Propagate the circuit / parcours name changes #}
    ),
    last_names as (
        select
            annee,
            circuit_id,
            last_value(circuit_name) over (
                partition by circuit_id
                order by annee
                rows between unbounded preceding and unbounded following
            ) as circuit_name,  -- Get the most-up-to-date circuit name. If we want to allow the name to change between the year, then just add the name in the PARTITION BY clause
            parcours_id,
            last_value(parcours_name) over (
                partition by circuit_id, parcours_id
                order by annee
                rows between unbounded preceding and unbounded following
            ) as parcours_name,  -- Get the most-up-to-date circuit name. If we want to allow the name to change between the year, then just add the name in the PARTITION BY clause
            parcours_periode,
            id_parc_inter
        from circ_parc
    ),
    agg as (

        {# Aggregate the table to  #}
        select
            annee,
            circuit_id,
            max(circuit_name) as circuit_name,  -- Dummy aggregation
            parcours_id,
            max(parcours_name) as parcours_name,  -- Dummy aggregation
            parcours_periode,
            id_parc_inter
        from circ_parc
        where parcours_id is not null
        group by annee, circuit_id, parcours_id, parcours_periode, id_parc_inter

    -- Add metada about the period
    ),
    with_meta as (
        select
            annee,
            src.circuit_id,
            circuit_name,
            name_sector,
            abbr_sector,
            parcours_id,
            parcours_name,
            case
                when parcours_periode = 1 then 'AM' when parcours_periode = 8 then 'PM'
            end as parcours_periode,
            'Oui' as actif,
            id_parc_inter
        from agg as src
        left join
            {{ store.source_or_ref("transport", "stg_sectors") }} as sec
            on src.circuit_id = sec.circuit_id

    ),
    flagged as (
        -- flag the circuit spanning for more 1 period
        select
            src.annee,
            src.circuit_id,
            src.circuit_name,
            src.name_sector,
            src.abbr_sector,
            src.parcours_id,
            src.parcours_name,
            src.parcours_periode,
            src.actif,
            src.id_parc_inter,
            coalesce(blcklst.flag, 0) as is_duplicate
        from with_meta as src
        left join
            (
                select annee, circuit_id, parcours_id, parcours_periode, 1 as flag
                from with_meta
                group by annee, circuit_id, parcours_id, parcours_periode
                having count(*) > 1
            ) as blcklst
            on src.annee = blcklst.annee
            and src.circuit_id = blcklst.circuit_id
            and src.parcours_id = blcklst.parcours_id
            and coalesce(src.parcours_periode, 'unknown')
            = coalesce(blcklst.parcours_periode, 'unknown')
    )

select
    annee,
    circuit_id,
    circuit_name,
    name_sector,
    abbr_sector,
    parcours_id,
    parcours_name,
    parcours_periode,
    actif,
    id_parc_inter
from flagged
where is_duplicate = 0
