select payload.matr, payload.date_eff, payload.ref_empl
from (select matr, date_eff, ref_empl from openquery([192.168 .207 .153], '
		SELECT 
			matr,
			data_inserted.value(''(/root/row/@DATE_EFF)[1]'', ''datetime'') AS date_eff,
			data_inserted.value(''(/root/row/@REF_EMPL)[1]'', ''NVARCHAR(1)'') AS ref_empl
		FROM paie.hcha.HCHA_PAI_DOS_EMPL
		WHERE data_inserted.value(''(/root/row/@IND_EMPL_PRINC)[1]'', ''NVARCHAR(1)'') = 1
		')) as payload
