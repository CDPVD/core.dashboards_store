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
    Compute the rate of resigantion .
#}
{{ config(alias="resignation_report_rate") }}

with

    extraction as (
        select
            act.matr,
            act.corp_empl,
            act.etat_empl,
            act.lieu_trav,
            act.ref_empl,
            act.school_year,
            act.stat_eng,
            dos.sexe,
            res.etat as raisondemission,
            count(distinct(act.ref_empl)) as nbremploi,
            count(distinct(res.ref_empl)) as nbrdemission
        from {{ ref("fact_activity_yearly") }} act
        left join {{ ref("i_pai_dos") }} dos on dos.matr = act.matr
        left join
            {{ ref("fact_resignation") }} res
            on res.matr = act.matr
            and res.corp_empl = act.corp_empl
            and res.lieu_trav = act.lieu_trav
            and res.ref_empl = act.ref_empl
            and res.school_year = act.school_year
        group by
            act.matr,
            act.corp_empl,
            act.etat_empl,
            act.lieu_trav,
            act.ref_empl,
            act.school_year,
            act.stat_eng,
            dos.sexe,
            res.etat
    ),

    ajout_job_cat as (
        select
            ext.matr,
            ext.corp_empl,
            ext.lieu_trav,
            ext.etat_empl,
            ext.school_year,
            ext.nbremploi,
            ext.nbrdemission,
            ext.stat_eng,
            ext.sexe,
            raisondemission,
            job.job_group_description,
            job.job_group_category

        from extraction ext
        left join
            {{ ref("dim_mapper_job_group") }} as job on job.job_group = ext.corp_empl
        where ext.school_year >= {{ store.get_current_year() }} - 10
    ),

    ajout_filter as (
        select
            matr,
            corp_empl,
            lieu_trav,
            etat_empl,
            school_year,
            nbremploi,
            nbrdemission,
            stat_eng,
            sexe,
            raisondemission,
            job_group_description,
            job_group_category,
            {{
                dbt_utils.generate_surrogate_key(
                    [
                        "corp_empl",
                        "sexe",
                        "job_group_category",
                        "lieu_trav",
                        "stat_eng",
                        "school_year",
                    ]
                )
            }} as filter_key
        from ajout_job_cat
    )

select
    matr,
    corp_empl,
    lieu_trav,
    etat_empl,
    stat_eng,
    school_year,
    sexe,
    raisondemission,
    job_group_description,
    job_group_category,
    nbremploi,
    nbrdemission,
    nbrdemission / nbremploi as taux_demission,
    filter_key
from ajout_filter
