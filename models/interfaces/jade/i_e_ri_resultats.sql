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
    codeperm,
    fiche as fiche,
    nomariane as nom,
    pnomlegal as prenom,
    ecocenoff as ecole,
    matcharl as matiere,
    anneesanct as annee_resultat,
    moissanct as mois_resultat,
    dateobtensionres as date_resultat,
    grpcharl as groupe,
    resecobrute as res_eco_brute,
    resecomod as res_eco_mod,
    resoffbrute as res_off_brute,
    resoffconv as res_off_conv,
    resofffinal as res_off_final,
    indreuscharl as ind_reus_charl,
    nbunitecharl as nb_unite_charl,
    regsanctcharl as reg_sanct_charl,
    annee as annee,
    typeformcharl as type_form_charl,
    typeclient as type_client,
    secteurenseignfreq as secteur_enseign_freq,
    datehrerecup as date_heure_recup
from {{ var("database_jade") }}.dbo.e_ri_resultats
