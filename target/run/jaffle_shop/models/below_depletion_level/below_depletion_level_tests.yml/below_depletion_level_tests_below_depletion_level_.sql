select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    WITH test_data AS (
        SELECT count(*) as errors
        FROM "postgres"."public"."below_depletion_level"
        WHERE stock_level > depletion_level
    )
    SELECT 
        errors
    FROM test_data
    WHERE errors > 0

      
    ) dbt_internal_test