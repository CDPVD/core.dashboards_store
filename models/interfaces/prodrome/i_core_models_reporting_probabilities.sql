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
select src.fiche, src.model, src.target, src.risk_level_french
from {{ var("database_prodrome") }}.reporting.core_models_reporting_probabilities as src
join
    {{ ref("predictive_models_to_include") }} as trg  -- Student level output of non-valid models schould never be queried
    on src.model = trg.model
    and src.target = trg.target
