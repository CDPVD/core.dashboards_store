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
    Gather employeess level static information from the interfaces

    Used as a base table for the dim_employees table
#}
with
    dos as (
        select
            matr as matr,
            sexe,
            nom_legal as legal_name,
            date_nais as birth_date,
            nom as last_name,
            prnom as first_name,
            date_dern_paie as last_pay_date
        from {{ ref("i_pai_dos") }}

    ),
    dos2 as (
        select
            matr,
            case
                when adr_electrnq_portail not like '%@%'
                then null
                else adr_electrnq_portail
            end as email_address
        from {{ ref("i_pai_dos_2") }}
    )

select
    dos.matr as matr,
    dos.sexe as genre,
    case
        when sexe = 'm' then 'homme' when sexe = 'f' then 'femme'
    end as sex_friendly_name,
    dos.legal_name as legal_name,
    dos.birth_date as birth_date,
    dos.last_name as last_name,
    dos.first_name as first_name,
    dos2.email_address as email_address,
    dos.last_pay_date
from dos
join dos2 on dos.matr = dos2.matr
