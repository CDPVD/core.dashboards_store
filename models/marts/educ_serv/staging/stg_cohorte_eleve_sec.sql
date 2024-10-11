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
        Annee
    from {{ ref("fact_yearly_student") }}
    where ordre_ens = 4 and niveau_scolaire = 'Sec 1' and is_doubleur = 0
	and Annee between {{ store.get_current_year() }} - 7 and {{ store.get_current_year() }}
),

_cohorte as (
	Select
		Fiche,
		Annee,
		CASE
			WHEN Annee = Annee THEN CONCAT(Annee, '-' ,Annee + 1)
			ELSE Convert(varchar, Annee)
		END AS Cohorte
	FROM perimetre
),

Freq_Anterieurs as (
	Select
		_cohorte.Fiche,
		_cohorte.cohorte,
		freq.Annee,
		ROW_NUMBER() OVER (PARTITION BY freq.fiche, freq.annee ORDER BY freq.date_deb desc) AS seqid
	from _cohorte
	LEFT JOIN {{ ref("i_e_freq") }} AS freq ON _cohorte.Fiche = freq.Fiche
	where freq.client >=2
),

nb_freq as (
	SELECT
        Fiche,
        Cohorte,
        Annee,
        COUNT(*) OVER (PARTITION BY Fiche ORDER BY Annee) AS NbAnFreq
    FROM
        Freq_Anterieurs
	where seqid = 1
),

--Nombre de fréquentation depuis la 1er cohorte selon l'année
Frequentation as (
	Select
		Max(NbAnFreq) as freq,
		MAX(Annee) as annee,
		Fiche,
		Cohorte
	from nb_freq
	group by
		Fiche,
		Cohorte,
		NbAnFreq
),

-- Regroupement par corhote.
Regroupement as (
	Select
        Fiche,
        Cohorte,
        MAX(Annee) as annee,
        MAX(freq) as freq
    From Frequentation
	Group by fiche, Cohorte
)

select * from Regroupement