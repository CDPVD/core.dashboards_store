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
    Compute the historical permanence status for an employee
 #}
-- Extract all active, regular, main jobs 
with
    source as (
        select
            hst.matr,
            hst.school_year,
            jbc.job_group_category,  -- Permmanance is determined at the job group level category
            -- "Box" the job by the (point-in-time) active job
            case
                when mnj.valid_from > hst.date_eff then mnj.valid_from else hst.date_eff
            end as valid_from,
            case
                when hst.date_fin > mnj.valid_until
                then mnj.valid_until
                else hst.date_fin
            end as valid_until
        from {{ ref("stg_activity_history") }} as hst
        inner join
            {{ ref("dim_employment_status_yearly") }} as emp  -- To keep only active jobs
            on hst.school_year = emp.school_year
            and hst.etat_empl = emp.etat_empl
            and emp.etat_actif = 1  -- Keep active jobs only
        inner join
            {{ ref("dim_engagement_status_yearly") }} as eng  -- To keep only regular employees
            on hst.school_year = eng.school_year
            and hst.stat_eng = eng.stat_eng
            and eng.is_reg = 1  -- Keep regular employees only
        inner join
            {{ ref("stg_main_job_history") }} as mnj  -- To keep only main jobs
            on hst.matr = mnj.matr
            and hst.ref_empl = mnj.main_job
            and (
                hst.date_eff between mnj.valid_from and mnj.valid_until
                or hst.date_fin between mnj.valid_from and mnj.valid_until
            )
        inner join
            {{ ref("dim_mapper_job_group") }} as jbc on hst.corp_empl = jbc.job_group

    -- Compute a continuity flag : to flag the rupture in the employment history
    ),
    continuity_flag as (
        select
            base.matr,
            base.school_year,
            base.job_group_category,
            base.valid_from,
            base.valid_until,
            sum(
                case
                    when
                        {{ store.weekdays_between("previous_date_fin", "valid_from") }}
                        <= 1
                    then 0
                    else 1
                end
            ) over (
                partition by base.matr, base.job_group_category
                order by base.valid_from
                rows between unbounded preceding and current row
            ) as partition_id
        from
            (
                select
                    matr,
                    school_year,
                    job_group_category,
                    valid_from,
                    valid_until,
                    lag(valid_until) over (
                        partition by matr, job_group_category order by valid_from
                    ) as previous_date_fin
                from source
            ) as base

    -- yearly expand the table
    ),
    expanded as (
        select
            case
                when month(valid_from) between 9 and 12
                then year(valid_from)
                else year(valid_from) - 1
            end
            + seq.seq_value as school_year,
            matr,
            job_group_category,
            valid_from,
            valid_until,
            partition_id
        from continuity_flag
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

    -- Box, for each year, the job by the school year date
    ),
    boxed as (

        select
            base.school_year,
            base.matr,
            base.job_group_category,
            case
                when base.valid_from < base.school_year_start
                then base.school_year_start
                else base.valid_from
            end as valid_from,
            case
                when base.valid_until > base.school_year_end
                then base.school_year_end
                else base.valid_until
            end as valid_until,
            base.partition_id
        from
            (
                select
                    school_year,
                    convert(
                        date, concat(school_year, '-09-1'), 102
                    ) as school_year_start,
                    convert(
                        date, concat(school_year + 1, '-08-31'), 102
                    ) as school_year_end,
                    matr,
                    job_group_category,
                    valid_from,
                    valid_until,
                    partition_id
                from expanded
            ) as base

    -- Aggregate the running experience (per continuity partition)
    )
select
    school_year,
    matr,
    job_group_category,
    sum(datediff(day, valid_from, valid_until)) over (
        partition by matr, job_group_category, partition_id
        order by valid_from
        rows between unbounded preceding and current row
    ) as running_experience,
    valid_until
from boxed
