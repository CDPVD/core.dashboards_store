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

    The table try to resolve the main job from the transaction (XML) data first.
    If the main job is not found, the main job will be guestimate using the time spend in each job during the year
#}
-- First step : extract the main job from the transactions log
with
    -- Flagg the switchs of main job
    flagged as (
        select
            matr,
            date_eff,
            ref_empl,
            case
                when
                    lag(ref_empl, 1, '') over (partition by matr order by date_eff)
                    != ref_empl
                then 1
                else 0
            end as new_princ,
            date_creat
        from {{ ref("i_hcha_pai_dos_empl") }}

    -- Disembiguate the potential dublicates for a given date
    ),
    sequed as (
        select
            matr,
            date_eff,
            ref_empl,
            row_number() over (
                partition by matr, date_eff order by date_creat desc
            ) as seq_id
        from flagged
        where new_princ = 1

    -- Yearly expand the table
    ),
    expanded as (
        select
            base.matr,
            base.ref_empl,
            base.school_year + seq.seq_value as school_year,
            base.date_eff,
            base.date_end,
            row_number() over (
                partition by base.matr, base.school_year + seq.seq_value
                order by date_eff desc
            ) as seq_id
        from
            (
                select
                    matr,
                    case
                        when month(date_eff) between 9 and 12
                        then year(date_eff)
                        else year(date_eff) - 1
                    end as school_year,
                    ref_empl,
                    date_eff,
                    lead(date_eff, 1, getdate()) over (
                        partition by matr order by date_eff
                    ) as date_end
                from sequed
                where seq_id = 1
            ) as base
        cross join
            (
                select seq_value
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value <= 50
            ) as seq
        where
            case
                when month(date_end) between 9 and 12
                then year(date_end)
                else year(date_end) - 1
            end
            >= (school_year + seq.seq_value)

    -- Keep the last switch of the year
    ),
    switches as (
        select matr, school_year, ref_empl as main_job_ref
        from expanded
        where seq_id = 1
    )

select *
from switches
