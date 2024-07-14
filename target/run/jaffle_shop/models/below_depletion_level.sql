
  create view "postgres"."public"."below_depletion_level__dbt_tmp" as (
    select distinct name, ruv.variant, ruv.actual_size, ruv.weave_cat, ruv.size_grp, ruv.shape, ruv.weight
from "postgres"."public"."rugs_usa_variant" ruv 
join "postgres"."public"."rugs_usa_parent" rup on rup.pid = ruv.pid
where stock_level < coalesce(depletion_level, 0)
  );