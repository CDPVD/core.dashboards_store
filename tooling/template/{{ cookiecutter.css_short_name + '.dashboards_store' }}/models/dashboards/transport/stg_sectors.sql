{% raw %}
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
    Map each circuit to an arbitrary sector. 
    All circuit must be mapped.
    Use this table to gather circuit by sector.
#}
{{ config(alias="stg_sectors") }}

select distinct no_circ as circuit_id, 'foobar' as name_sector, 'fb' as abbr_sector
from {{ ref("i_geo_p_circ") }}
where
    simul = 0

    {# select distinct
    no_circ as circuit_id,
    case
        when no_circ >= 501 and no_circ < 600
        then 'Secteur Coaticook'
        when no_circ >= 600
        then 'Secteur East Angus'
        when no_circ < 501
        then 'Secteur Lac-Mégantic'
    end as name_sector,
    case
        when no_circ >= 501 and no_circ < 600
        then 'C'
        when no_circ >= 600
        then 'EA'
        when no_circ < 501
        then 'LM'
    end as abbr_sector
from {{ ref("i_geo_p_circ") }}
where simul = 0 #}
    {% endraw %}
