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
    
    This table unionize the always-present DEFAULT table and maybe-present CUSTOM table.
    The default table is defined in the core repo while the custom table, as all the CSS''s specifics table is created in the repo css.

    The code check for the custom table existence and adds it to the default table
    For the CUSTOM table to be detected, the table must be :
        * named ''
        * located in the schema ''
#}

{{ config(alias="dim_matiere_groupe") }}

with ecodata as (
    select
        e.id_eco,
        e.annee,
        e.eco        
    from {{ ref("i_gpm_t_eco") }} e
    where e.annee >= {{ store.get_recup_annee() }}
)
select
    id_matiere_groupe = mg.id_mat_grp
    , annee = ed.annee
    , ecole = ed.eco
    , codematiere = mg.mat
    , descriptmatiere = isnull((
        select  m.descr from {{ ref("i_gpm_t_mat") }} m where m.mat= mg.mat and m.id_eco=  mg.id_eco), '')
    , matieregroupe = isnull(mg.grp, '')
    , categoriematieregroupe = isnull(mg.cat_mat_grp, '')
    , codeintervenant = isnull(mg.interv, '')
    , intervenant = (
        select i.nom +' '+ i.pnom from {{ ref("i_gpm_t_interv") }} i where mg.id_eco = i.id_eco and i.interv = mg.interv)
    , modeleevaluation = isnull(mg.modele_eval, '')
    , modeleevaluationdescription = (
        select mev.descr from {{ ref("i_gpm_t_modele_eval") }} mev where mg.id_eco = mev.id_eco and mev.modele_eval =mg.modele_eval)
    , activite = isnull(mg.activ, '')
    , activitedescription = isnull((
        select cf_descr from {{ ref("i_wl_descr") }} where nom_table = 'activ' and code = mg.activ), '')
    , nbelevesgroupe = isnull(mg.nb_ele, 0)
    , grille = isnull(mg.grille, '')
from {{ ref("i_gpm_t_mat_grp") }} mg join ecodata ed on  mg.id_eco = ed.id_eco