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
    raw_data as (
        select
            mat.id_eco,
            mat.mat,
            mat.descr as description,
            mat.descr_abreg as description_abreg,
            row_number() over (partition by mat.mat order by mat.id_eco desc) as seqid
        from {{ ref("i_gpm_t_mat") }} as mat
        where descr is not null
    )

select id_eco, mat, description, description_abreg
from raw_data
where seqid = 1
