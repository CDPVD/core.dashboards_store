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
with
    src as (
        select
            src.annee,
            src.fiche,
            src.eco,
            el.genre,
            src.plan_interv_ehdaa,
            src.population,
            case
                when mentions.ind_reus_sanct_charl = 'O' then 1.0 else 0.0
            end as 'ind_obtention'
        from {{ ref("stg_perimetre_eleve_diplomation_des") }} as src
        left join {{ ref("i_e_ri_mentions") }} as mentions on src.fiche = mentions.fiche
        left join {{ ref("dim_eleve") }} as el on src.fiche = el.fiche
        where mentions.prog_charl = '6200'
    ),

    agg_dip as (
        select
            '1.1.1.1' as id_indicateur,
            annee,
            eco,
            genre,
            plan_interv_ehdaa,
            population,
            count(fiche) nb_resultat,
            avg(ind_obtention) as avg_diplo
        from src
        group by annee, cube (eco, genre, plan_interv_ehdaa, population)
    )

select
    ind.id_indicateur,
    ind.description_indicateur,
    agg_dip.annee,
    coalesce(agg_dip.eco, 'Tout') as eco,
    coalesce(sch.school_friendly_name, 'Tout') as nom_ecole,
    coalesce(agg_dip.genre, 'Tout') as genre,
    coalesce(agg_dip.plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
    coalesce(agg_dip.population, 'Tout') as population,
    nb_resultat,
    avg_diplo
from agg_dip
left join
    {{ ref("dim_mapper_schools") }} as sch
    on agg_dip.annee = sch.annee
    and agg_dip.eco = sch.eco
inner join
    {{ ref("pevr_dim_indicateurs") }} as ind
    on agg_dip.id_indicateur = ind.id_indicateur
