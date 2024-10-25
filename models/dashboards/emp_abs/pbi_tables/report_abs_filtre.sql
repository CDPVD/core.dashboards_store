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
{{ config(alias="report_filters") }}


with
    one_for_all as (
        select
            src.annee,
            src.corp_empl,
            src.genre,
            src.lieu_trav,
            src.secteur,
            src.categories,
            src.filter_key,
            max(src.filter_source) as filter_source
        from
            (
                select
                    annee,
                    lieu_trav,
                    corp_empl,
                    genre,
                    secteur,
                    categories,
                    'agregat' as filter_source,
                    filter_key
                from {{ ref("rapport_agregat") }}
                union all
                select
                    annee,
                    lieu_trav,
                    corp_empl,
                    genre,
                    secteur,
                    categories,
                    'absemce' as filter_source,
                    filter_key
                from {{ ref("rapport_abs") }}
            ) as src
        group by
            src.annee,
            src.corp_empl,
            src.lieu_trav,
            src.genre,
            src.secteur,
            src.categories,
            src.filter_key
    )

-- Join the friendly name
select
    src.annee,
    src.corp_empl,
    src.lieu_trav,
    src.genre,
    src.secteur,
    src.categories,
    src.filter_key,
    src.filter_source
from one_for_all as src
