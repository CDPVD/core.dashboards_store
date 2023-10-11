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
    Compute employment related properties for each employee.
    This table is a consolidated version of the paie_hempl with only the properties we are interested by,
    Properties are fetched from the paie_hempl table.

    Rows with the same set of attributes are merged together

 #}
{{ config(materialized="table") }}

with
    -- Extract the raw data and compute a partition id to downstream further processing
    source as (
        select
            hmp.matr,
            hmp.ref_empl,
            hmp.corp_empl,
            hmp.etat,
            hmp.lieu_trav,
            hmp.stat_eng,
            hmp.date_eff,
            hmp.date_fin,
            -- Compute a partition id within attributes does not changes except for
            -- the date
            {{
                dbt_utils.generate_surrogate_key(
                    ["matr", "ref_empl", "corp_empl", "etat", "lieu_trav", "stat_eng"]
                )
            }} as sequence_id,
            -- Add the previeous date_eff, for a given property set to check for
            -- continuity
            lag(date_fin) over (
                partition by matr, ref_empl, corp_empl, etat, lieu_trav, stat_eng
                order by date_eff
            ) as previous_date_fin
        from {{ ref("i_paie_hemp") }} as hmp

    -- Add a flag for every rupture of continuity
    ),
    continuity as (
        select
            matr,
            ref_empl,
            corp_empl,
            etat,
            lieu_trav,
            stat_eng,
            date_eff,
            date_fin,
            sequence_id,
            case
                when {{ store.weekdays_between("previous_date_fin", "date_eff") }} <= 1
                then 0
                else 1
            end as is_rupture
        from source

    -- Sum the rupture flag and create a unique partition id for each continuity group 
    ),
    sumed as (
        select
            matr,
            ref_empl,
            corp_empl,
            etat,
            lieu_trav,
            stat_eng,
            date_eff,
            date_fin,
            sequence_id,
            sum(is_rupture) over (
                partition by sequence_id
                order by date_eff
                rows between unbounded preceding and current row
            ) as continuity_group_id
        from continuity

    -- consolidate the table by partition id and continuity group, so continuous
    -- partition id will be merged together
    ),
    consolidated as (
        select
            max(matr) as matr,  -- dummy aggregation
            max(ref_empl) as ref_empl,  -- dummy aggregation
            max(corp_empl) as corp_empl,  -- dummy aggregation
            max(etat) as etat,  -- dummy aggregation
            max(lieu_trav) as lieu_trav,  -- dummy aggregation
            max(stat_eng) as stat_eng,  -- dummy aggregation
            min(date_eff) as date_eff,  -- The lower bound of the continuity group
            max(date_fin) as date_fin,  -- the upper bound of the conitnuity group
            continuity_group_id,
            sequence_id
        from sumed
        group by continuity_group_id, sequence_id
    )

-- Add metadata
select
    matr,
    case
        when month(date_eff) between 9 and 12
        then year(date_eff)
        else year(date_eff) - 1
    end as school_year,
    ref_empl,
    corp_empl,
    etat as etat_empl,
    stat_eng,
    lieu_trav,
    date_eff,
    cast(
        case when date_fin > now_.now_ then now_.now_ else date_fin end as date
    ) as date_fin
from consolidated
cross join (select getdate() as now_) as now_
