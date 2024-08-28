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
        select
            spi.fiche,
			spi.annee,
			spi.population
        from {{ ref("spine") }} as spi
    
    -- recuperer les adresses du perimetre
    ), adr as (
        select
            spi.fiche,
			spi.annee,
			spi.population,
            adr.bloc,
            adr.ind_envoi_meq,
            adr.genre_adr,
            adr.no_civ,
            adr.orient_rue,
            adr.genre_rue,
            adr.rue,
            adr.ville,
			adr.code_post,
			LOWER(ISNULL(adr.appart + '-', '') + ISNULL(adr.no_civ + ' ', '') + ISNULL(adr.rue, '') + ISNULL(', ' + adr.ville, '') + ISNULL(', ' + adr.code_post, '')) AS adresse,
            adr.longitude,
			adr.latitude,
			geography::Point(isnull(adr.latitude,0), isnull(adr.longitude,0), 4326) AS geo, --SP 2022-06-16 pour sortir les élèves ayant longitude et latitude à NULL
			adr.distance_batisse,
			cast(adr.date_effect as date) as date_effect,
			case
                when
                    (lead(adr.date_effect) over (partition by adr.fiche, adr.annee order by adr.date_effect))
                    is null
                then null
                else
                    dateadd(
                        day,
                        -1,
                        lead(adr.date_effect) over (partition by adr.fiche, adr.annee order by adr.date_effect)
                    )
            end as date_effect_fin,
            row_number() over (partition by spi.fiche, spi.annee order by adr.date_effect desc) as seqid  -- pour identifier la 1ere adresse
        from {{ ref("spine") }} as spi
		left join {{ ref("i_geo_e_adr") }} as adr 
			on spi.fiche=adr.fiche and spi.annee=adr.annee
        where 
            adr.simul=0	                     -- A CONFIRMER
			--and adr.ind_envoi_meq = '1'	 -- A CONFIRMER : on considere uniquement les adresses envoyés au ministere
    )

-- Identifier l'adresse au 30/09	
SELECT 
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
	adr.geo,
	adr.distance_batisse,
	adr.date_effect,
	adr.date_effect_fin,
    adr.seqid,
	case
		when
			(
				(datefromparts(adr.annee, 9, 30) between adr.date_effect and adr.date_effect_fin)
				OR 
				(datefromparts(adr.annee, 9, 30) > adr.date_effect and adr.date_effect_fin is null) 
			) then 1
            else 0
    end as adresse_30sept
FROM spi
LEFT JOIN adr
    ON spi.fiche=adr.fiche AND spi.annee=adr.annee