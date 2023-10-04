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
    Properties are fetched from the paie_hempl table.
    This table is a yearlied expanded version of this table
    This tabe keep the lastest, most up-to-date per year, version of the data.

    This table is materialized as a view because, yearly padded data without any kind of filtering will result in a huge amount of data. 
 #}
{{ config(materialized="view") }}

-- Select all fields of interest and compute a unique partition key to ease the
-- downstream group by and filtering computations
-- Group bying allow to reduce the number of rows to be processed by the downstream
-- queries
with
    source as (
        select
            hmp.matr,
            hmp.ref_empl,
            hmp.corp_empl,
            hmp.etat,
            hmp.lieu_trav,
            -- Extract the start / end date within between, the attributes stays the
            -- same
            min(hmp.date_eff) as date_eff,
            max(hmp.date_fin) as date_fin
        from {{ ref("i_paie_hemp") }} as hmp
        group by matr, ref_empl, corp_empl, etat, lieu_trav

    -- Replace every dates in the future by the current date as future is .... unknown
    ),
    dated as (
        select
            src.matr,
            src.ref_empl,
            src.corp_empl,
            src.etat,
            src.lieu_trav,
            cast(src.date_eff as date) as date_eff,
            cast(
                case
                    when src.date_fin > now_.now_ then now_.now_ else src.date_fin
                end as date
            ) as date_fin
        from source as src
        cross join (select getdate() as now_) as now_

    -- Compute the school year the row schould be attached to
    ),
    with_year as (
        select
            matr,
            ref_empl,
            corp_empl,
            etat,
            lieu_trav,
            date_eff,
            date_fin,
            case
                when month(date_eff) between 9 and 12
                then year(date_eff)
                else year(date_eff) - 1
            end as school_year
        from dated as dt

    -- Yearly padd the data
    ),
    padded as (
        select
            matr,
            school_year + seq_value as school_year,
            ref_empl,
            corp_empl,
            etat as etat_empl,
            lieu_trav,
            date_eff,
            date_fin
        from with_year as yr
        cross join
            (
                select seq_value
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value <= 50
            ) as seq
        where
            case
                when month(date_fin) between 9 and 12
                then year(date_fin)
                else year(date_fin) - 1
            end
            >= (school_year + seq.seq_value)
    )

select matr, school_year, ref_empl, corp_empl, etat_empl, lieu_trav, date_eff, date_fin
from padded
