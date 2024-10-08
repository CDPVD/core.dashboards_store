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
        * named ''
        * located in the schema ''
#}

{% set annee_section = var(
    "dim", {"absence": {"annee": 10 }}
) %}
{% set annee_value = annee_section["absence"]["annee"] %}
{% set is_annee_value_default = annee_value == 10 %}

{% if execute %}
    {% if is_annee_value_default %}
        {{
            log(
                "Attention : absences : Le nombre d'annéés a extraire est par defaut "~ annee_value ~ " dernieres années. Vous pouvez le surcharger ",
                true,
            )
        }}
    {% else %}
        {{ 
            log("Le nombre d'années a extraire est : " ~ annee_value, info=True) 
        }}
    {% endif %}
{% endif %}

{{ config(alias="dim_grille") }}

with ecodata as (
    select
        e.id_eco,
        e.annee,
        e.eco        
    from {{ ref("i_gpm_t_eco") }} e
    where e.annee >= {{ store.get_current_year() }} - {{ annee_value }}
)
select
id_grille = cast(ed.annee as varchar) + cast(ed.eco as varchar)  + cast(gp.per as varchar) + cast(gp.grille as varchar)
, annee = ed.annee
, ecole= ed.eco
, descriptiongrille = g.descr
, gp.*
from {{ ref("i_gpm_t_grille") }} g  
 join {{ ref("i_gpm_t_grille_per") }} gp on g.id_eco = gp.id_eco and g.grille = gp.grille
 join ecodata ed on gp.id_eco = ed.id_eco
