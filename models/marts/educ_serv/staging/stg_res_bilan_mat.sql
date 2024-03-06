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
    mat_ele as (
        select
            emgrp_yearly.fiche,
            emgrp_yearly.id_eco,
            emgrp_yearly.annee,
            emgrp_yearly.code_matiere,
            emgrp_yearly.groupe_matiere,
            emgrp_yearly.etat,
            emgrp_yearly.id_mat_ele,
            emgrp_yearly.res_som,
            emgrp_yearly.res_meq,
            mat.unites,
            {% for i in range(1, 31) %}
                emgrp_yearly.res_etape_{{ "%02d" % i }},
            {% endfor %}
            {% for i in range(1, 31) %}
                emgrp_yearly.eval_res_etape_{{ "%02d" % i }},
            {% endfor %}
            {% for i in range(1, 31) %} leg_etape_{{ "%02d" % i }}, {% endfor %}
            case
                when left(emgrp_yearly.groupe_matiere, 1) not like '[%0-9]%'  -- grp starting with a letter = retake
                then 1
                else 0
            end as is_reprise,
            emgrp_yearly.date_deb,
            emgrp_yearly.date_fin,
            emgrp_yearly.modele_etape,
            emgrp_yearly.leg_som
        from {{ ref("stg_yearly_eleve_matiere_groupe") }} as emgrp_yearly
        inner join
            {{ ref("i_gpm_t_mat") }} as mat
            on mat.id_eco = emgrp_yearly.id_eco
            and emgrp_yearly.code_matiere = mat.mat
    )
select *
from mat_ele
