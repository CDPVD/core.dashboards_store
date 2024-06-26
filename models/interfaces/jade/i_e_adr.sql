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
    typeadr as type_adr,
    dateeffect as date_effect,
    datefin as date_fin,
    nociv as no_civ,
    orientrue as orient_rue,
    genrerue as genre_rue,
    rue,
    app,
    ville,
    prov,
    codepost as code_post,
    envoimeq as ind_envoi_meq,
    envoidoc as ind_envoi_doc,
    envoitrsp as ind_envoi_trsp
from {{ var("database_jade") }}.dbo.e_adr
