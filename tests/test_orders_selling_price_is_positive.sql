WITH orders AS (

    SELECT * FROM{{ ref('global_data_mart_orders') }}

) 

SELECT

    OrderID,
    sum(OrderSellingPrice)

FROM orders
GROUP BY OrderID 
HAVING orders<0




