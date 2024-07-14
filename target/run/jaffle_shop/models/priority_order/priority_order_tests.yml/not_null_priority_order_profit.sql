select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select profit
from "postgres"."public"."priority_order"
where profit is null



      
    ) dbt_internal_test