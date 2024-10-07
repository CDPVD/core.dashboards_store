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
    
    This table unionize the always-present DEFAULT table and maybe-present CUSTOM table.
    The default table is defined in the core repo while the custom table, as all the CSS''s specifics table is created in the repo css.

    The code check for the custom table existence and adds it to the default table
    For the CUSTOM table to be detected, the table must be :
        * named ''
        * located in the schema ''
#}
{{ config(alias="dim_date") }}

let
    // Définir la plage de dates
    StartDate = #date(2010, 1, 1),   // Date de début
    EndDate = #date(2027, 12, 31),   // Date de fin
   
    // Générer une liste de dates de la date de début à la date de fin
    DateList = List.Dates(StartDate, Duration.Days(EndDate - StartDate) + 1, #duration(1, 0, 0, 0)),
   
    // Convertir la liste en table
    DateTable = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}, null, ExtraValues.Error),
   
    // Ajouter des colonnes supplémentaires pour les différentes composantes de la date
    AddYear = Table.AddColumn(DateTable, "Année", each Date.Year([Date]), Int32.Type),
    AddMonth = Table.AddColumn(AddYear, "Mois", each Date.Month([Date]), Int32.Type),
    AddDay = Table.AddColumn(AddMonth, "Jour", each Date.Day([Date]), Int32.Type),
    AddDayOfWeek = Table.AddColumn(AddDay, "Jour de la semaine (numérique)", each Date.DayOfWeek([Date]) + 1, Int32.Type),
    AddDayName = Table.AddColumn(AddDayOfWeek, "Nom du jour", each Date.ToText([Date], "dddd"), type text),
    AddMonthName = Table.AddColumn(AddDayName, "Nom du mois", each Date.ToText([Date], "MMMM"), type text),
    AddQuarter = Table.AddColumn(AddMonthName, "Trimestre", each Date.QuarterOfYear([Date]), Int32.Type),
    AddWeekOfYear = Table.AddColumn(AddQuarter, "Semaine de l'année", each Date.WeekOfYear([Date]), Int32.Type),
    AddIsWeekend = Table.AddColumn(AddWeekOfYear, "Est un weekend", each if Date.DayOfWeek([Date]) = 0 or Date.DayOfWeek([Date]) = 6 then true else false, type logical),
    #"Type modifié" = Table.TransformColumnTypes(AddIsWeekend,{{"Date", type date}})
   
in
    #"Type modifié"