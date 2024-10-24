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
        * named 'custom_indicateurs_pevr_cdpvd'
        * located in the schema 'dashboard_pevr_seeds'
#}
{{ config(alias="dim_indicateurs_pevr") }}

{%- set source_relation = adapter.get_relation(
    database=target.database,
    schema=target.schema + "_dashboard_pevr_seeds",
    identifier="custom_indicateurs_pevr_cdpvd",
) -%}
{% set table_exists = source_relation is not none %}

{% if table_exists %}
    {% if execute %}
        {{
            log(
                "The seed '*_dashboard_pevr_seeds.custom_indicateurs_pevr_cdpvd' DOES EXIST and will replace the default 'indicateurs_pevr_cdpvd'",
                true,
            )
        }}
    {% endif %}

    with
        cte as (
            select
                id_indicateur_cdpvd,
                id_indicateur_css,
                description_indicateur,
                cible,
                code_matiere,
                no_competence,
                count(case when id_indicateur_css is not null then 1 end) over (
                    partition by id_indicateur_cdpvd
                ) as ind_indicateur_custom  -- Si = 1, alors il a un indicateur custom.
            from
                (
                    select
                        id_indicateur_cdpvd,
                        id_indicateur_css,
                        description_indicateur,
                        cible,
                        code_matiere,
                        no_competence
                    from {{ source_relation }}
                    union
                    select
                        id_indicateur_cdpvd,
                        null as id_indicateur_css,
                        description_indicateur,
                        cible,
                        code_matiere,
                        no_competence
                    from {{ ref("indicateurs_pevr_cdpvd") }}
                ) as results
        )
    select
        id_indicateur_cdpvd,
        id_indicateur_css,
        description_indicateur,
        cible,
        code_matiere,
        no_competence
    from cte
    where ind_indicateur_custom = 0 or id_indicateur_css is not null  -- Enlève l'indicateur par défaut de la css lorsqu'il a un indicateur custom.

{% else %}
    {% if execute %}
        {{
            log(
                "The seed '*_dashboard_pevr_seeds.custom_indicateurs_pevr_cdpvd' DOES NOT exists. The 'pevr_dim_indicateurs' table will be defaulted to 'indicateurs_pevr_cdpvd'.",
                true,
            )
        }}
    {% endif %}

    select
        id_indicateur_cdpvd,
        cast(null as nvarchar) as id_indicateur_css,
        description_indicateur,
        cible,
        code_matiere,
        no_competence
    from {{ ref("indicateurs_pevr_cdpvd") }}
{% endif %}
