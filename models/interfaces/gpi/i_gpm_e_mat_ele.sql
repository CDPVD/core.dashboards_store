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
    id_mat_ele,
    id_mat_grp,
    fiche,
    id_eco,
    mat,
    grp,
    etat,
    res_meq,
    r100_meq,
    unites_ele,
    res_som,
    res_pond_som,
    pond_som,
    {% for i in range(1, 31) %} res_etape_{{ "%02d" % i }}, {% endfor %}
    {% for i in range(1, 31) %} res_pond_etape_{{ "%02d" % i }}, {% endfor %}
    type_form_mat,
    rem,
    res_som_etapes,
    res_som_calc,
    jugement,
    reprise,
    modele_etape,
    mois_sanction
from {{ var("database_gpi") }}.dbo.gpm_e_mat_ele
