{{
    config(
        materialized='table'
    )
}}

SELECT 
        O.OrderID,
        O.OrderDate,
        O.ShipDate,
        O.ShipMode,
        (O.OrderSellingPrice - O.OrderCostPrice) as Profit ,
        O.OrderSellingPrice,
        O.OrderCostPrice,
--Joining orders and customers
        C.CustomerName,
        C.Country,
        C.State,
        C.CustomerID,
-- Joining with product table
        P.Category,
        P.ProductID,
        P.ProductName,
        P.SubCategory
From {{ ref('global_data_mart_orders') }} as O
LEFT JOIN {{ ref('global_data_mart_customers') }} as C
ON O.CustomerID = C.CustomerID 
LEFT JOIN {{ ref('global_data_mart_product') }} as P 
ON O.ProductID=P.ProductID
