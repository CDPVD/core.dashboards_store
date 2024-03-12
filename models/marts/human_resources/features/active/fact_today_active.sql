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
with
    current_employes_one as (
        select distinct
            hchq.matr,
            emp.corp_empl,
            emp.corp_empl + ' | ' + cpdescr.descr as corp_empl_descr,
            emp.stat_eng + ' | ' + stdescr.descr_stat_eng as stat_eng,
            lieu_trav,
            year(date_cheq) as year_check,
            date_cheq,
            case
                when stg.is_reg = 0 and emp.type = 'A'
                then 'Temporaire (paie automatique)'
                when stg.is_reg = 0 and emp.type = 'P'
                then 'Temporaire (sur pièce)'
                when stg.is_reg = 1
                then 'Régulier'
                else 'Autres'
            end as 'TYPE',
            case
                when month(getdate()) <= 6 then year(getdate()) - 1 else year(getdate())
            end as current_year
        from {{ ref("i_pai_hchq") }} hchq
        left join
            {{ ref("i_pai_dos_empl") }} emp
            on hchq.matr = emp.matr
            and hchq.gr_paie = emp.gr_paie
        left join {{ ref("etat_empl") }} etat on emp.etat = etat.etat_empl
        left join {{ ref("stat_eng") }} stg on emp.stat_eng = stg.stat_eng
        left join
            {{ ref("i_pai_tab_stat_eng") }} stdescr on emp.stat_eng = stdescr.stat_eng
        left join
            {{ ref("i_pai_tab_corp_empl") }} cpdescr
            on emp.corp_empl = cpdescr.corp_empl
        where emp.ind_empl_princ = 1 and etat.etat_actif = 1
    ),

    current_employes_two as (
        select
            *,
            case
                when corp_empl is not null then corp_empl else 0
            end today_job_categories,
            case
                when
                    datediff(day, getdate(), date_cheq) between -14 and 0
                    and (corp_empl not like '3%')
                then 1  -- IS NOT A TEACHER
                when corp_empl like '3%'
                then  -- IS A TEACHER
                    case
                        when
                            month(getdate()) >= 9
                            and datediff(day, getdate(), date_cheq) between -14 and 0
                        then 1
                        when
                            month(getdate()) >= 7
                            and month(getdate()) <= 8
                            and convert(
                                date,
                                concat(current_year, '-07-01')
                            ) between date_cheq and lag(date_cheq, 1) over (
                                partition by matr order by date_cheq desc
                            )
                        then 1
                        else 0
                    end
                else 0
            end as is_today_actif,
            row_number() over (partition by matr order by matr asc) row_number
        from current_employes_one
        where year_check = current_year
    ),

    current_employes_three as (
        select
            matr,
            corp_empl_descr,
            stat_eng,
            lieu_trav,
            year_check,
            type,
            is_today_actif,
            date_cheq,
            row_number,
            datediff(day, getdate(), date_cheq) tests
        from current_employes_two
        where is_today_actif = 1 and row_number = 1
    )

select *
from current_employes_three
