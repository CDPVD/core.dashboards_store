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
    fiche,
    id_eco,
    cycle_ref,
    annee_cycle_ref,
    grp_rep,
    statut_don_an,
    effectif,
    ordre_ens,
    classe,
    class,
    dist,
    date_deb,
    plan_interv_ehdaa,
    difficulte,
    age_30_sept,
    categ_prog_part,
    type_prog_part,
    regrp_ehdaa
from {{ var("database_gpi") }}.dbo.gpm_e_dan
