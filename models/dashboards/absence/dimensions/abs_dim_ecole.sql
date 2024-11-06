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

{{ config(alias="dim_ecole") }}

select
    id_ecole = cast(e.annee as varchar) + cast(e.eco as varchar),
    annee = e.annee,
    ecole = e.eco,
    ecoleofficielle = isnull(e.eco_off, ''),
    categorieecole = isnull(e.cat_eco, ''),
    nomecole = isnull(e.nom_eco, ''),
    adresse = isnull(e.adr_eco, ''),
    codepostal = isnull(e.code_post, ''),
    directeur = isnull(e.nom_dir + ' ', '') + isnull(e.pnom_dir, ''),
    ecoleadmission = e.indic_eco_admission
from 
    {{ ref("i_gpm_t_eco") }} e
where 
    e.annee >= {{ store.get_recup_annee() }}