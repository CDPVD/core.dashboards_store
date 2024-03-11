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
{{
    config(
        alias="report_res_bilan_comp_css",
    )
}}

with
    data as (
        select
            y_stud.population,
            res_bilan.annee,
            el.genre,
            y_stud.plan_interv_ehdaa,
            res_bilan.code_matiere,
            res_bilan.no_comp,
            res_bilan.res_num_comp,
            res_bilan.is_reussite
        from {{ ref("fact_resultat_bilan_competence") }} as res_bilan
        inner join
            {{ ref("fact_yearly_student") }} as y_stud
            on res_bilan.fiche = y_stud.fiche
            and res_bilan.id_eco = y_stud.id_eco
        inner join {{ ref("dim_eleve") }} as el on y_stud.code_perm = el.code_perm
        inner join
            {{ ref("resco_dim_matiere") }} as dim
            on dim.cod_matiere = res_bilan.code_matiere  -- Only keep the tracked courses
        where
            res_bilan.annee
            between {{ get_current_year() }} - 4 and {{ get_current_year() }}
            and res_bilan.res_num_comp is not null
            and el.genre != 'X'  -- Non binaire
            and res_bilan.is_reprise = 0
    ),

    cal as (
        select
            *,
            case when is_reussite = 'E' then 1. else 0. end as tx_echec,
            case when is_reussite = 'R' then 1. else 0. end as tx_reussite,
            case
                when
                    res_num_comp > 59
                    and res_num_comp
                    < {{ var("res_scolaires", {"threshold": 70})["threshold"] }}
                then 1.
                else 0.
            end as tx_risque,
            case
                when
                    res_num_comp
                    >= {{ var("res_scolaires", {"threshold": 70})["threshold"] }}
                then 1.
                else 0.
            end as tx_maitrise
        from data
    ),
    agg as (
        select
            coalesce(population, 'Tout') as population,
            annee,
            code_matiere,
            coalesce(genre, 'Tout') as genre,
            coalesce(plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            no_comp,
            count(res_num_comp) as n_obs,
            avg(tx_reussite) as taux_reussite,
            sum(tx_reussite) as n_reussite,
            avg(tx_risque) as taux_risque,
            sum(tx_risque) as n_risque,
            avg(tx_echec) as taux_echec,
            sum(tx_echec) as n_echec,
            avg(tx_maitrise) as taux_maitrise,
            sum(tx_maitrise) as n_maitrise,
            avg(try_cast(res_num_comp as decimal(5, 2))) as resultat_avg
        from cal
        group by
            annee, code_matiere, no_comp, cube (genre, population, plan_interv_ehdaa)
    -- Add the statistis
    )
select
    -- Dimensions
    {{
        dbt_utils.generate_surrogate_key(
            [
                "population",
                "annee",
                "agg.code_matiere",
                "agg.no_comp",
                "genre",
                "plan_interv_ehdaa",
            ]
        )
    }} as primary_key,
    population,
    annee,
    agg.code_matiere,
    dim.des_matiere,
    agg.no_comp,
    descr_comp.description,
    genre,
    plan_interv_ehdaa,
    -- Metrics
    n_obs,
    taux_reussite,
    n_reussite,
    taux_risque,
    n_echec,
    taux_echec,
    n_risque,
    taux_maitrise,
    n_maitrise,
    resultat_avg
from agg
inner join
    {{ ref("stg_descr_comp") }} as descr_comp
    on agg.code_matiere = descr_comp.mat
    and agg.no_comp = descr_comp.obj_01
inner join {{ ref("resco_dim_matiere") }} as dim on dim.cod_matiere = agg.code_matiere
