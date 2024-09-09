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
            CAST(LEFT(mentions.date_exec_sanct, 4) AS INT) as annee_brute,
            CAST(RIGHT(LEFT(mentions.date_exec_sanct, 6), 2) AS INT) as mois_brut,
            mentions.ind_reus_sanct_charl,
            mentions.regime_sanct_charl
        from {{ ref("i_e_ri_mentions") }} as mentions
    ),

    --Création de la notion de l'année dans e_ri_mentions
    mentions_annee as (
        select
            mentions.fiche,
            mentions.prog_charl,
            mentions.regime_sanct_charl,
            case
                when mentions.mois_brut between 9 and 12 -- Entre septembre et Décembre
                then mentions.annee_brute
                when mentions.mois_brut between 1 and 8 -- Entre Janvier et Août
                then mentions.annee_brute - 1
            end as annee,
            case
                when mentions.ind_reus_sanct_charl = 'O' then 1.0 else 0.0
            end as 'ind_obtention',
            case
                when prog.type_diplome = 'DES' THEN 1.0 else 0.0
            end as 'indice_Des',
            case
                when prog.type_diplome = 'CFPT' THEN 1.0 else 0.0
            end as 'indice_Cfpt',
            case
                when prog.type_diplome = 'CFMS' THEN 1.0 else 0.0
            end as 'indice_Cfms'
        from _mentions as mentions
        inner join {{ ref("i_t_prog") }} as prog on mentions.prog_charl = prog.prog_meq
        AND prog.regime_sanct = mentions.regime_sanct_charl
        WHERE mentions.regime_sanct_charl IN ('A3','J4','J5')
    )

select
    fiche,
    prog_charl,
    annee,
    ind_obtention,
    regime_sanct_charl,
    indice_Des,
    indice_Cfpt,
    indice_Cfms
from mentions_annee