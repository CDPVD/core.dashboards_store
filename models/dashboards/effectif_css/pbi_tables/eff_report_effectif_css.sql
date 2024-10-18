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
{{ config(alias="report_effectif_css") }}


select
    annee,
    concat(eco, ' - ', nom_eco) as code_ecole,
    ordre_ens,
    cod_niveau_scolaire,
    case when plan_interv_ehdaa = 1 then 'Oui' else 'Non' end as plan_interv_ehdaa,
    difficulte,
    case
        when population = 'prescolaire'
        then 'Prescolaire'
        when population = 'primaire_reg'
        then 'Primaire régulier'
        when population = 'primaire_adapt'
        then 'Primaire adapté'
        when population = 'secondaire_reg'
        then 'Secondaire régulier'
        when population = 'secondaire_adapt'
        then 'Secondaire adapté'
        else population
    end as population,
    sexe,
    dist,
    grp_rep,
    count(code_perm) as total_ele
from {{ ref("eff_fact_effectif_css") }}
group by
    annee,
    eco,
    sexe,
    nom_eco,
    ordre_ens,
    population,
    cod_niveau_scolaire,
    dist,
    grp_rep,
    plan_interv_ehdaa,
    difficulte
