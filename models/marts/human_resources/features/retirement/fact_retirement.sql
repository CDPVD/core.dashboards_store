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
    Extract the first retirement date for all of the employees.
#}
-- Extract all the valid retirement etat as well as the the corps_empl, lieu_trav and
-- stat_eng at the time of retirement
with
    retirements as (
        select
            matr,
            empl.etat_empl as etat,
            corp_empl,
            lieu_trav,
            stat_eng,
            date_eff as retirement_date,
            row_number() over (partition by matr order by date_eff desc) as seqid
        from {{ ref("stg_activity_history") }} as empl
        inner join
            (
                select etat_empl, school_year
                from {{ ref("dim_employment_status_yearly") }}
                where empl_retr = 1
            ) as dim
            on empl.etat_empl = dim.etat_empl
            and empl.school_year = dim.school_year

    -- Remove any duplicates
    ),
    first_retirement as (
        select matr, etat, corp_empl, lieu_trav, stat_eng, retirement_date
        from retirements
        where seqid = 1

    -- Compute the retirement age and add some metadata
    ),
    retirement_age as (
        select
            frst.matr,
            frst.etat,
            frst.corp_empl,
            frst.lieu_trav,
            frst.stat_eng,
            frst.retirement_date,
            datediff(year, dos.birth_date, frst.retirement_date) as retirement_age
        from first_retirement as frst
        left join {{ ref("dim_employees") }} as dos on frst.matr = dos.matr
    )

select *
from retirement_age
