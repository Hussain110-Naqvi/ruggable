select distinct rup.name, ruv.variant, rupu.size, rupu.shape, rupu.type, (ruv.msrp - rupu.price) as profit_margin
from "postgres"."public"."rugs_usa_variant" ruv
join "postgres"."public"."rugs_usa_pads_upsell" rupu on rupu.p_id = ruv.pid and rupu.variant = ruv.variant 
join "postgres"."public"."rugs_usa_parent" rup on rup.pid = ruv.pid
where new_arrival = 'Y' and stock_level < coalesce(depletion_level, 0) and rupu.stock is not null
order by profit_margin desc