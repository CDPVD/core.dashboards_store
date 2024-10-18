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
    The default table is defined in the core repo while the custom table, as all the CSS's specifics table is created in the repo css.

    The code check for the custom table existence and adds it to the default table
    For the CUSTOM table to be detected, the table must be :
        * named 'custom_subject_evaluation'
        * located in the schema 'res_epreuves_seeds'
#}
{{ config(alias="dim_subject_evaluation") }}

{%- set source_relation = adapter.get_relation(
    database=target.database,
    schema=target.schema + "_res_epreuves_seeds",
    identifier="custom_subject_evaluation",
) -%}
{% set table_exists = source_relation is not none %}

{% if table_exists %}
    {% if execute %}
        {{
            log(
                "The seed '*_res_epreuves_seeds.custom_subject_evaluation' DOES EXIST and will be added to the 'default_subject_evaluation'",
                true,
            )
        }}
    {% endif %}

    select code_matiere, no_competence, 'EX' as code_etape, friendly_name
    from {{ ref("default_subject_evaluation") }}
    union all
    select code_matiere, no_competence, code_etape, friendly_name
    from {{ source_relation }}

{% else %}
    {% if execute %}
        {{
            log(
                "The seed '*_res_epreuves_seeds.custom_subject_evaluation' DOES NOT exists. The 'rstp_dim_subject_evaluation' table will be defaulted to 'default_subject_evaluation'.",
                true,
            )
        }}
    {% endif %}

    select code_matiere, no_competence, 'EX' as code_etape, friendly_name
    from {{ ref("default_subject_evaluation") }}
{% endif %}
