SELECT
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.EmployeeId,
    O.StoreId,
    O.StatusCD,
    O.StatusDesc,
    COUNT(DISTINCT O.OrderID) AS OrderCount,
    SUM(OI.TotalPrice) AS Revenue,
    O.Updated_at
FROM 
    {{ ref('orders_stg')}} AS O
JOIN 
    {{ ref('orderitems_stg')}} AS OI
ON O.OrderID = OI.OrderID
GROUP BY 1,2,3,4,5,6,7, 10