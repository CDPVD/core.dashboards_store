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
  Map each job_group to a job_group_category.

  Feel free to override me to get your own custom litle mapping.
#}
select
    corp_empl as job_group,
    descr as job_group_description,
    case
        when corp_empl like ('1%')
        then 'Direction'
        when corp_empl like ('2%')
        then 'Professionnel(le)'
        when corp_empl like ('3%')
        then 'Enseignant(e)'
        when corp_empl like ('4%')
        then 'Soutien'
        when corp_empl like ('5%')
        then 'Ressource matérielle'
        else 'Autres'
    end as job_group_category
from {{ ref("i_pai_tab_corp_empl") }} as src
