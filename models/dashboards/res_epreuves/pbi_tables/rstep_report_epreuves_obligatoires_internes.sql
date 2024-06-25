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
    step1 as (
        select
            res.fiche,
            res.annee_scolaire,
            res.ecole,
            description_matiere,
            case when population is null then '-' else population end as population,
            case when genre is null then '-' else genre end as genre,
            case
                when plan_interv_ehdaa is null then '-' else plan_interv_ehdaa
            end as plan_interv_ehdaa,
            case when dist is null then '-' else dist end as dist,
            case when class is null then '-' else class end as class,
            case when grp_rep is null then '-' else grp_rep end as grp_rep,
            is_reussite,
            is_difficulte,
            is_echec,
            is_maitrise,
            res_etape_num
        from {{ ref("rstep_fact_epreuves_obligatoires_internes") }} res
        left join
            {{ ref("fact_yearly_student") }} as el_y
            on res.fiche = el_y.fiche
            and res.annee = el_y.annee

        left join {{ ref("dim_eleve") }} as el on res.fiche = el.fiche and genre != 'x'
    ),
    agg as (
        select
            annee_scolaire,
            ecole,
            description_matiere,
            population,
            genre,
            plan_interv_ehdaa,
            dist,
            class,
            grp_rep,
            count(fiche) as nb_eleve,
            avg(is_reussite) as taux_reussite,
            avg(is_difficulte) as taux_difficulte,
            avg(is_echec) as taux_echec,
            avg(is_maitrise) as taux_maitrise,
            avg(res_etape_num) as moyenne,
            coalesce(stdev(res_etape_num), 0) as ecart_type
        from step1
        group by
            annee_scolaire,
            description_matiere,
            cube (ecole, population, genre, plan_interv_ehdaa, dist, class, grp_rep)

    ),
    src as (
        select
            annee_scolaire,
            coalesce(ecole, 'CSS') as ecole,
            description_matiere,
            coalesce(population, 'Tout') as population,
            coalesce(genre, 'Tout') as genre,
            coalesce(plan_interv_ehdaa, 'Tout') as plan_interv_ehdaa,
            coalesce(dist, 'Tout') as dist,
            coalesce(class, 'Tout') as class,
            coalesce(grp_rep, 'Tout') as grp_rep,
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
    {{
        dbt_utils.generate_surrogate_key(
            ["annee_scolaire", "ecole", "description_matiere"]
        )
    }} as id_epreuve,
    annee_scolaire,
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
    (taux_reussite - taux_reussite_css) * 100 as ecart_taux_reussite,
    {# (taux_difficulte - taux_difficulte_css)*100 as ecart_taux_difficulte,
    (taux_echec - taux_echec_css)*100 as ecart_taux_echec,
    (taux_maitrise - taux_maitrise_css)*100 as ecart_taux_maitrise, #}
    moyenne - moyenne_css as ecart_moyenne,
    taux_reussite_css,
    moyenne_css
from
    src as a
    cross apply(
        select
            taux_reussite as taux_reussite_css,
            taux_difficulte as taux_difficulte_css,
            taux_echec as taux_echec_css,
            taux_maitrise as taux_maitrise_css,
            moyenne as moyenne_css
        from src as b
        where
            b.annee_scolaire = a.annee_scolaire
            and b.description_matiere = a.description_matiere
            and b.ecole = 'CSS'
            and b.genre = 'tout'
            and b.population = 'tout'
            and b.plan_interv_ehdaa = 'tout'
            and b.grp_rep = 'Tout'
            and b.dist = 'Tout'
            and b.class = 'Tout'
    ) c
