select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select stock_level
from "postgres"."public"."underselling_product_specs"
where stock_level is null



      
    ) dbt_internal_test