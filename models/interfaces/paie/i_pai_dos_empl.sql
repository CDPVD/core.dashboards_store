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
select
    matr,
    date_entr,
    lieu_trav,
    stat_eng,  -- - indicator to filter. classification of regular posts to full or part-time employment. where if like S% - service, P% - Professional and E% - teacher
    ind_empl_princ,  -- indicator to filter ' if primary employee indicator is 1 then true'
    ref_empl,
    corp_empl,  -- indicator to filter -engagement status. abbreviations do not match between CSS, so it is suggested to use the description descr AS 'etat_description'
    etat,
    date_dern_jr_trav,
    date_eff,
    mode_cour,
    type,
    gr_paie,
    pourc_sal_cour,
    pourc_sal_prec
from {{ var("database_paie") }}.dbo.pai_dos_empl
