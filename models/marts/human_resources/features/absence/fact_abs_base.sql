with
    abs_count as (
        select
            year(date_abs) as annee,
            matr as matricule,
            mot_abs as motif,
            lieu_trav as lieu_trav,
            date_abs,
            count(matr) over (
                partition by matr, mot_abs, lieu_trav, year(date_abs)
            ) as nbr_abs,
            case when month(date_abs) between 7 and 9 then 1 end t1,
            case when month(date_abs) between 10 and 12 then 1 end t2,
            case when month(date_abs) between 1 and 3 then 1 end t3,
            case when month(date_abs) between 4 and 6 then 1 end t4
        from {{ ref("i_pai_habs") }} as abs
        where
            year(date_abs)
            between {{ store.get_current_year() }}
            - 10 and {{ store.get_current_year() }}
        group by matr, mot_abs, lieu_trav, date_abs
    ),

    test as (
        select
            annee,
            matricule,
            motif,
            sum(t1) over (
                partition by matricule, motif, lieu_trav, year(date_abs)
            ) as t1,
            sum(t2) over (
                partition by matricule, motif, lieu_trav, year(date_abs)
            ) as t2,
            sum(t3) over (
                partition by matricule, motif, lieu_trav, year(date_abs)
            ) as t3,
            sum(t4) over (
                partition by matricule, motif, lieu_trav, year(date_abs)
            ) as t4,
            nbr_abs,
            row_number() over (
                partition by matricule, motif, lieu_trav, year(date_abs)
                order by date_abs
            ) as row_num
        from abs_count
    )

select
    annee,
    matricule,
    info.legal_name,
    mot.corp_empl,
    info.email_address
    mot.descr as motif,
    t1,
    t2,
    t3,
    t4,
    nbr_abs
from test as abs
left join {{ ref("i_pai_tab_mot_abs") }} as mot on abs.motif = mot.motif
left join {{ ref("dim_employees") }} as info on abs.matr = info.matr
where abs.row_num = 1 and mot.row_num = 1
