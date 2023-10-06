with
    << << << < updated upstream
    employees as (select distinct matr from {{ ref("i_pai_dos_empl") }}), == == == =
    employees as (select distinct matr from {{ ref("i_pai_dos_empl") }}),
    >> >>
    >> > stashed changes

    -- *********************************************************************************
    years as (
        select distinct year(years.date_eff) year from {{ ref("i_paie_hemp") }} years
    ),

    -- *********************************************************************************
    past_10_years as (
        select * from years where year >= (select max(year) from years) - 10
    )

select employees.matr, year years
from employees
cross join past_10_years
