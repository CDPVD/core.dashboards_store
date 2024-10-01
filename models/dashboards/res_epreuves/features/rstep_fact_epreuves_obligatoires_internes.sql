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
    Blend together the default and the customs table (not yet implemented)
#}
{{
    config(
        alias="fact_epreuves_obligatoires_internes",
    )
}}

select
    annee_scolaire,
    res.annee,
    school_friendly_name as ecole,
    fiche,
    res.code_matiere,
    friendly_name as description_matiere,
    res_comp_etape,
    res_etape_num,
    case when is_reussite = 'R' then 1. else 0. end as is_reussite,
    is_echec,
    is_difficulte,
    is_maitrise,
    is_reprise
from {{ ref("fact_resultat_etape_competence") }} as res
inner join
    {{ ref("dim_mapper_schools") }} as mapper_school
    on res.id_eco = mapper_school.id_eco
inner join
    {{ ref("rstep_dim_epreuves") }} as mat
    on mat.code_matiere = res.code_matiere
    and mat.code_etape = res.etape
    and mat.no_competence = res.no_comp
where res.res_comp_etape is not null
