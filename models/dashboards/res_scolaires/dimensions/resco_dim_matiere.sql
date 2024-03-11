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
        * named 'custom_matiere'
        * located in the schema 'res_scolaires_seeds'
#}
{{ config(alias="dim_matiere") }}

{%- set source_relation = adapter.get_relation(
    database=target.database,
    schema=target.schema + "_res_scolaires_seeds",
    identifier="custom_matiere",
) -%}
{% set table_exists = source_relation is not none %}

{% if table_exists %}
    {% if execute %}
        {{
            log(
                "The seed '*_res_scolaires_seeds.custom_matiere' DOES EXIST and will be added to the 'default_matiere'",
                true,
            )
        }}
    {% endif %}

    select cod_matiere, des_matiere
    from {{ ref("default_matiere") }}
    union all
    select cod_matiere, des_matiere
    from {{ source_relation }}

{% else %}
    {% if execute %}
        {{
            log(
                "The seed '*_res_scolaires_seeds.custom_matiere' DOES NOT exists. The 'rstep_dim_matiere' table will be defaulted to 'default_matiere'.",
                true,
            )
        }}
    {% endif %}

    select cod_matiere, des_matiere
    from {{ ref("default_matiere") }}
{% endif %}
