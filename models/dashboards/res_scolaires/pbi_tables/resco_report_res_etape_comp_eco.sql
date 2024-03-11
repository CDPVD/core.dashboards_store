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
        alias="report_res_etape_comp_eco",
    )
}}

with
    data as (
        select
            y_stud.population,
            eta_comp.annee,
            y_stud.nom_ecole,
            y_stud.eco,
            el.genre,
            y_stud.plan_interv_ehdaa,
            eta_comp.code_matiere,
            eta_comp.etape,
            eta_comp.no_comp,
            eta_comp.res_etape_num,
            eta_comp.is_reussite
        from {{ ref("fact_resultat_etape_competence") }} as eta_comp
        inner join
            {{ ref("fact_yearly_student") }} as y_stud
            on eta_comp.fiche = y_stud.fiche
            and eta_comp.id_eco = y_stud.id_eco
        inner join {{ ref("dim_eleve") }} as el on y_stud.code_perm = el.code_perm
        inner join
            {{ ref("resco_dim_matiere") }} as dim
            on dim.cod_matiere = eta_comp.code_matiere  -- Only keep the tracked courses
        where
            y_stud.annee
            between {{ get_current_year() }} - 4 and {{ get_current_year() }}
            and eta_comp.res_etape_num is not null
            and eta_comp.etape != 'EX'
            and el.genre != 'X'  -- Non binaire
            and eta_comp.is_reprise = 0
    ),

    cal as (
        select
            *,
            case when is_reussite = 'E' then 1. else 0. end as tx_echec,
            case when is_reussite = 'R' then 1. else 0. end as tx_reussite,
            case
                when
                    res_etape_num > 59
                    and res_etape_num
                    < {{ var("res_scolaires", {"threshold": 70})["threshold"] }}
                then 1.
                else 0.
            end as tx_risque,
            case
                when
                    res_etape_num
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
            nom_ecole,
            eco,
            code_matiere,
            etape,
            coalesce(genre, 'Tout') as genre,
            coalesce(plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            no_comp,
            count(res_etape_num) as n_obs,
            avg(tx_reussite) as taux_reussite,
            sum(tx_reussite) as n_reussite,
            avg(tx_risque) as taux_risque,
            sum(tx_risque) as n_risque,
            avg(tx_echec) as taux_echec,
            sum(tx_echec) as n_echec,
            avg(tx_maitrise) as taux_maitrise,
            sum(tx_maitrise) as n_maitrise,
            avg(try_cast(res_etape_num as decimal(5, 2))) as resultat_avg
        from cal
        group by
            annee,
            code_matiere,
            no_comp,
            etape,
            nom_ecole,
            eco, cube (genre, population, plan_interv_ehdaa)

    -- Add the statistis
    ),
    stats as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    [
                        "population",
                        "annee",
                        "agg.code_matiere",
                        "agg.no_comp",
                        "etape",
                        "genre",
                        "plan_interv_ehdaa",
                    ]
                )
            }} as primary_key,
            population,
            annee,
            nom_ecole,
            eco,
            agg.code_matiere,
            dim.des_matiere,
            agg.no_comp,
            descr_comp.description,
            genre,
            plan_interv_ehdaa,
            etape,
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
        inner join
            {{ ref("resco_dim_matiere") }} as dim on dim.cod_matiere = agg.code_matiere
    ),
    ecart as (
        select
            stats.*,
            (stats.taux_reussite) - (stcss.taux_reussite) as ecart_percent_of_success,
            (stats.taux_risque) - (stcss.taux_risque) as ecart_percent_of_risque,
            (stats.taux_echec) - (stcss.taux_echec) as ecart_percent_of_echec,
            (stats.taux_maitrise) - (stcss.taux_maitrise) as ecart_percent_of_maitrise,
            (stats.resultat_avg) - (stcss.resultat_avg) as ecart_resultat_avg
        from stats
        inner join
            {{ ref("resco_report_res_etape_comp_css") }} as stcss
            on stats.primary_key = stcss.primary_key
    ),
    rank_ as (
        select
            *,
            dense_rank() over (
                partition by primary_key order by ecart_resultat_avg desc
            ) as ecart_resultat_avg_rank,
            dense_rank() over (
                partition by primary_key order by ecart_percent_of_success desc
            ) as ecart_percent_of_success_rank
        from ecart
    )
select
    -- Dimensions
    primary_key,
    population,
    annee,
    plan_interv_ehdaa,
    eco,
    nom_ecole,
    code_matiere,
    des_matiere,
    genre,
    no_comp,
    etape,
    description,
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
    resultat_avg,
    ecart_percent_of_success,
    ecart_percent_of_risque,
    ecart_percent_of_echec,
    ecart_percent_of_maitrise,
    ecart_resultat_avg,
    ecart_resultat_avg_rank,
    ecart_percent_of_success_rank
from rank_
