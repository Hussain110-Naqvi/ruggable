{% snapshot low_stock_indicator %}

{{
    config(
        target_schema='public',
        unique_key='name_variant_color_weave_size_shape_weight',
        strategy='check',
        check_cols=['low_stock']
    )
}}

SELECT DISTINCT 
    rup.name,
    ruv.variant,
    rucm.color_value,
    ruv.weave_cat,
    ruv.size_grp,
    ruv.shape,
    ruv.weight,
    ruv.low_stock,
    CONCAT(rup.name, '_', ruv.variant, '_', rucm.color_value, '_', ruv.weave_cat, '_', ruv.size_grp, '_', ruv.shape, '_', ruv.weight) AS name_variant_color_weave_size_shape_weight,  
    NOW() AS updated_at
FROM 
    {{ ref('rugs_usa_variant') }} ruv
JOIN 
    {{ ref('rugs_usa_parent') }} rup ON rup.pid = ruv.pid
JOIN 
    {{ ref('rugs_usa_color_map') }} rucm ON rucm.color_id = ruv.pid

{% endsnapshot %}