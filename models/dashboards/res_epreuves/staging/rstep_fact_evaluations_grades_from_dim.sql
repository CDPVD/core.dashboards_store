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
    Extract the grades from the resultatsCompentenceEtape using the data provided by the rstep_dim_subject_evaluation.
#}
{{ config(alias="fact_evaluations_grades_from_dim") }}

with
    res as (
        select
            res.fiche,
            res.ecole,
            dim.*,
            res.annee,
            res.resultat,
            res.resultat_numerique,
            res.code_reussite
        from {{ ref("rstep_dim_subject_evaluation") }} as dim
        left join
            {{ ref("i_gpm_edo_resultatsCompetenceEtape") }} as res
            on dim.code_matiere = res.code_matiere
            and dim.code_etape = res.etape
            and dim.no_competence = res.no_competence
        where res.resultat_numerique is not null
    ),
    resmin as (
        select
            resmin.fiche,
            right(resmin.ecole, 3) as ecole,
            dim.*,
            resmin.annee,
            resmin.resultat,
            resmin.resultat_numerique,
            resmin.code_reussite
        from {{ ref("rstep_dim_subject_evaluation") }} as dim
        join
            {{ ref("rstep_fact_evaluations_minist_sec4_sec5") }} as resmin
            on dim.code_matiere = resmin.code_matiere
        where
            resmin.ecole != ''
            and substring(dim.code_matiere, 4, 1) in ('4', '5')
            and resmin.resultat_numerique is not null
    )

select *
from res
union
select *
from resmin
