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
    Compute an employee/yearly table with the main job.

    The table parse the XML transaction data to get the main job transitions.
#}
-- First step : yearly expand the stg_main_job_history table
with
    expanded as (
        select
            base.matr,
            base.main_job,
            base.school_year + seq.seq_value as school_year,
            base.valid_from,
            base.valid_until
        from {{ ref("stg_main_job_history") }} as base
        cross join
            (
                select seq_value
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value <= 50
            ) as seq
        where
            case
                when month(valid_until) between 9 and 12
                then year(valid_until)
                else year(valid_until) - 1
            end
            >= (school_year + seq.seq_value)

    -- Add a flag to identify the last row per 
    ),
    switches as (
        select
            matr,
            school_year,
            main_job,
            row_number() over (
                partition by matr, school_year order by valid_from desc
            ) as seq_id
        from expanded

    )

select matr, school_year, main_job
from switches
where seq_id = 1
