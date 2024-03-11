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
    
    This table unionize the always-present DEFAULT table and maybe-present CUSTOM table.
    The default table is defined in the core repo while the custom table, as all the CSS''s specifics table is created in the repo css.

    The code check for the custom table existence and adds it to the default table
    For the CUSTOM table to be detected, the table must be :
        * named 'custom_tracked_courses'
        * located in the schema 'dashboard_suivi_resultats'
#}
{{ config(alias="dim_matieres_suivi") }}

select
    code_matiere,
    description_matiere,
    case
        when
            code_matiere like 'ANG%'
            or code_matiere like 'FRA%'
            or code_matiere like 'MAT%'
        then 'PRI' + ' ' + substring(code_matiere, 4, 1)
        else 'SEC' + ' ' + substring(code_matiere, 4, 1)
    end as niveau_res

from {{ ref("srslt_stg_matieres_suivi") }}
