{% test below_depletion_level_tests(model) %}
    WITH test_data AS (
        SELECT count(*) as errors
        FROM {{ model }}
        WHERE stock_level > depletion_level
    )
    SELECT 
        errors
    FROM test_data
    WHERE errors > 0
{% endtest %}
