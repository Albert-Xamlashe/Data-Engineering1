{{
    config(
        materialized='table'
    )
}}
SELECT 
        string_field_0 as Category,
        string_field_1 as ProductID,
        string_field_2 as ProductName,
        string_field_3 as SubCategory
FROM {{ source('globalmart', 'product') }}
