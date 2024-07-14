
    WITH test_data AS (
        SELECT count(*) as errors
        FROM "postgres"."public"."rugs_usa_variant" ruv
        JOIN "postgres"."public"."rugs_usa_pads_upsell" rupu ON rupu.p_id = ruv.pid AND rupu.variant = ruv.variant 
        JOIN "postgres"."public"."rugs_usa_parent" rup ON rup.pid = ruv.pid
        /* joining on model as none of these should show. doing an inner join for this purpose to test */
        JOIN "postgres"."public"."hot_upsell" model on model.name = rup.name and model.variant = ruv.variant and model.size = rupu.size and model.shape = rupu.shape and model.type = rupu.type
        where new_arrival <> 'Y' and stock_level >= coalesce(depletion_level, 0) and rupu.stock is null
    )
    SELECT 
        errors
    FROM test_data
    where errors > 0
