{{
    config(
        materialized='table'
    )
}}


SELECT  C.CustomerName,
        C.Country,
        C.State,
        C.CustomerID,
       sum( C.Profit) as order_profit
FROM {{ ref('global_mart_staging_orders') }} C
group by C.CustomerName,
        C.Country,
        C.State,
        C.CustomerID ,
         CustomerName
ORDER BY CustomerName



