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
        alias="report_epreuves_obligatoires_internes",
    )
}}

with
    agg as (
        select
            res.annee,
            res.ecole,
            -- code_matiere,
            description_matiere,
            population,
            genre,
            plan_interv_ehdaa,
            dist,
            class,
            grp_rep,
            count(res.fiche) as nb_eleve,
            avg(is_reussite) as taux_reussite,
            avg(is_difficulte) as taux_difficulte,
            avg(is_echec) as taux_echec,
            avg(is_maitrise) as taux_maitrise,
            avg(res_etape_num) as moyenne,
            coalesce(stdev(res_etape_num), 0) as ecart_type
        from {{ ref("rstep_fact_epreuves_obligatoires_internes") }} res
        left join
            {{ ref("fact_yearly_student") }} as el_y
            on res.fiche = el_y.fiche
            and res.annee = el_y.annee
        left join {{ ref("dim_eleve") }} as el on res.fiche = el.fiche
        group by
            res.annee,
            description_matiere,
            cube (res.ecole, population, genre, plan_interv_ehdaa, dist, class, grp_rep)

    ),
    src as (
        select
            annee,
            coalesce(ecole, 'CSS') as ecole,
            description_matiere,
            population,
            genre,
            plan_interv_ehdaa,
            dist,
            class,
            grp_rep,
            nb_eleve,
            taux_reussite,
            taux_difficulte,
            taux_echec,
            taux_maitrise,
            moyenne,
            ecart_type
        from agg
    )
select
    {{ dbt_utils.generate_surrogate_key(["annee", "ecole", "description_matiere"]) }}
    as id_epreuve,
    annee,
    ecole,
    description_matiere,
    population,
    genre,
    plan_interv_ehdaa,
    dist,
    class,
    grp_rep,
    nb_eleve,
    taux_reussite,
    taux_difficulte,
    taux_echec,
    taux_maitrise,
    moyenne,
    taux_reussite - taux_reussite_css as ecart_taux_reussite,
    taux_difficulte - taux_difficulte_css as ecart_taux_difficulte,
    taux_echec - taux_echec_css as ecart_taux_echec,
    taux_maitrise - taux_maitrise_css as ecart_taux_maitrise,
    moyenne - moyenne_css as ecart_moyenne
from
    src as a
    cross apply(
        select
            avg(is_reussite) as taux_reussite_css,
            avg(is_difficulte) as taux_difficulte_css,
            avg(is_echec) as taux_echec_css,
            avg(is_maitrise) as taux_maitrise_css,
            avg(res_etape_num) as moyenne_css
        from {{ ref("rstep_fact_epreuves_obligatoires_internes") }} as b
        where b.annee = a.annee and b.description_matiere = a.description_matiere
        group by annee, description_matiere
    ) c
