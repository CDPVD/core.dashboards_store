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
            y_stud.code_perm,
            y_stud.fiche,
            y_stud.population,
            y_stud.plan_interv_ehdaa,
            ele.genre,
            y_stud.age_30_sept,
            y_stud.is_francisation,
            y_stud.is_ppp,
            y_stud.grp_rep,
            y_stud.dist,
            y_stud.class,
            y_stud.annee,
            y_stud.id_eco,
            y_stud.eco
        from {{ ref("fact_yearly_student") }} as y_stud
        inner join {{ ref("dim_eleve") }} as ele on y_stud.fiche = ele.fiche
        where
            y_stud.ordre_ens = '4'  -- Secondaire
            and y_stud.niveau_scolaire = 'Sec 5'  -- L'élève est en sec 5
            and y_stud.annee < {{ get_current_year() }} + 1  -- Enlève l'année prévisionnelle de GPI
    )

select *
from src
