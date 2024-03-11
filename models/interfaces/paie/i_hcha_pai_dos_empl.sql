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
	Parse the XML of the historical hcha_pai_dos_empl to get PIT data.

	A note on XML parsing
	As querying XML columns are not supported by linked servers, I have to relay on the openquery function, providing the table is accessible as from a linked server.
	If not, direct querying of the XML column is possible.

#}
{# Check if the {{ var("database_paie") }} rerfers to a linked server or to a co-located server #}
{% if execute %}
    {% set items = var("database_paie").split(".") %}  {# A database living on a Linked server, either identified by it's full name or an IP adress will at least have one dot  #}
    {% set is_linked_server = items | length > 1 %}
    {{
        log(
            "WARNING : hcha_pai_dos_empl will be materialized from a linked server. This can result in non-pseudo-anonymized data being avalaible to the SQL server you are running the query from, providing you haven't obfuscate the XML's content.",
            info=True,
        )
    }}

    {# Extract the server's name from  #}
    {% if is_linked_server %}
        {% set server_name = var("database_paie").split(".")[0:-1] | join(".") %}
        {% set database_name = var("database_paie").split(".")[-1] %}

        select payload.date_creat, payload.matr, payload.date_eff, payload.ref_empl
        from
            (
                select date_creat, matr, date_eff, ref_empl
                from openquery({{ server_name }}, '
		SELECT 
			date_creat,
			matr,
			data_inserted.value(''(/root/row/@DATE_EFF)[1]'', ''datetime'') AS date_eff,
			data_inserted.value(''(/root/row/@REF_EMPL)[1]'', ''NVARCHAR(1)'') AS ref_empl
		FROM {{ database_name }}.hcha.hcha_pai_dos_empl
		WHERE data_inserted.value(''(/root/row/@IND_EMPL_PRINC)[1]'', ''NVARCHAR(1)'') = 1
		')
            ) as payload

    {% else %}
        select
            date_creat,
            matr,
            data_inserted.value(
                '(/ root / row / @date_eff)[1]', 'datetime'
            ) as date_eff,
            data_inserted.value(
                '(/ root / row / @ref_empl)[1]', 'nvarchar(1)'
            ) as ref_empl
        from {{ var("database_paie") }}.hcha.hcha_pai_dos_empl
        where
            data_inserted.value('(/ root / row / @ind_empl_princ)[1]', 'nvarchar(1)')
            = 1
    {% endif %}

{% endif %}
