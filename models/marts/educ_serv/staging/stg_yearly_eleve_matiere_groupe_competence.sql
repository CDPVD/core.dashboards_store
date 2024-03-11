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
with
    stg_yearly as (
        select
            emgrp_yearly.fiche,
            emgrp_yearly.id_eco,
            emgrp_yearly.annee,
            emgrp_yearly.code_matiere,
            emgrp_yearly.groupe_matiere,
            emgrp_yearly.etat,
            emgrp_yearly.id_mat_ele,
            emgrp_yearly.res_som,
            emgrp_yearly.modele_etape,
            emgrp_yearly.id_mat_grp,
            emgrp_yearly.date_deb,
            emgrp_yearly.date_fin,
            emgrp_yearly.leg_obj_term,
            emgrp_yearly.leg_obj_non_term,
            emgrp_yearly.leg_obj_final,
            om.id_obj_mat,
            eval_res_comp,
            {% for i in range(1, 31) %} omg.etape_eval_{{ "%02d" % i }}, {% endfor %}
            om.obj_01 as no_comp
        from {{ ref("stg_yearly_eleve_matiere_groupe") }} as emgrp_yearly
        inner join
            {{ ref("i_gpm_t_obj_mat") }} as om
            on om.id_eco = emgrp_yearly.id_eco
            and om.mat = emgrp_yearly.code_matiere
            and om.obj_02 is null
            and om.obj_03 is null
            and om.obj_04 is null
        inner join
            {{ ref("i_gpm_t_obj_mat_grp") }} as omg
            on omg.id_obj_mat = om.id_obj_mat
            and omg.id_mat_grp = emgrp_yearly.id_mat_grp
    )

select *
from stg_yearly
