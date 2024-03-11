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
    row_num as (
        select
            obj_mat.mat,
            mat.description_abreg as description_mat_abreg,
            obj_mat.obj_01,
            obj_mat.descr as description,
            obj_mat.descr_abreg as description_abreg,
            row_number() over (
                partition by obj_mat.mat, obj_mat.obj_01
                order by obj_mat.id_obj_mat desc
            ) as seqid
        from {{ ref("i_gpm_t_obj_mat") }} as obj_mat
        inner join
            {{ ref("stg_descr_mat") }} as mat
            on obj_mat.id_eco = mat.id_eco
            and obj_mat.mat = mat.mat
        where descr is not null
    ),
    step as (
        select mat, description_mat_abreg, obj_01, description, description_abreg
        from row_num
        where seqid = 1
    )
select
    mat,
    obj_01,
    description,
    case
        when description_mat_abreg like 'Fr%' and description_abreg like 'Écrire'
        then 'Écrire_fr'
        when description_mat_abreg like 'Fr%' and description_abreg like 'Communiquer'
        then 'Communiquer_fr'
        when description_mat_abreg like 'ang%' and description_abreg like 'Écrire'
        then 'Écrire_ang'
        when description_mat_abreg like 'ang%' and description_abreg like 'Communiquer'
        then 'Communiquer_ang'
        when description_abreg = 'Utiliser'
        then 'Raisonner'
        else description_abreg
    end as description_abreg
from step
