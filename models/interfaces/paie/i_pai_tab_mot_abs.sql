select
    mot_abs as motif,
    descr,
    row_number() over (partition by mot_abs order by mot_abs) as row_num
from {{ var("database_paie") }}.dbo.pai_tab_mot_abs
