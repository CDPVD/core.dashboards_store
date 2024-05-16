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
select
    std.fiche,
    std.id_eco,
    std.annee,
    mat_ele.mat as code_matiere,
    mat_ele.grp as groupe_matiere,
    mat_ele.etat,
    mat_ele.id_mat_ele,
    mat_ele.res_som,
    mat_ele.res_meq,
    {% for i in range(1, 31) %} mat_ele.res_etape_{{ "%02d" % i }}, {% endfor %}
    {% for i in range(1, 31) %} mg.eval_res_etape_{{ "%02d" % i }}, {% endfor %}
    {% for i in range(1, 31) %} mg.leg_etape_{{ "%02d" % i }}, {% endfor %}
    mat_ele.modele_etape,
    mat_ele.id_mat_grp,
    oa.date_deb,
    oa.date_fin,
    mg.leg_som,
    mg.leg_obj_term,
    mg.leg_obj_non_term,
    mg.eval_res_obj_final as eval_res_comp,
    mg.leg_obj_final
from {{ ref("fact_yearly_student") }} as std
inner join
    {{ ref("i_gpm_e_mat_ele") }} as mat_ele
    on std.fiche = mat_ele.fiche
    and std.id_eco = mat_ele.id_eco
inner join {{ ref("i_gpm_t_mat_grp") }} as mg on mat_ele.id_mat_grp = mg.id_mat_grp
inner join
    {{ ref("i_gpm_t_org_annee") }} as oa
    on oa.annee = std.annee
    and std.annee >= {{ store.get_current_year() }} - 10
where
    mat_ele.res_som is not null  -- prendre en note le risque de perdre des données pour la compétence. a voir à le 2e itérations.
    and mat_ele.etat != 0  -- -- 0 = inactive, 1 = active, 5 = en continuation, 6 = equivalence, 8 = terminee
    and mat_ele.modele_etape is not null
