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
    This script forecast the number of currently active employes retiring in the next 5 years.
    The forecast is done using the Kaplan-Meier survival curves estimated in the stg_retirement_survival_curve.sql script.

    I first group together active employes by age (called cohorts) then `age` the whole cohort for up to 5 years, I then compute the cohort survival rate by applying the Kaplan-Meier estimator to each cohort x projected-age combination.
    Finaly, retiring employees for each year is then computed by differencing (first-order) the previously obtained number of surviviors for each year with respect to each cohort.

    About the horizon 0 forecast : 
    * Since I'm differentiating the cumulated survival to get the instantaneous survavival, the horizon 0 will act as a kind of a normalization constant and will capture some of the noise from the survival curve partial mis-fitting.
    * The horizon 0 has, from a dashboarding viewpoint, no real meaning and is removed from the final table
 #}
-- Compute the age of the active employes at the start of the year
with
    age_1_september as (
        select
            src.matr,
            src.job_group_category,
            datediff(year, src.date_nais, crt.current_year) as age  -- Age at september the first of the current year
        from
            (
                select src.matr, job.job_group_category, dos.date_nais
                from {{ ref("fact_activity_current") }} as src
                left join {{ ref("i_pai_dos") }} as dos on src.matr = dos.matr
                left join
                    {{ ref("dim_mapper_job_group") }} as job
                    on src.corp_empl = job.job_group
                where src.matr not in (select matr from {{ ref("fact_retirement") }})  -- Remove the already retired employes
            ) as src
        -- Add the current_year date to compute the age at semptember the first of the
        -- current scholar year
        cross join
            (
                select concat({{ store.get_current_year() }}, '-09-01') as current_year
            ) as crt

    -- Group together active employes by cohorts
    ),
    cohorts as (
        select
            {{ dbt_utils.generate_surrogate_key(["age", "job_group_category"]) }}
            as cohort_id,
            0 as forecast_horizon,  -- Initialize the forecast horizon to the current year (since the age is computed at the start of the year)
            age,
            job_group_category,
            count(matr) as n_employees
        from age_1_september
        where age between 45 and 70  -- Only keep employes between 45 and 70 years old as the survival curve is only estimated for the age range [50, 70] 
        group by age, job_group_category

    -- Age the cohorts for up to 5 years
    ),
    aged_cohorts as (
        select
            crt.cohort_id,
            crt.age + hrz.horizon as age,
            crt.forecast_horizon + hrz.horizon as forecast_horizon,
            crt.job_group_category,
            crt.n_employees
        from cohorts as crt
        cross join
            (
                select seq_value as horizon
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value between 0 and 5
            ) as hrz

    -- Add the survival rate for each cohort x age
    ),
    cumulated as (
        select
            src.cohort_id,
            src.forecast_horizon,
            src.job_group_category,
            src.n_employees,
            surv.survival_rate,
            round(
                src.n_employees - (src.n_employees * surv.survival_rate), 0
            ) as n_cumulated_retired
        from aged_cohorts as src
        inner join
            {{ ref("stg_retirement_survival_curve") }} as surv on src.age = surv.age

    -- Differentiate the cumulated number of retiring employees with respect to the
    -- cohort_ID to the forecast horizon to get the instantenous retiring employees
    ),
    differentiated as (
        select
            cohort_id,
            forecast_horizon,
            job_group_category,
            n_cumulated_retired - lag(n_cumulated_retired) over (
                partition by cohort_id order by forecast_horizon
            ) as instantaneous_retiring_employees
        from cumulated

    -- Aggregate the number of retiring employees by school year and job group
    -- category (get rid of the age and cohort dimensions as we don't care about the
    -- age of the retiring employee)
    ),
    aggregated as (
        select
            forecast_horizon,
            job_group_category,
            sum(instantaneous_retiring_employees) as instantaneous_retiring_employees
        from differentiated
        group by forecast_horizon, job_group_category

    -- Create a padding table with the year and the job_group_category, to be joined
    -- on and handle the 0-retirement case
    ),
    padding as (
        select
            job.job_group_category,
            convert(
                date,
                concat({{ store.get_current_year() }} + hrz.horizon, '-09-01'),
                102
            ) as school_year,
            hrz.horizon as forecast_horizon
        from
            (
                select distinct job_group_category
                from {{ ref("dim_mapper_job_group") }}
            ) as job
        cross join
            (
                select seq_value as horizon
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value between 1 and 5
            ) as hrz

    -- Join the padding table to the aggregated table to impute missing values
    ),
    imputed as (
        select
            pad.school_year,
            pad.job_group_category,
            coalesce(agg.instantaneous_retiring_employees, 0) as n_retiring_employees
        from padding as pad
        left join
            aggregated as agg
            on pad.forecast_horizon = agg.forecast_horizon
            and pad.job_group_category = agg.job_group_category
    )

select school_year, job_group_category, n_retiring_employees
from imputed
