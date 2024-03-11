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
	This (sparse) table compute the number of absence periods per day and per students, for every student with at least one absence on a given day.
#}
with
    src as (
        select
            fct.date_abs,
            fct.fiche,
            fct.id_eco,
            dim.category_abs,
            min(dim.description_abs) as description_abs,  -- Take the first one, in lexicographic order. It's completely arbitrary : todo : select the description of the most common occurence of reason of absence.
            count(*) as n_periods_of_absence
        from {{ ref("i_gpm_e_abs") }} as fct
        inner join
            {{ ref("stg_dim_absences_retards_inclusion") }} as dim
            on fct.id_eco = dim.id_eco
            and fct.motif_abs = dim.motif_abs
        group by fct.date_abs, fct.fiche, fct.id_eco, dim.category_abs
    )

select
    case
        when month(date_abs) <= 7 then year(date_abs) - 1 else year(date_abs)
    end as school_year,
    date_abs,
    fiche,
    id_eco,
    coalesce(category_abs, 'tous types') as category_abs,
    sum(n_periods_of_absence) as n_periods_of_absence,
    min(description_abs) as description_abs  -- todo : Same comment as above 
from src
where n_periods_of_absence > 0
group by date_abs, fiche, id_eco, rollup (category_abs)
