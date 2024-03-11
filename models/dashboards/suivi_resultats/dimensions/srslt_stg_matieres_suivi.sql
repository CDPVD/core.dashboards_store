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
{{ config(alias="stg_matieres_suivi") }}

{%- set source_relation = adapter.get_relation(
    database=target.database,
    schema=target.schema + "_dashboard_suivi_resultats",
    identifier="custom_tracked_courses",
) -%}
{% set table_exists = source_relation is not none %}

{% if table_exists %}
    {% if execute %}
        {{
            log(
                "The seed '*_dashboard_suivi_resultats.custom_tracked_courses' DOES EXIST and will be added to the 'default_tracked_courses'",
                true,
            )
        }}
    {% endif %}

    select code_matiere, description_matiere
    from {{ ref("default_tracked_courses") }}
    union all
    select code_matiere, description_matiere
    from {{ source_relation }}

{% else %}
    {% if execute %}
        {{
            log(
                "The seed '*_dashboard_suivi_resultats.custom_tracked_courses' DOES NOT exists. The 'srslt_dim_matieres_suivi' table will be defaulted to 'default_tracked_courses'.",
                true,
            )
        }}
    {% endif %}

    select code_matiere, description_matiere
    from {{ ref("default_tracked_courses") }}
{% endif %}
