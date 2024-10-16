{#
Dashboards Store - Helping students, one dashboard at a time.
Copyright (C) 2023  Sciance Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
#}
{{ config(alias="fact_abs_list") }}

with
    absence as (
        select distinct query0.*, jour_sem, bal_jour_ouv
        from {{ ref("fact_abs_jour_absence") }} as query0

        inner join
            {{ ref("i_pai_tab_cal_jour") }} as cal
            on query0.annee = cal.an_budg
            and query0.gr_paie = cal.gr_paie
            and query0.date = cal.date_jour

        where annee >= 20192020 and cal.jour_sem not in (6, 0)
    ),

    -- Calculate the difference in days between consecutive absences
    duree as (
        select
            annee,
            duree,
            gr_paie,
            matricule,
            motif_abs,
            lieu_trav,
            bal_jour_ouv,
            reg_abs,
            date,
            absence.ref_empl,
            pourc_sal,
            datediff(
                day,
                lag(date) over (
                    partition by annee, matricule, motif_abs, lieu_trav order by date
                ),
                date
            ) as diff_days,
            bal_jour_ouv - lag(bal_jour_ouv) over (
                partition by annee, matricule, motif_abs, lieu_trav order by date
            ) as diff_bal_jour,
            datepart(weekday, date) as weekday
        from absence
    ),

    -- Identify consecutive absences by calculating the group id without using nested
    -- window functions
    grouped as (
        select
            annee,
            matricule,
            gr_paie,
            motif_abs,
            lieu_trav,
            bal_jour_ouv,
            date,
            diff_days,
            diff_bal_jour,
            weekday,
            duree,
            ref_empl,
            reg_abs,
            -- Generate a group id for each absence. New group when the days are not
            -- consecutive or when diff_days > 1
            pourc_sal,
            sum(
                case
                    when diff_days is null
                    then 0  -- First row in the partition
                    when diff_days = 3 and weekday = 2
                    then 0  -- Consecutive after a weekend (Monday after Friday)
                    when diff_days > 1
                    then 1  -- New group when there is a gap in absences
                    else 0
                end
            ) over (
                partition by annee, matricule, motif_abs, lieu_trav
                order by date
                rows unbounded preceding
            ) as group_id
        from duree
    ),

    -- Aggregate consecutive periods into one
    consecutive_periods as (
        select
            annee,
            matricule,
            gr_paie,
            motif_abs,
            lieu_trav,
            group_id,
            ref_empl,
            min(date) as startdate,
            max(date) as enddate,
            count(*) as numberofdays,
            duree,
            reg_abs,
            pourc_sal
        from grouped
        group by
            annee,
            matricule,
            ref_empl,
            motif_abs,
            lieu_trav,
            group_id,
            gr_paie,
            duree,
            pourc_sal,
            reg_abs
    )

select *
from consecutive_periods
