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
    comp as (
        select
            emgrp_yearly_comp.fiche,
            emgrp_yearly_comp.id_eco,
            emgrp_yearly_comp.annee,
            emgrp_yearly_comp.code_matiere,
            emgrp_yearly_comp.groupe_matiere,
            emgrp_yearly_comp.etat,
            emgrp_yearly_comp.id_mat_ele,
            emgrp_yearly_comp.modele_etape,
            emgrp_yearly_comp.id_mat_grp,
            emgrp_yearly_comp.date_deb,
            emgrp_yearly_comp.date_fin,
            emgrp_yearly_comp.leg_obj_term,
            emgrp_yearly_comp.leg_obj_non_term,
            emgrp_yearly_comp.no_comp,
            emgrp_yearly_comp.leg_obj_final,
            o.id_obj_mat,
            o.res_final_obj as res_comp,
            eval_res_comp,
            {% for i in range(1, 31) %}
                emgrp_yearly_comp.etape_eval_{{ "%02d" % i }},
                o.res_obj_{{ "%02d" % i }},
            {% endfor %}
            case
                when left(emgrp_yearly_comp.groupe_matiere, 1) not like '[%0-9]%'  -- grp starting with a letter = retake
                then 1
                else 0
            end as is_reprise
        from
            {{ ref("stg_yearly_eleve_matiere_groupe_competence") }} as emgrp_yearly_comp
        inner join
            {{ ref("i_gpm_e_obj") }} as o
            on o.id_mat_ele = emgrp_yearly_comp.id_mat_ele
            and o.id_obj_mat = emgrp_yearly_comp.id_obj_mat
    )
select *
from comp
