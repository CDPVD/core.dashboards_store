{#
    Calculates the number of weekdays between two dates
#}
{% macro weekdays_between(start_date, end_date) %}

    datediff(day, {{ start_date }}, {{ end_date }})
    - datediff(week, {{ start_date }}, dateadd(day, 1, {{ end_date }}))
    - datediff(week, {{ start_date }}, {{ end_date }})

{% endmacro %}
