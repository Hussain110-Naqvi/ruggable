select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select variant
from "postgres"."public"."hot_upsell"
where variant is null



      
    ) dbt_internal_test