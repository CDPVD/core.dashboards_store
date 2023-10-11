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
    Compute a yearlied version of the stat_eng seed.

    The yearlied dimension expand the time validity
 #}
-- Padding the validity of the dimension : adding either the valid_from or the valid_end
with
    padded as (
        select
            src.stat_eng,
            src.is_reg,
            src.descr,
            coalesce(src.valid_from, 1950) as valid_from,
            coalesce(src.valid_until, {{ store.get_current_year() }} + 1) as valid_until
        from {{ ref("stat_eng") }} as src

    -- Repeat each code for each years codes are valid.
    ),
    crossed as (
        select
            src.stat_eng,
            src.is_reg,
            src.descr,
            src.valid_from + seq.seq_value as school_year,
            src.valid_until,
            row_number() over (
                partition by src.stat_eng order by src.valid_from + seq.seq_value desc
            ) as seq_id
        from padded as src
        cross join
            (
                select seq_value
                from {{ ref("int_sequence_0_to_1000") }}
                where seq_value between 0 and 100
            ) as seq
        where
            src.valid_from + seq.seq_value >= src.valid_from
            and src.valid_from + seq.seq_value < src.valid_until
    )

select
    school_year,
    stat_eng,
    is_reg,
    descr,
    concat(descr, ' - (', stat_eng, ')') as engagement_status_name,
    case when seq_id = 1 then 1 else 0 end as is_current
from crossed
