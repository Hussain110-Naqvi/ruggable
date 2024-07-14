
  create view "postgres"."public"."priority_order__dbt_tmp" as (
    select distinct rup.name as product_name, ruv.variant as variant, ruv.actual_size, ruv.weave_cat, (msrp - price) as profit 
from "postgres"."public"."rugs_usa_variant" ruv 
join "postgres"."public"."rugs_usa_parent" rup on rup.pid = ruv.pid 
join "postgres"."public"."below_depletion_level" bdl on bdl.name = rup.name and bdl.variant = ruv.variant
order by profit desc
  );