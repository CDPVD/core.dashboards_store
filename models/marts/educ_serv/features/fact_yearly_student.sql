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
    step1 as (
        select
            spi.code_perm,
            spi.id_eco,
            spi.annee,
            spi.fiche,
            spi.population,
            spi.eco,
            dan.grp_rep,
            dan.dist,
            mapper_school.school_friendly_name as nom_ecole,
            dan.ordre_ens,
            dan.classe,
            dan.class,
            dan.plan_interv_ehdaa,
            dan.cycle_ref,
            dan.annee_cycle_ref,
            dan.difficulte,
            dan.age_30_sept,
            dan.type_parcours,
            dan.categ_prog_part as categorie_programme_particulier,
            dan.type_prog_part as type_programme_particulier,
            mes.type_mesure,
            mes.is_francisation,
            des_mes.cf_descr_abreg as description_type_mesure
        from {{ ref("spine") }} as spi
        inner join
            {{ ref("i_gpm_e_dan") }} as dan  -- Niv scolaire
            on spi.fiche = dan.fiche
            and spi.id_eco = dan.id_eco
        inner join
            {{ ref("dim_mapper_schools") }} as mapper_school
            on spi.id_eco = mapper_school.id_eco
        left join
            {{ ref("stg_type_mesure") }} as mes
            on spi.fiche = mes.fiche
            and spi.id_eco = mes.id_eco
        left join
            {{ ref("i_wl_descr") }} as des_mes
            on des_mes.code = mes.type_mesure
            and nom_table = 'type_mesure'
        where seqid = 1 and spi.annee >= {{ store.get_current_year() }} - 10  -- On garde un max de 10 ans dans nos données d'étudiants / Limite par défaut
    )
select
    code_perm,
    id_eco,
    annee,
    fiche,
    population,
    eco,
    grp_rep,
    dist,
    nom_ecole,
    ordre_ens,
    classe,
    class,
    cycle_ref,
    annee_cycle_ref,
    case
        when plan_interv_ehdaa is null
        then 'Sans'
        when plan_interv_ehdaa = '1'
        then 'Avec'
        else plan_interv_ehdaa
    end as plan_interv_ehdaa,
    case
        when
            ordre_ens = '3'
            and (cycle_ref = '1' and (annee_cycle_ref = '1' or annee_cycle_ref = '7'))
        then 'Prim 1'
        when
            ordre_ens = '3'
            and (cycle_ref = '1' and (annee_cycle_ref = '2' or annee_cycle_ref = '8'))
        then 'Prim 2'
        when
            ordre_ens = '3'
            and (cycle_ref = '2' and (annee_cycle_ref = '1' or annee_cycle_ref = '7'))
        then 'Prim 3'
        when
            ordre_ens = '3'
            and (cycle_ref = '2' and (annee_cycle_ref = '2' or annee_cycle_ref = '8'))
        then 'Prim 4'
        when
            ordre_ens = '3'
            and (cycle_ref = '3' and (annee_cycle_ref = '1' or annee_cycle_ref = '7'))
        then 'Prim 5'
        when
            ordre_ens = '3'
            and (cycle_ref = '3' and (annee_cycle_ref = '2' or annee_cycle_ref = '8'))
        then 'Prim 6'
        when ordre_ens = '1'
        then 'Mat 4'
        when ordre_ens = '2'
        then 'Mat 5'
        when
            ordre_ens = '4'
            and (cycle_ref = '1' and (annee_cycle_ref = '1' or annee_cycle_ref = '7'))
        then 'Sec 1'
        when
            ordre_ens = '4'
            and (cycle_ref = '1' and (annee_cycle_ref = '2' or annee_cycle_ref = '8'))
        then 'Sec 2'
        when
            ordre_ens = '4'
            and (
                (cycle_ref = '2' and (annee_cycle_ref = '1' or annee_cycle_ref = '7'))
                or classe = '3'
            )
        then 'Sec 3'
        when
            ordre_ens = '4'
            and (
                (cycle_ref = '2' and (annee_cycle_ref = '2' or annee_cycle_ref = '8'))
                or classe = '4'
            )
        then 'Sec 4'
        when
            ordre_ens = '4'
            and (
                (cycle_ref = '2' and (annee_cycle_ref = '3' or annee_cycle_ref = '9'))
                or classe in ('5', '7', '8')
            )
        then 'Sec 5'
        else '-'
    end as niveau_scolaire,
    difficulte,
    case
        when ordre_ens = '3' and cycle_ref = 1 and annee_cycle_ref = 1 and classe = 'A'
        then 0
        when ordre_ens = '3' and cycle_ref = 1 and annee_cycle_ref = 7 and classe = 'A'
        then 1
        when ordre_ens = '3' and cycle_ref = 1 and annee_cycle_ref = 2 and classe = 'B'
        then 0
        when
            ordre_ens = '3'
            and cycle_ref = 1
            and annee_cycle_ref = 8
            and (classe = 'B' or classe = 'C')
        then 1
        when ordre_ens = '3' and cycle_ref = 2 and annee_cycle_ref = 1 and classe = 'D'
        then 0
        when ordre_ens = '3' and cycle_ref = 2 and annee_cycle_ref = 7 and classe = 'D'
        then 1
        when ordre_ens = '3' and cycle_ref = 2 and annee_cycle_ref = 2 and classe = 'E'
        then 0
        when
            ordre_ens = '3'
            and cycle_ref = 2
            and annee_cycle_ref = 8
            and (classe = 'E' or classe = 'F')
        then 1
        when ordre_ens = '3' and cycle_ref = 3 and annee_cycle_ref = 1 and classe = 'G'
        then 0
        when ordre_ens = '3' and cycle_ref = 3 and annee_cycle_ref = 7 and classe = 'G'
        then 1
        when ordre_ens = '3' and cycle_ref = 3 and annee_cycle_ref = 2 and classe = 'H'
        then 0
        when
            ordre_ens = '3'
            and cycle_ref = 3
            and annee_cycle_ref = 8
            and (classe = 'H' or classe = 'I')
        then 1
        when
            ordre_ens = '4'
            and population like '%régulier%'
            and lag(classe) over (partition by fiche order by annee) = classe
        then 1
        when
            ordre_ens = '2'
            and lag(ordre_ens) over (partition by fiche order by annee) = ordre_ens
        then 1
        else 0
    end as is_doubleur,
    age_30_sept,
    type_parcours,
    type_programme_particulier,
    categorie_programme_particulier,
    case when categorie_programme_particulier is not null then 1 else 0 end as is_ppp,
    type_mesure,
    case when is_francisation = 1 then 1 else 0 end as is_francisation,
    description_type_mesure
from step1
