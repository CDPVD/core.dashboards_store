with
    step_zero as (
        select
            case
                when month(date_abs) between 1 and 6
                then year(date_abs) - 1
                else year(date_abs)
            end as annee,
            matr as matricule,
            mot_abs as motif,
            corp_empl,
            lieu_trav as lieu_trav,
            date_abs,
            count(matr) over (
                partition by
                    matr,
                    corp_empl,
                    mot_abs,
                    lieu_trav,
                    case
                        when month(date_abs) between 1 and 6
                        then year(date_abs) - 1
                        else year(date_abs)
                    end
            ) as nbr_abs,
            case when month(date_abs) between 7 and 9 then 1 end t1,
            case when month(date_abs) between 10 and 12 then 1 end t2,
            case when month(date_abs) between 1 and 3 then 1 end t3,
            case when month(date_abs) between 4 and 6 then 1 end t4
        from {{ ref("i_pai_habs") }} as abs
        where
            case
                when month(date_abs) between 1 and 6
                then year(date_abs) - 1
                else year(date_abs)
            end
            between {{ get_current_year() }} - 10 and {{ get_current_year() }}
        group by matr, corp_empl, mot_abs, lieu_trav, date_abs
    ),

    step_one as (
        select
            annee,
            matricule,
            motif,
            corp_empl,
            lieu_trav,
            sum(t1) over (
                partition by matricule, corp_empl, motif, lieu_trav, annee
            ) as t1,
            sum(t2) over (
                partition by matricule, corp_empl, motif, lieu_trav, annee
            ) as t2,
            sum(t3) over (
                partition by matricule, corp_empl, motif, lieu_trav, annee
            ) as t3,
            sum(t4) over (
                partition by matricule, corp_empl, motif, lieu_trav, annee
            ) as t4,
            nbr_abs,
            row_number() over (
                partition by matricule, corp_empl, motif, lieu_trav, annee
                order by date_abs
            ) as row_num
        from step_zero
    )

select
    convert(varchar, annee, 4) + '-' + convert(varchar, annee + 1, 4) as annee,
    matricule,
    ce.descr as corp_empl,
    mot.descr as motif,
    trav.descr as lieu_trav,
    t1,
    t2,
    t3,
    t4,
    nbr_abs
from step_one as abs

left join {{ ref("i_pai_tab_mot_abs") }} as mot on abs.motif = mot.motif
left join {{ ref("i_pai_tab_corp_empl") }} as ce on abs.corp_empl = ce.corp_empl
left join {{ ref("i_pai_tab_lieu_trav") }} as trav on abs.lieu_trav = trav.lieu_trav

where abs.row_num = 1 and mot.row_num = 1
