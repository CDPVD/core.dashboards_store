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
    Compute a yearly version of the employment history restricted to only active status
#}
-- Fetch the ACTIVE employment history
with
    histo as (
        select
            hst.matr,
            hst.school_year,
            hst.ref_empl,
            hst.corp_empl,
            hst.etat_empl,
            hst.stat_eng,
            hst.lieu_trav,
            hst.date_eff,
            hst.date_fin
        from {{ ref("stg_activity_history") }} as hst
        inner join
            {{ ref("dim_employment_status_yearly") }} as dm
            on hst.school_year = dm.school_year
            and hst.etat_empl = dm.etat_empl
            and dm.etat_actif = 1

    -- Yearly padd the active history 
    ),
    padded as (
        select
            matr,
            school_year + seq.seq_value as school_year,
            ref_empl,
            corp_empl,
            etat_empl,
            stat_eng,
            lieu_trav,
            date_eff,
            date_fin
        from histo
        cross join
            (
                select seq_value
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value <= 50
            ) as seq
        where
            case
                when month(date_fin) between 9 and 12
                then year(date_fin)
                else year(date_fin) - 1
            end
            >= (school_year + seq.seq_value)

    -- Only keep the latest version per year
    ),
    up_to_date as (
        select
            base.matr,
            base.school_year,
            base.ref_empl,
            base.corp_empl,
            base.etat_empl,
            base.lieu_trav,
            base.stat_eng,
            base.date_eff,
            base.date_fin
        from
            (
                select
                    matr,
                    school_year,
                    ref_empl,
                    corp_empl,
                    etat_empl,
                    lieu_trav,
                    stat_eng,
                    date_eff,
                    date_fin,
                    row_number() over (
                        partition by matr, school_year, ref_empl order by date_eff desc
                    ) as seq_id
                from padded
            ) as base
        where base.seq_id = 1

    -- add the main job ref, and flag the rows that are going to be patched
    ),
    main_job as (

        select
            base.matr,
            base.school_year,
            base.ref_empl,
            base.corp_empl,
            base.etat_empl,
            base.lieu_trav,
            base.stat_eng,
            base.date_eff,
            base.date_fin,
            base.is_main_job,
            1 - max(is_main_job) over (
                partition by base.matr, base.school_year
            ) as is_main_job_patched
        from
            (

                select
                    src.matr,
                    src.school_year,
                    src.ref_empl,
                    src.corp_empl,
                    src.etat_empl,
                    src.lieu_trav,
                    src.stat_eng,
                    src.date_eff,
                    src.date_fin,
                    case when mn.main_job is null then 0 else 1 end as is_main_job
                from up_to_date as src
                left join
                    {{ ref("fact_main_job_yearly") }} as mn
                    on src.matr = mn.matr
                    and src.school_year = mn.school_year
                    and src.ref_empl = mn.main_job
            ) as base

    -- Adding the main job log identifies the main job in about 85% of the cases.
    -- The remaining 15% are guess-identified by the following logic:
    -- 1. If the employee has only one job, then it is the main job -> account for
    -- about 3% of the cases
    -- 2. If the employee has more than one job, then I used the current one from
    -- i_dos_empl table -> account for about 10% of the cases
    -- 3. If the employee has more than one job and no current one, then I use the
    -- last added ref (lexicographic order) -> account for about 2% of the cases
    ),
    -- Apply the first patch
    patch_1 as (

        select
            ranked.matr,
            ranked.school_year,
            ranked.ref_empl,
            ranked.corp_empl,
            ranked.etat_empl,
            ranked.lieu_trav,
            ranked.stat_eng,
            ranked.date_eff,
            ranked.date_fin,
            case
                when
                    -- If the rank max is 1, then I have only one (distinct) ref
                    -- emploi for the current year
                    max(ranked.rank_) over (
                        partition by ranked.matr, ranked.school_year
                        order by ranked.date_eff
                        rows between unbounded preceding and unbounded following
                    )
                    = 1
                then 1
                else ranked.is_main_job
            end as is_main_job,
            ranked.is_main_job_patched
        from
            (
                select
                    matr,
                    school_year,
                    ref_empl,
                    corp_empl,
                    etat_empl,
                    lieu_trav,
                    stat_eng,
                    date_eff,
                    date_fin,
                    is_main_job,
                    -- count distinct is not allowed in a windows function, so I
                    -- first compute
                    -- a dense rank and then max it
                    dense_rank() over (
                        partition by matr, school_year order by ref_empl
                    ) as rank_,
                    is_main_job_patched
                from main_job
            ) as ranked

    ),
    -- Apply the second patch
    patch_2 as (

        select
            base.matr,
            base.school_year,
            base.ref_empl,
            base.corp_empl,
            base.etat_empl,
            base.lieu_trav,
            base.stat_eng,
            base.date_eff,
            base.date_fin,
            case
                when base.patch_flag = 0
                then coalesce(patch.is_main_job, 0)
                else base.is_main_job
            end as is_main_job,
            base.is_main_job_patched
        from
            (
                select
                    src.matr,
                    src.school_year,
                    src.ref_empl,
                    src.corp_empl,
                    src.etat_empl,
                    src.lieu_trav,
                    src.stat_eng,
                    src.date_eff,
                    src.date_fin,
                    src.is_main_job,
                    -- Flag 
                    max(is_main_job) over (
                        partition by src.matr, src.school_year
                    ) as patch_flag,
                    is_main_job_patched
                from patch_1 as src
            ) as base
        left join
            (
                select matr, ref_empl, 1 as is_main_job
                from {{ ref("i_pai_dos_empl") }}
                where ind_empl_princ = 1
            ) as patch
            on base.matr = patch.matr
            and base.ref_empl = patch.ref_empl

    -- Apply the third patch
    ),
    patch_3 as (

        select
            base.matr,
            base.school_year,
            base.ref_empl,
            base.corp_empl,
            base.etat_empl,
            base.lieu_trav,
            base.stat_eng,
            base.date_eff,
            base.date_fin,
            case
                when base.patch_flag = 0
                then case when base.last_ref_empl = base.ref_empl then 1 else 0 end
                else base.is_main_job
            end as is_main_job,
            base.is_main_job_patched
        from
            (
                select
                    src.matr,
                    src.school_year,
                    src.ref_empl,
                    src.corp_empl,
                    src.etat_empl,
                    src.lieu_trav,
                    src.stat_eng,
                    src.date_eff,
                    src.date_fin,
                    src.is_main_job,
                    -- Flag 
                    max(is_main_job) over (
                        partition by src.matr, src.school_year
                    ) as patch_flag,
                    max(src.ref_empl) over (
                        partition by src.matr, src.school_year
                        order by src.ref_empl desc
                        rows between unbounded preceding and unbounded following
                    ) as last_ref_empl,
                    src.is_main_job_patched
                from patch_2 as src
            ) as base

    )

select
    matr, school_year, ref_empl, corp_empl, etat_empl, lieu_trav, stat_eng, is_main_job
from patch_3
