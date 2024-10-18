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
    code_perm,
    fiche,
    nom,
    pnom as prenom,
    concat(nom, ', ', pnom, ' (', fiche, ' )') as nom_prenom_fiche,
    date_naissance,
    case
        when ele.sexe = 'F' then 'Fille' when ele.sexe = 'M' then 'Garçon' else ele.sexe
    end as genre

from {{ ref("i_gpm_e_ele") }} as ele
