
{{
    config(
        materialized='table'
    )
}}
WITH selecting_rows_after_second_row as 
            (SELECT *
                FROM {{ source('globalmart', 'customers') }}
                WHERE string_field_0 !='CustomerID' )

SELECT string_field_0  AS    CustomerID,
        string_field_1 AS   CustomerName,
        string_field_2 AS   Segment,
        string_field_3 AS   Country,
        string_field_4 AS   State 
fROM selecting_rows_after_second_row