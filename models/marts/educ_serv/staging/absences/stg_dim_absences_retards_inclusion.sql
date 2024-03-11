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
{#
	This table select the absences reason to include in the computation.
    This file acts a hook for the integrator to exclude the retard from the computation.
    It's designed to be overrided. By default, we include all reasons. 
    We used the cpt_abs column to group up the absences by categories. 
    The mapping is described in the stored-Proc [dbo].[GPI_UPDATE_CPT_ABS_MAT_ABS] 

    By default, we split between absences and lateness. You can override and add a case to get am ore granular metrics decomposition.
    # absence motivée -> cpt_abs = 1 
    # absence non-motivée -> cpt_abs = 2
    # retard -> cpt_abs = 3

#}
select
    id_eco,
    motif_abs,
    descr as description_abs,
    case
        when cpt_abs in (1, 2) then 'absence' when cpt_abs = 3 then 'retard' else null  -- Test hook.
    end as category_abs
from {{ ref("i_gpm_t_motif_abs") }}
where cpt_abs is not null  -- Filter out the motiveless absences / lateness
group by
    id_eco,
    motif_abs,
    descr,  -- Test hook. Schould be a dummy aggregation. A test will raise an error if a motif_abs has more than one description. If so, we would need to implement a way to disembiguate. As there is now dates in the table, the disembiguation is unsure as of right now. I then don't implement it right-now to not introduce a silent bug.
    cpt_abs  -- Test hook. Schould be a dummy aggregation. A test will raise an error if a motif_abs belongs to more than one category_abs

    -- For instance if you want to exclude the retard from the downstream
    -- computation, you can, for instance, add the following where clause:
    -- where cpt_abs != 3.
    
