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
{{ config(alias="dim_epreuves") }}

{%- set source_relation = adapter.get_relation(
    database=target.database,
    schema=target.schema + "_res_epreuves_seeds",
    identifier="rstep_epreuves_personnalisees",
) -%}
{% set table_exists = source_relation is not none %}

{% if table_exists %}
    {% if execute %}
        {{
            log(
                "The seed '*_res_epreuves_seeds.rstep_epreuves_personnalisees' DOES EXIST and will be added to the 'rstep_epreuves_communes'",
                true,
            )
        }}
    {% endif %}

    select code_matiere, no_competence, 'EX' as code_etape, friendly_name
    from {{ ref("rstep_epreuves_communes") }}
    union all
    select code_matiere, no_competence, code_etape, friendly_name
    from {{ source_relation }}

{% else %}
    {% if execute %}
        {{
            log(
                "The seed '*_res_epreuves_seeds.rstep_epreuves_personnalisees' DOES NOT exists. The 'rstep_dim_epreuves' table will be defaulted to 'rstep_epreuves_communes'.",
                true,
            )
        }}
    {% endif %}

    select code_matiere, no_competence, 'EX' as code_etape, friendly_name
    from {{ ref("rstep_epreuves_communes") }}
{% endif %}
