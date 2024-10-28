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

with perimetre as (
    select
        Fiche,
        MIN(Annee) as Annee_Sec_1 -- Prend l'année minimum si 2 année de suite en secondaire 1 sans ind_doubleur à 1
    from {{ ref("fact_yearly_student") }}
    where ordre_ens = 4 and niveau_scolaire = 'Sec 1' and is_doubleur = 0 -- On veut l'année la moins récente de l'élève en secondaire 1
	and Annee between {{ store.get_current_year() }} - 7 and {{ store.get_current_year() }}
	GROUP BY fiche
),

_parcours as (
	Select
		perimetre.Fiche,
		Annee_Sec_1,
		MAX(fact.annee) as Annee_Courant -- On veut l'année la plus récente de l'élève. (Son parcours)
	FROM perimetre
	INNER JOIN {{ ref("fact_yearly_student") }} as fact ON perimetre.fiche = fact.fiche
	GROUP BY perimetre.fiche, Annee_Sec_1
),

-- Création de la cohorte par rapport à l'année du 1er secondaire.
_cohorte as (
	Select
		Fiche,
		Annee_Sec_1,
		Annee_Courant,
		CASE
			WHEN Annee_Sec_1 = Annee_Sec_1 THEN CONCAT(Annee_Sec_1, '-' ,Annee_Sec_1 + 1)
			ELSE Convert(varchar, Annee_Sec_1)
		END AS Cohorte
	from _parcours
),

--Nombre de fréquentation depuis la 1er cohorte selon l'année
Frequentation as (
	Select
		Fiche,
		Cohorte,
		Annee_Sec_1,
		Annee_Courant,
		SUM(Annee_Courant - Annee_Sec_1 + 1) as Freq --Inclus l'année de départ (donc, +1)
	from _cohorte
	group by
		Fiche,
		Cohorte,
		Annee_Sec_1,
		Annee_Courant
)

select * from Frequentation