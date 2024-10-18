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
    Extract the grades from the e_ri_resultats and adapt them to fit with local exam table  .
#}
{{ config(alias="fact_evaluations_minist_sec4_sec5", schema="res_epreuves_staging") }}

-- Keep the last upserted value
with
    resmin as (
        select
            fiche,
            ecole,
            matiere as code_matiere,
            annee,
            res_off_conv as resultat,
            res_off_conv as resultat_numerique,
            groupe,
            date_resultat,
            case when res_off_conv > 59 then 'R' else 'E' end as code_reussite,
            row_number() over (
                partition by fiche, ecole, matiere, groupe, date_resultat
                order by date_heure_recup desc
            ) as seq_id
        from {{ ref("i_e_ri_resultats") }} as resmin
        where
            mois_resultat = '6'
            and annee not in ('2019', '2020')
            and type_form_charl = 'FG'
            and secteur_enseign_freq = 'JE'
            and ecole like ('{{ var("res_epreuves")["cod_css"] }}')
            and res_off_conv != ''
    )
select
    fiche,
    ecole,
    code_matiere,
    annee,
    resultat,
    resultat_numerique,
    code_reussite,
    -- Tests hooks
    groupe,
    date_resultat
from resmin
where seq_id = 1
