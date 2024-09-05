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

--Création de l'année brut pour une manipulation future
with
    _mentions as (
        select
            mentions.fiche,
            mentions.prog_charl,
            (left(mentions.date_exec_sanct, 6) - 1) as brut_annee,
            mentions.ind_reus_sanct_charl
        from {{ ref("i_e_ri_mentions") }} as mentions
    ),

    --Création de la notion de l'année dans e_ri_mentions
    mentions_annee as (
        select
            mentions.fiche,
            mentions.prog_charl,
            case
                when MONTH(brut_annee) between 9 and 12 -- Entre septembre et Décembre
                then YEAR(mentions.brut_annee)
                when MONTH(brut_annee) between 1 and 8 -- Entre Janvier et Aout
                then YEAR(mentions.brut_annee)
            end as annee,
            case
                when mentions.ind_reus_sanct_charl = 'O' then 1.0 else 0.0
            end as 'ind_obtention'
        from _mentions as mentions
    )

select
    fiche,
    prog_charl,
    annee,
    ind_obtention
from mentions_annee