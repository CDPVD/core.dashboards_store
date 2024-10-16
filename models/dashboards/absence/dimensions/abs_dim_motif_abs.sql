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

{{ config(alias="dim_motif_abs") }}

WITH EcoData AS (
    SELECT
        E.ID_ECO,
        E.ANNEE,
        E.ECO        
    FROM {{ ref("i_gpm_t_eco") }} E
    WHERE E.ANNEE >= {{ store.get_recup_annee() }}
)
SELECT
 ID_MOTIF_ABS = CAST(ED.ANNEE AS VARCHAR) + CAST(ED.ECO AS VARCHAR) + CAST(MAB.MOTIF_ABS AS VARCHAR)
, ED.ANNEE
, ED.ECO
, MAB.ID_ECO
, MAB.MOTIF_ABS
, MAB.CAT_ABS
, MAB.DESCR
, MAB.CPT_ABS
, Descript_CPT_ABS = IsNull((
    SELECT CF_Descr FROM {{ ref("i_wl_descr") }} WHERE NOM_TABLE = 'CPT_ABS' And CODE = MAB.CPT_ABS), ''
    )
, MAB.REM
, MAB.ACCES_PARENT_PORTAIL
, MAB.ABS_A_JUSTIFIER_PARENT_PORTAIL
, MAB.DESCR_PORTAIL
, MAB.CODE_SENTINELLE
, MAB.AVERT_LOCAL_ENC

FROM {{ ref("i_gpm_t_motif_abs") }} MAB
     JOIN EcoData ED ON MAB.ID_ECO = ED.ID_ECO