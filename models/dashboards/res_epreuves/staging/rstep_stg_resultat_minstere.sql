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
            moyen_nmc as moyenne_epreuve,
            pct_reust_nmc as taux_reussite_epreuve,
            moyen_rf as moyenne_final,
            pct_reust_rf as taux_reussite_final
        from {{ ref("FichierConsolide") }} res
        inner join
            {{ ref("liste_matiere_epr_unique") }} as dim
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
    annee,
    mois_resultat,
    code_matiere,
    description_matiere,
    ecole,
    nb_eleve,
    moyenne_epreuve,
    taux_reussite_epreuve,
    moyenne_final,
    taux_reussite_final
from row_number
where seqid = 1
