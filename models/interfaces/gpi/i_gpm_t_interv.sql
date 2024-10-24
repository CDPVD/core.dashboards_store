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

select id_eco
      ,interv
      ,util
      ,cat_interv
      ,nom
      ,pnom
      ,casier_pers
      ,tel
      ,telecop
      ,adr_electr
      ,matr_paie
      ,util_regis
      ,rep_regis
      ,mot_passe_regis
      ,champ_ens
      ,loc_hab_01
      ,loc_hab_02
      ,interv_part
      ,hor
      ,rem
      ,lst_carac_interv
      ,rem_eff
      ,date_time_maj_doss_eff
      ,nb_maj_eff
      ,rem_hor
      ,date_hre_maj_cyc
      ,date_hre_maj_cal
      ,fonction
      ,date_hre_maj_paie
      ,adr_electr_pub
      ,nas
      ,grille_defaut
      ,nb_min_ens_hebdo
      ,nb_min_ens_cyc
      ,mise_page_hor
      ,rep_nom_fich_sign
      ,photo_interv
      ,mime_type_photo_interv
      ,comment_gte
      ,prefixe_nom
      ,moy_per
      ,moy_min
      ,photo_interv_imagette
      ,mime_type_photo_interv_imagette
      ,ident_valide_paie
  from {{ var("database_gpi") }}.dbo.gpm_t_interv