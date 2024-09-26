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
    Compute the running number of forecasted retiring employees and combine the forecast with the past values
#}
with
    observed as (
        select
            src.job_group_category,
            convert(
                date,
                concat(src.school_year, (select date_ref from {{ ref("date_ref") }})),
                102
            ) as school_year,
            count(*) as observed_retiring_employes,
            null as forecast_retiring_employees,
            null as running_n_retiring_employees,
            past_forcast.n_retiring_employees as past_forecast_retiring_employees,

            0 as is_forecast
        from
            (
                select
                    case
                        when month(src.retirement_date) < 7
                        then year(src.retirement_date) - 1
                        else year(src.retirement_date)
                    end as school_year,
                    job.job_group_category
                from {{ ref("fact_retirement") }} as src
                left join
                    {{ ref("dim_mapper_job_group") }} as job
                    on src.corp_empl = job.job_group  -- Add the job group category here as I want to aggreagte by job group categories and not by job group.

            ) as src

        left join
            {{ ref("fact_retirement_past_forecasts") }} as past_forcast
            on src.job_group_category = past_forcast.job_group_category
            and convert(
                date,
                concat(src.school_year, (select date_ref from {{ ref("date_ref") }})),
                102
            )
            = past_forcast.school_year

        where src.school_year >= {{ store.get_current_year() }} - 10
        group by
            src.job_group_category,
            past_forcast.job_group_category,
            src.school_year,
            past_forcast.school_year,
            n_retiring_employees
    )

select
    school_year,
    job_group_category,
    null as observed_retiring_employes,
    n_retiring_employees as forecast_retiring_employees,
    sum(n_retiring_employees) over (
        partition by job_group_category
        order by school_year
        rows between unbounded preceding and current row
    ) as running_forecast_retiring_employees,
    null as past_forecast_retiring_employees,
    1 as is_forecast
from {{ ref("fact_retirement_forecasts") }}
union all

select
    school_year,
    job_group_category,
    observed_retiring_employes,
    forecast_retiring_employees,
    running_n_retiring_employees,
    past_forecast_retiring_employees,
    is_forecast
from observed
