select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name
from "postgres"."public"."below_depletion_level"
where name is null



      
    ) dbt_internal_test