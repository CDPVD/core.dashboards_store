{#
Dashboards Store - Helping students, one dashboard at a time.
Copyright (C) 2023  Sciance Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
#}
{{ config(alias="emp_abs_fact_emp_abs") }}

with
    absence as (
        select distinct query0.*, jour_sem, bal_jour_ouv
        from
            (
                select
                    case
                        when month(date) >= 1 and month(date) < 7
                        then
                            concat(
                                convert(char(4), year(date) - 1),
                                '',
                                convert(char(4), year(date))
                            )
                        else
                            concat(
                                convert(char(4), year(date)),
                                '',
                                convert(char(4), year(date) + 1)
                            )
                    end as [année],
                    absence. [matr] as [matricule],
                    absence. [date],
                    motif.descr as [motif d 'absence],
			[DURE] * POURC_SAL_COUR AS [Durée],
			LIEU.DESCR AS [Lieu de travail],
			POURC_SAL_COUR,
			GR_PAIE,
			ABSENCE.REF_EMPL
		FROM {{ ref("i_pai_habs") }} AS ABSENCE
		INNER JOIN {{ ref("i_pai_dos_empl") }} AS EMP 
			ON ABSENCE.MATR = EMP.MATR AND ABSENCE.REF_EMPL = EMP.REF_EMPL
		INNER JOIN {{ ref("i_pai_tab_mot_abs") }} AS MOTIF 
			ON ABSENCE.MOT_ABS = MOTIF.MOT_ABS AND ABSENCE.[REG_ABS] = MOTIF.[REG_ABS]
		INNER JOIN {{ ref("i_pai_tab_lieu_trav") }} AS LIEU  
			ON ABSENCE.LIEU_TRAV = LIEU.LIEU_TRAV

		where dure != 0
	) AS QUERY0
		
	INNER JOIN {{ ref("i_pai_tab_cal_jour")}} AS CAL 
		ON QUERY0.Année = CAL.AN_BUDG 
		AND QUERY0.GR_PAIE = CAL.GR_PAIE 
		AND QUERY0.DATE = CAL.DATE_JOUR
	
	WHERE 
		Année >= ' 20232024 '
		AND CAL.JOUR_SEM NOT IN (6, 0)
),

duree AS (
    SELECT 
        Année, 
				Durée,
				GR_PAIE,
        Matricule, 
        [Motif d' absence],
                    [lieu de travail],
                    bal_jour_ouv,
                    date,
                    ref_empl,
                    datediff(
                        day,
                        lag(date) over (
                            partition by
                                année,
                                matricule,
                                [
                                    motif d 'absence], 
				[Lieu de travail] ORDER BY date), date) AS diff_days,
        BAL_JOUR_OUV - LAG(BAL_JOUR_OUV) OVER(PARTITION BY Année, Matricule, [Motif d' absence
                                ],
                                [lieu de travail]
                            order by date
                        ) as diff_bal_jour,
                        datepart(weekday, date) as weekday
                        from absence
                    )

                select *
                from duree
