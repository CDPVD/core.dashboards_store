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
    annee,
    simul,
    bloc,
    genreadr as genre_adr,
    dateappl as date_effect,
    nociv as no_civ,
    orientrue as orient_rue,
    genrerue as genre_rue,
    rue,
    appart,
    ville,
    prov,
    codepost as code_post,
    longitude,
	latitude,
	distbat as distance_batisse,
    indenvoimeq as ind_envoi_meq
from {{ var("database_geobus") }}.dbo.geo_e_adr