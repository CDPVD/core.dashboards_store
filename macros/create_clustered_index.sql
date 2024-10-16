{% macro create_clustered_index(index_name, column_list) %}
    -- Supprimer l'index s'il existe
    if not exists (
        select *
        from sys.indexes
        where name = '{{ index_name }}' and object_id = object_id('{{ this }}')
    )
    begin
    -- Créer un nouvel index
    CREATE CLUSTERED INDEX {{ index_name }} 
    ON {{ this }} ({{ column_list }});
    end

{% endmacro %}
