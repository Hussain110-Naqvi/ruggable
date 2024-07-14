
      update "postgres"."public"."availability_clearance_rugs"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "availability_clearance_rugs__dbt_tmp214017055774" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "postgres"."public"."availability_clearance_rugs".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      and "postgres"."public"."availability_clearance_rugs".dbt_valid_to is null;

    insert into "postgres"."public"."availability_clearance_rugs" ("name", "url", "availability", "clearance", "updated_at", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."name",DBT_INTERNAL_SOURCE."url",DBT_INTERNAL_SOURCE."availability",DBT_INTERNAL_SOURCE."clearance",DBT_INTERNAL_SOURCE."updated_at",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "availability_clearance_rugs__dbt_tmp214017055774" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  