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
with
    spi as (
        select distinct spi.fiche, spi.annee from {{ ref("spine") }} as spi

    -- recuperer les adresses du perimetre
    ),
    adr as (
        select distinct
            spi.fiche,
            spi.annee,
            adr.bloc,
            adr.ind_envoi_meq,
            adr.genre_adr,
            adr.no_civ,
            adr.orient_rue,
            adr.genre_rue,
            adr.rue,
            adr.ville,
            adr.code_post,
            lower(
                isnull (adr.appart + '-', '')
                + isnull (adr.no_civ + ' ', '')
                + isnull (adr.rue, '')
                + isnull (', ' + adr.ville, '')
                + isnull (', ' + adr.code_post, '')
            ) as adresse,
            adr.longitude,
            adr.latitude,
            adr.distance_batisse,
            cast(adr.date_effect as date) as date_effect,
            case
                when
                    (
                        lead(adr.date_effect) over (
                            partition by adr.fiche, adr.annee order by adr.date_effect
                        )
                    )
                    is null
                then null
                else
                    dateadd(
                        day,
                        -1,
                        lead(adr.date_effect) over (
                            partition by adr.fiche, adr.annee order by adr.date_effect
                        )
                    )
            end as date_effect_fin,
            row_number() over (
                partition by spi.fiche, spi.annee order by adr.date_effect desc
            ) as seqid  -- pour identifier la 1ere adresse
        from {{ ref("spine") }} as spi
        left join
            {{ ref("i_geo_e_adr") }} as adr
            on spi.fiche = adr.fiche
            and spi.annee = adr.annee
        where adr.simul = 0  -- A CONFIRMER
    -- and adr.ind_envoi_meq = '1'	 -- A CONFIRMER : on considere uniquement les
    -- adresses envoyés au ministere
    )

-- Identifier l'adresse au 30/09	
select
    spi.*,
    adr.bloc,
    adr.ind_envoi_meq,
    adr.genre_adr,
    adr.no_civ,
    adr.orient_rue,
    adr.genre_rue,
    adr.rue,
    adr.ville,
    adr.code_post,
    adr.adresse,
    adr.longitude,
    adr.latitude,
    geography::point(isnull (adr.latitude, 0), isnull (adr.longitude, 0), 4326) as geo,
    adr.distance_batisse,
    adr.date_effect,
    adr.date_effect_fin,
    adr.seqid,
    case
        when
            (
                (
                    datefromparts(adr.annee, 9, 30)
                    between adr.date_effect and adr.date_effect_fin
                )
                or (
                    datefromparts(adr.annee, 9, 30) > adr.date_effect
                    and adr.date_effect_fin is null
                )
            )
        then 1
        else 0
    end as adresse_30sept
from spi
left join adr on spi.fiche = adr.fiche and spi.annee = adr.annee
