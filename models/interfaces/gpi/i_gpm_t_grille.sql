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
id_eco
,grille
,descr
,nb_jours
,nb_per
,hor_par_ele
,nb_min_ens_per
,nb_min_enc_per
,nb_per_ens_cyc
,nb_per_jour_ens
,opt_aff_jours
,opt_aff_per
,rem
,mise_page_hor_ele_portail
,mise_page_hor_ens_paie
,duree_min_diner
,duree_max_diner
,mise_page_hor_abs_portail
,nb_cyc_cal
,nb_jr_classe
,nb_jr_ped
,mise_page_hor_acc_dep
,nb_per_pres_ele
,mi_nb_total_per
from {{ var("database_gpi") }}.dbo.gpm_t_grille