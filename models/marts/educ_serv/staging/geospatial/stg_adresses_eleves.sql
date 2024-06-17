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
    adr as (
        select
            fiche,
            type_adr,
            no_civ,
            orient_rue,
            genre_rue,
            rue,
            ville,
            cast(date_effect as date) as date_effect,
            date_fin,
            ind_envoi_meq,
            code_post,
            row_number() over (partition by fiche order by date_effect) as seqid  -- pour identifier la 1ere adresse
        from {{ ref("i_e_adr") }}
        where date_effect != date_fin

    -- fiches avec un seul type d'adresse -> on considere tt les adresses
    ),
    adr2 as (
        select fiche, count(distinct type_adr) as nb_type_adr from adr group by fiche

    -- fiches avec un plusieurs types d'adresse -> on considere uniquement celles avec
    -- un ind_envoi_meq de 1 (sauf date initiale)
    ),
    adr3 as (
        select *
        from adr
        where
            fiche in (select distinct fiche from adr2 where nb_type_adr != 1)
            and ind_envoi_meq = 1
            and seqid != 1

    -- adresses à considerer
    ),
    adr4 as (
        select *
        from adr
        where
            seqid = 1
            or fiche in (select distinct fiche from adr2 where nb_type_adr = 1)
        union all
        select *
        from adr3

    -- modifier les dates effectives avec les adresses conservées
    ),
    adr5 as (
        select
            fiche,
            no_civ,
            orient_rue,
            genre_rue,
            rue,
            ville,
            date_effect,
            case
                when
                    (lead(date_effect) over (partition by fiche order by date_effect))
                    is null
                then getdate()
                else
                    dateadd(
                        day,
                        -1,
                        lead(date_effect) over (partition by fiche order by date_effect)
                    )
            end as date_effect_fin,
            code_post
        from adr4

    -- identifier les annees scolaire d'appartenance de chaque CP
    ),
    y_sco as (
        select
            fiche,
            no_civ,
            orient_rue,
            genre_rue,
            rue,
            ville,
            date_effect,
            date_effect_fin,
            case
                when month(date_effect) <= 6
                then year(date_effect) - 1
                else year(date_effect)
            end as annee_sco_deb,
            case
                when month(date_effect_fin) < 9
                then year(date_effect_fin) - 1
                else year(date_effect_fin)
            end as annee_sco_fin,
            code_post
        from adr5

    -- recuperer les annees scolaire de debut et de fin pour chaque fiche
    ),
    tab as (
        select
            fiche,
            min(annee_sco_deb) as annee_sco_deb,
            max(annee_sco_fin) as annee_sco_fin
        from y_sco
        group by fiche

    -- generer une table fiche/annee et joindre les CP
    ),
    long as (
        select t.fiche, t.annee_sco_deb + number as annee
        from tab as t
        join
            master..spt_values n
            on type = 'p'
            and number between 0 and t.annee_sco_fin - t.annee_sco_deb

    -- generer un seq_id pour garder le cp le plus recent
    ),
    last_cp as (
        select
            long.fiche,
            long.annee,
            y_sco.no_civ,
            y_sco.orient_rue,
            y_sco.genre_rue,
            y_sco.rue,
            y_sco.ville,
            y_sco.code_post,
            case
                when
                    datefromparts(long.annee, 9, 30)
                    between y_sco.date_effect and y_sco.date_effect_fin
                then 1
                else 0
            end as adresse_30sept,
            row_number() over (
                partition by long.fiche, long.annee order by y_sco.date_effect desc
            ) as seqid
        from long
        left join
            y_sco
            on y_sco.fiche = long.fiche
            and long.annee between y_sco.annee_sco_deb and y_sco.annee_sco_fin
    )

select
    t1.fiche,
    t1.annee,
    t1.no_civ as last_no_civ,
    t1.orient_rue as last_orient_rue,
    t1.genre_rue as last_genre_rue,
    t1.rue as last_rue,
    t1.ville as last_ville,
    t1.code_post as last_code_post,
    t2.no_civ as no_civ_30sept,
    t2.orient_rue as orient_rue_30sept,
    t2.genre_rue as genre_rue_30sept,
    t2.rue as rue_30sept,
    t2.ville as ville__30sept,
    t2.code_post as code_post_30sept
from last_cp as t1
left join
    (select * from last_cp where adresse_30sept = 1) as t2  -- adresse enregistré le 30 septembre
    on t2.fiche = t1.fiche
    and t2.annee = t1.annee
where t1.seqid = 1  -- adresse courante par annee
