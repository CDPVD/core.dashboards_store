select matr, date_cheq, gr_paie from {{ var("database_paie") }}.dbo.pai_hchq
