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
    This table estimate the survival curves through a Kaplan-Meier estimation.
    Survival is defined as the probability of not being retired at a given age.

    About the event:
    * The Event is the time of retirement.
    * Since some people retire in an other CSS, I only consider the retirement of thoose who retire in the CSS.

    About the censure :
    * The time-of-censure is computed, FOR NON-RETIRED EMPLOYEES ONLY as the age the employee had as the time of his last pay.
    * Every employee that is not retired (quitter, vacation, payed leaves) is considered censored at the time of his last pay.

    About the univers :
    * Some employees will work AFTER they have retired (what a frightening world we live in). 
    Since I can't know their status for sure, employees first employed after they have reached the honorable age of 60 years old (or about 6 time the average live span of a duck) are removed from the dataset and aren't not considered survivors.
#}
-- Remove the employees assumed (see `about the univers`) to have take their
-- retirement in an other CSS : thoose who start working in the CSS after they have
-- reached 60 years old.
with
    pai_dos_expurged as (
        select matr, date_nais, date_dern_paie
        from {{ ref("i_pai_dos") }} as src
        where datediff(year, date_nais, date_entr) < 60
    ),
    -- Get the age the individual was censured: the age the employee had when he got
    -- his last pay.
    censored_age_matr as (
        select
            dos.matr, datediff(year, dos.date_nais, dos.date_dern_paie) as censure_age  -- The age at which the individual was censured 
        from pai_dos_expurged as dos
        left join {{ ref("fact_retirement") }} as ret on dos.matr = ret.matr
        where
            ret.matr is null  -- Only keep thoose of the employes who are NOT retired
            and datediff(year, dos.date_nais, dos.date_dern_paie) between 50 and 70  -- Only keep thoose who are between 50 and 70 years old as the Kaplan-Meier estimation will be fitted on this date range.

    -- Compute the censure table : the number of censures per age
    ),
    censored_age_table as (
        select
            censure_age as age,  -- is actually censured_age - 1 (since I take the last seen date, and not the age the censure actually occurs at.)
            count(*) as n_censored
        from censored_age_matr
        group by censure_age

    -- Compute the event table : the number of events (retirements) per age
    ),
    event_age_table as (
        select src.age, count(*) as n_events
        from
            (
                select
                    -- Lower and upper bound the retirement to some reasonable values.
                    case
                        when retirement_age < 50
                        then 50
                        when retirement_age > 70
                        then 70
                        else retirement_age
                    end as age
                from {{ ref("fact_retirement") }}
            ) as src
        group by age

    -- Combine the event and censored table
    -- TODO : add support for the no-death case and the propagation of censored data
    ),
    events_and_censored_table as (
        select
            src.age as age,
            coalesce(evt.n_events, 0) as n_events,
            coalesce(cns.n_censored, 0) as n_censored
        from
            (
                select seq_value as age
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value between 50 and 70
            ) as src
        left join censored_age_table as cns on src.age = cns.age
        left join event_age_table as evt on src.age = evt.age

    -- Compute the numbver of survivors for every given age
    ),
    survivors as (
        select
            age,
            n_events,
            n_censored,
            sum(n_events + n_censored) over () - coalesce(
                sum(n_events + n_censored) over (
                    order by age rows between unbounded preceding and 1 preceding
                ),
                0
            ) as n_survivors
        from events_and_censored_table

    -- Compute the instantaneous death rate
    ),
    death_rate as (
        select
            age,
            n_events,
            n_censored,
            n_survivors,
            cast(n_survivors - n_events as float)
            / n_survivors as instantaneous_survival_rate
        from survivors
    )

-- Compute the product-limit estimator
select
    age,
    n_events,
    n_censored,
    n_survivors,
    cast(n_events as float) / cast(n_survivors as float) as instantaneous_death_rate,
    exp(
        sum(log(instantaneous_survival_rate)) over (
            order by age rows between unbounded preceding and current row
        )
    ) as survival_rate
from death_rate
