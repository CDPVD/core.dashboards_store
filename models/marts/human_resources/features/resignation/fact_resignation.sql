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
    Extract all the resignation date for all of the employees.
#}
-- Extract all the valid resignations etat as well as the the corps_empl, lieu_trav and
--
with
    demission as (
        select
            stg.matr,
            stg.etat_empl as etat,
            corp_empl,
            ref_empl,
            lieu_trav,
            stat_eng,
            date_eff as date_demission,
            stg.school_year
        from {{ ref("stg_activity_history") }} as stg

        inner join
            (
                select etat_empl, school_year
                from {{ ref("dim_employment_status_yearly") }}
                where empl_resi = 1
            ) as dim
            on stg.etat_empl = dim.etat_empl
            and stg.school_year = dim.school_year

    ),

    -- Il se peut qu'il y ait plusieurs dates pour le même emploi, on va chercher la
    -- première date_eff de démission.
    first_demission as (
        select
            dem_min.matr,
            dem_min.etat,
            dem_min.corp_empl,
            dem_min.ref_empl,
            dem_min.lieu_trav,
            dem_min.stat_eng,
            min(dem_min.date_demission) as demission_date,
            dem_min.school_year
        from demission as dem_min
        group by
            dem_min.matr,
            dem_min.etat,
            dem_min.corp_empl,
            dem_min.ref_empl,
            dem_min.lieu_trav,
            dem_min.stat_eng,
            school_year

    ),

    add_first_date as (
        select
            dem.matr,
            dem.etat,
            dem.corp_empl,
            dem.ref_empl,
            dem.lieu_trav,
            dem.stat_eng,
            dem.school_year,
            dem.demission_date,
            (
                select top 1 (stg_first.date_eff)
                from {{ ref("stg_activity_history") }} stg_first

                where
                    stg_first.matr = dem.matr
                    and stg_first.ref_empl = dem.ref_empl
                    and stg_first.corp_empl = dem.corp_empl
                    and stg_first.lieu_trav = dem.lieu_trav
                order by
                    stg_first.corp_empl,
                    stg_first.lieu_trav,
                    stg_first.ref_empl,
                    stg_first.date_eff
            ) as date_entree
        from first_demission dem

    ),
    demission_age as (
        select
            frst.matr,
            frst.etat,
            frst.corp_empl,
            frst.ref_empl,
            frst.lieu_trav,
            frst.stat_eng,
            frst.demission_date,
            frst.date_entree,
            datediff(year, dos.birth_date, frst.demission_date) as demission_age,
            school_year,
            dos.sex as sexe,
            datediff(day, frst.date_entree, frst.demission_date) as days_employment

        from add_first_date as frst
        inner join {{ ref("dim_employees") }} as dos on frst.matr = dos.matr
    )

select *
from demission_age
