{{
    config(
        materialized='table'
    )
}}

SELECT  P.Category,
        P.ProductID,
        P.ProductName,
        P.SubCategory,
        sum(Profit) as order_profit 
From {{ ref('global_mart_staging_orders') }} P
group by P.Category,
        P.ProductID,
        P.ProductName,
        P.SubCategory
Order by Category DESc