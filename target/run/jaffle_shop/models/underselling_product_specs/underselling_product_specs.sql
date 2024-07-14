
  create view "postgres"."public"."underselling_product_specs__dbt_tmp" as (
    select distinct rup.name, rucm.color_value, ruv.actual_size, ruv.weave_cat, ruv.size_grp, ruv.shape, (ruv.stock_level - ruv.depletion_level) as stock_depletion_ratio
from "postgres"."public"."rugs_usa_variant" ruv
join "postgres"."public"."rugs_usa_color_map" rucm on rucm.color_id = ruv.pid 
join "postgres"."public"."rugs_usa_parent" rup on rup.pid = ruv.pid 
where stock_level > coalesce(depletion_level, 0) and depletion_level <> 0 
and stock_level is not null and stock_level <> 0 and new_arrival = 'N' and status = 'In_stock'
order by stock_depletion_ratio desc limit 10
  );