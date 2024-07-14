select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select stock_depletion_ratio
from "postgres"."public"."underselling_product_specs"
where stock_depletion_ratio is null



      
    ) dbt_internal_test