
      update "postgres"."public"."low_stock_indicator"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "low_stock_indicator__dbt_tmp214017044542" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "postgres"."public"."low_stock_indicator".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      and "postgres"."public"."low_stock_indicator".dbt_valid_to is null;

    insert into "postgres"."public"."low_stock_indicator" ("name", "variant", "color_value", "weave_cat", "size_grp", "shape", "weight", "low_stock", "name_variant_color_weave_size_shape_weight", "updated_at", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."name",DBT_INTERNAL_SOURCE."variant",DBT_INTERNAL_SOURCE."color_value",DBT_INTERNAL_SOURCE."weave_cat",DBT_INTERNAL_SOURCE."size_grp",DBT_INTERNAL_SOURCE."shape",DBT_INTERNAL_SOURCE."weight",DBT_INTERNAL_SOURCE."low_stock",DBT_INTERNAL_SOURCE."name_variant_color_weave_size_shape_weight",DBT_INTERNAL_SOURCE."updated_at",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "low_stock_indicator__dbt_tmp214017044542" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  