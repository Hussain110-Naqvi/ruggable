{% snapshot availability_clearance_rugs %}

{{
    config(
        target_schema='public',
        unique_key='url',
        strategy='check',
        check_cols=['availability', 'clearance']
    )
}}

SELECT 
    name,
    url,
    availability,
    clearance,
    NOW() AS updated_at
FROM 
    {{ ref('rugs_usa_parent') }}

{% endsnapshot %}