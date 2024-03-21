select matr, date as date_abs, mot_abs, lieu_trav, corp_empl
from {{ var("database_paie") }}.dbo. [pai_habs]
