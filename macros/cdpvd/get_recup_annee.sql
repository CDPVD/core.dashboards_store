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
{% macro get_recup_annee() %}
    {% set annee_section = var(
        "dim", {"absence": {"annee": 10 }}
    ) %}
    {% set annee_value = annee_section["absence"]["annee"] %}
    {% set is_annee_value_default = annee_value == 10 %}

    {% if execute %}
        {% if is_annee_value_default %}
            {{
                log(
                    "Attention : absences : Le nombre d'années à extraire est par défaut " ~ annee_value ~ " dernières années. Vous pouvez le surcharger.",
                    true,
                )
            }}
        {% else %}
            {{ 
                log("Le nombre d'années à extraire est : " ~ annee_value, info=True) 
            }}
        {% endif %}
    {% endif %}
    {{ return (store.get_current_year() - annee_value) }}
{% endmacro %}