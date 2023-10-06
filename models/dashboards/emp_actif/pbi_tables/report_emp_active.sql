-- ********************************************************************************* 
with
    employes_active as (
        select
            linkedtables.matr matricule,
            linkedtables.years annee,
            dos.prnom + ' ' + dos.nom as nom,
            case  -- STATUS OF ACTIVITY
                when current_active.is_today_actif is not null
                then current_active.is_today_actif
                else 0
            end today_is_active,
            current_active.stat_eng,
            lieu.descr as lieu_trav,
            lower(dos2.adr_electrnq_portail) as adr_electrnq_portail,
            current_active.type,
            current_active.corp_empl_descr

        from {{ ref("spine_rh") }} linkedtables
        left join
            {{ ref("fact_today_active") }} current_active
            on linkedtables.matr = current_active.matr
            and linkedtables.years = current_active.year_check
        left join {{ ref("i_pai_dos") }} dos on linkedtables.matr = dos.matr
        left join {{ ref("i_pai_dos_2") }} dos2 on linkedtables.matr = dos2.matr
        left join
            {{ ref("i_pai_tab_lieu_trav") }} lieu
            on current_active.lieu_trav = lieu.lieu_trav
    )

-- *********************************************************************************
select *
from employes_active

where today_is_active = 1
