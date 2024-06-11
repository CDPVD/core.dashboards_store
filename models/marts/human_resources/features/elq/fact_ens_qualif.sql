-- fact_ens_qualif.sql
select
    util.matr,
    util.birth_date,
    emp.etat as etat_empl,
    emp.lieu_trav as workplace,
    emp.stat_eng,
    emp.type,
    util.sex_friendly_name as genre,
    emp.corp_empl,
    emp.mode_cour,
    ca.emp_actif,
    qa.type_qualif
from {{ ref("dim_employees") }} as util
left join {{ ref("i_pai_dos_empl") }} as emp on util.matr = emp.matr
left join {{ ref("fact_activity_current") }} as ca on util.matr = ca.matr
left join {{ ref("etat_empl") }} state on emp.etat = state.etat_empl
left join {{ ref("i_pai_qualif") }} as qa on util.matr = qa.matr

where state.etat_actif = 1 and emp.ind_empl_princ = 1 and emp.corp_empl like '3%'
