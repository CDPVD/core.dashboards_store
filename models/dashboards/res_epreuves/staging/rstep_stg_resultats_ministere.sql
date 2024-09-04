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
    Aggreagtes and compute the metric per year, schools and evaluation
#}
{{
    config(
        alias="stg_resultat_minstere",
    )
}}

with
    resmin as (
        select
            annee,
            sesn as mois_resultat,
            cd_cours as code_matiere,
            description_matiere,
            case
                -- when REG_ADM is not null and RES_ENS ='PU' and CD_ORGNS_RESP is not
                -- null then 'CSS'
                when reg_adm is not null and res_ens = 'PU' and cd_orgns_resp is null
                then 'Régional'
                when reg_adm is null and res_ens = 'PU' and cd_orgns_resp is null
                then 'Provincial'
                else null
            end as ecole,
            no_group_eleve as groupe,
            eleve_note as nb_eleve,
            moyen_neb as moyenne_ecole_brute,
            pct_reust_neb / 100 as taux_reussite_ecole_brute,
            moyen_nem as moyenne_ecole_modere,
            pct_reust_nem / 100 as taux_reussite_ecole_modere,
            moyen_nmc as moyenne_epreuve,
            pct_reust_nmc / 100 as taux_reussite_epreuve,
            moyen_rf as moyenne_final,
            pct_reust_rf / 100 as taux_reussite_final
        from {{ ref("fichier_consolide_epreuves_ministerielles") }} res
        inner join
            {{ ref("rstep_liste_matiere_epr_unique") }} as dim
            on dim.code_matiere = res.cd_cours
    ),
    row_number as (
        select
            annee,
            mois_resultat,
            code_matiere,
            description_matiere,
            ecole,
            nb_eleve,
            moyenne_ecole_brute,
            taux_reussite_ecole_brute,
            moyenne_ecole_modere,
            taux_reussite_ecole_modere,
            moyenne_epreuve,
            taux_reussite_epreuve,
            moyenne_final,
            taux_reussite_final,
            row_number() over (
                partition by annee, mois_resultat, code_matiere, ecole
                order by nb_eleve desc
            ) as seqid
        from resmin
        where ecole is not null and groupe is null
    )
select
    res.annee,
    annee_scolaire,
    mois_resultat,
    code_matiere,
    description_matiere,
    ecole,
    'Tout' as groupe,
    nb_eleve,
    moyenne_ecole_brute,
    taux_reussite_ecole_brute,
    moyenne_ecole_modere,
    taux_reussite_ecole_modere,
    moyenne_epreuve,
    taux_reussite_epreuve,
    moyenne_final,
    taux_reussite_final,
    moyenne_ecole_modere - moyenne_ecole_brute as moderation,
    moyenne_epreuve - moyenne_ecole_brute as moyenne_ecart_res_epreuve,
    moyenne_final - moyenne_ecole_brute as moyenne_ecart_res_ecole_finale
from row_number res
inner join
    (select distinct annee, annee_scolaire from {{ ref("dim_mapper_schools") }}) sch
    on res.annee - 1 = sch.annee
where seqid = 1
