-- fact_ens_qualif.sql
select
    util.matr,
    emp.etat as etat_empl,
    emp.lieu_trav as workplace,
    emp.stat_eng,
    emp.type,
    emp.corp_empl,
    ca.emp_actif,
    qa.type_qualif
from {{ ref("dim_employees") }} as util
inner join {{ ref("i_pai_dos_empl") }} as emp on util.matr = emp.matr
inner join {{ ref("etat_empl") }} state on emp.etat = state.etat_empl

-- LEFT JOIN requis pour assurer une bonne représentation de la population
left join {{ ref("i_pai_qualif") }} as qa on util.matr = qa.matr
left join {{ ref("fact_activity_current") }} as ca on util.matr = ca.matr
where
    state.etat_actif = 1
    and emp.ind_empl_princ = 1
    and ca.emp_actif = 1
    and emp.corp_empl like '3%'
