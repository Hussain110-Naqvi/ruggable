
  create view "postgres"."public"."below_depletion_level__dbt_tmp" as (
    select distinct name, ruv.variant, ruv.actual_size, ruv.weave_cat, ruv.size_grp, ruv.shape, ruv.weight, ruv.stock_level, ruv.depletion_level
from "postgres"."public"."rugs_usa_variant" ruv 
join "postgres"."public"."rugs_usa_parent" rup on rup.pid = ruv.pid
where coalesce(stock_level, 0) < coalesce(depletion_level, 0)
order by ruv.stock_level asc
  );