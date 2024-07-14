
    WITH test_data AS (
        SELECT count(*) as errors
        FROM "postgres"."public"."rugs_usa_variant" ruv
        JOIN "postgres"."public"."rugs_usa_color_map" rucm ON rucm.color_id = ruv.pid 
        JOIN "postgres"."public"."rugs_usa_parent" rup ON rup.pid = ruv.pid 
        /* joining on model as none of these should show. doing an inner join for this purpose to test */
        JOIN "postgres"."public"."underselling_product_specs" model on model.name = rup.name and model.actual_size = ruv.actual_size and model.shape = ruv.shape
        WHERE 
                ruv.stock_level <= COALESCE(ruv.depletion_level, 0) 
                AND ruv.depletion_level = 0 
                AND ruv.stock_level IS NULL 
                or ruv.stock_level = 0
                AND ruv.new_arrival <> 'N' 
                AND ruv.status <> 'In_stock'
            
    )
    SELECT 
        errors
    FROM test_data
    where errors > 0
