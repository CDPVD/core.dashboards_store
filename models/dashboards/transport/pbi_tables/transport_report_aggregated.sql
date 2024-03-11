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
{{ config(alias="report_aggregated") }}

{# Extract the non-simulated students for the last 10 years #}
with
    ele as (
        select
            fiche,
            annee,
            max(case when bloc = 1 then 1 else null end) as bloc_1,
            max(case when bloc = 2 then 1 else null end) as bloc_2,
            max(
                case
                    when per = 1
                    then (case when ordre = 1 then 1 else null end)
                    else null
                end
            ) as ele_am,  -- where ordre 1 - AM1, ordre 2 - AM2  
            max(
                case
                    when per = 8
                    then (case when ordre = 1 then 1 else null end)
                    else null
                end
            ) as ele_pm,  -- where ordre 1 - AM1, ordre 2 - AM2  
            max(idparc) as id_parc
        from {{ ref("i_geo_e_trnsp_parc") }}
        where simul = 0 and ordre = 1 and annee >= year(getdate()) - 10
        group by fiche, annee

    ),
    coal as (
        {# Added the sectours abbriviation depends of parcours numbers  #}
        select e.annee, e.fiche, e.bloc_1, e.bloc_2, e.ele_am, e.ele_pm, d.abbr_sector
        from ele as e
        inner join
            {{ ref("transport_report_details") }} as d on e.id_parc = d.id_parc_inter
        group by e.annee, e.fiche, e.bloc_1, e.bloc_2, e.ele_am, e.ele_pm, d.abbr_sector
    ),
    st as (
        {# calculation of the number of students with one address and 2 addrs #}
        select
            annee,
            abbr_sector,
            count(fiche) as eleves,
            sum(case when bloc_1 = 1 and bloc_2 is null then 1 else 0 end) + sum(
                case when bloc_1 is null and bloc_2 = 1 then 1 else 0 end
            ) as ele_seule_addr,  -- students have booked 1 place in either block1 or block2
            sum(case when bloc_1 = 1 and bloc_2 = 1 then 1 else 0 end) as ele_deux_addr,  -- students booked 2 places, 1 in block1 + 1 in block2 
            count(ele_am) as ele_am,
            count(ele_pm) as ele_pm
        from coal
        group by annee, abbr_sector
    ),
    crc as (
        {# calculation of the number of parcours, circuits depends of sectors #}
        select
            annee,
            abbr_sector,
            name_sector,
            count(distinct circuit_id) as circuit,
            count(distinct parcours_id) as parcours
        from {{ ref("transport_report_details") }} as dd
        group by annee, abbr_sector, name_sector
    ),
    pam as (
        {# number of parcours AM  depends of sectors #}
        select annee, abbr_sector, count(distinct parcours_id) as parc_am
        from {{ ref("transport_report_details") }}
        where parcours_periode = 'AM'
        group by annee, abbr_sector
    ),
    ppm as (
        {# number of parcours PM  depends of sectors #}
        select annee, abbr_sector, count(distinct parcours_id) as parc_pm
        from {{ ref("transport_report_details") }}
        where parcours_periode = 'PM'
        group by annee, abbr_sector
    )
select
    st.annee,
    st.abbr_sector,
    crc.name_sector,
    st.eleves,
    st.ele_seule_addr,
    st.ele_deux_addr,
    st.ele_am,
    st.ele_pm,
    crc.circuit,
    crc.parcours,
    pam.parc_am,
    ppm.parc_pm
from st
join crc on st.annee = crc.annee and st.abbr_sector = crc.abbr_sector
join ppm on st.annee = ppm.annee and st.abbr_sector = ppm.abbr_sector
join pam on st.annee = pam.annee and st.abbr_sector = pam.abbr_sector
