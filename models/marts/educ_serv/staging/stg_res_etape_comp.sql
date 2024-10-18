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
    stg_yearly_comp as (
        select
            res_comp.fiche,
            res_comp.id_eco,
            res_comp.annee,
            res_comp.code_matiere,
            res_comp.groupe_matiere,
            res_comp.etat,
            res_comp.id_mat_ele,
            res_comp.modele_etape,
            res_comp.id_mat_grp,
            res_comp.date_deb,
            res_comp.date_fin,
            res_comp.leg_obj_term,
            res_comp.leg_obj_non_term,
            res_comp.no_comp,
            met1.etape,
            met1.date_deb as date_debut_etape,
            met1.date_fin as date_fin_etape,
            res_comp.id_obj_mat,
            res_comp_etape = case
                met1.seq_etape
                {% for i in range(1, 31) %}
                    when {{ i }} then res_comp.res_obj_{{ "%02d" % i }}
                {% endfor %}
            end,
            legende = case
                when
                    met1.seq_etape = coalesce(
                        {% for i in range(1, 31) %}
                            {% if not loop.last %}
                                case
                                    when res_comp.etape_eval_{{ "%02d" % i }} = '1'
                                    then {{ i }}
                                    else null
                                end,
                            {% else %}
                                case
                                    when res_comp.etape_eval_{{ "%02d" % i }} = '1'
                                    then {{ i }}
                                    else null
                                end
                            {% endif %}
                        {% endfor %}
                    )
                then res_comp.leg_obj_term
                else res_comp.leg_obj_non_term
            end,
            etape_eval = case
                met1.seq_etape
                {% for i in range(1, 31) %}
                    when {{ i }} then res_comp.etape_eval_{{ "%02d" % i }}
                {% endfor %}
            end,
            is_reprise
        from {{ ref("stg_res_bilan_comp") }} as res_comp
        inner join
            {{ ref("i_gpm_t_modele_etape_etapes") }} as met1
            on met1.id_eco = res_comp.id_eco
            and met1.modele_etape = res_comp.modele_etape
            and met1.date_fin between res_comp.date_deb and res_comp.date_fin
    )
select
    fiche,
    id_eco,
    annee,
    code_matiere,
    groupe_matiere,
    etat,
    id_mat_ele,
    etape,
    date_debut_etape,
    date_fin_etape,
    id_obj_mat,
    no_comp,
    res_comp_etape,
    etape_eval,
    legende,
    is_reprise
from stg_yearly_comp
where res_comp_etape is not null
