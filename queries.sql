# Roll up: Sales by Country and Quarter
# This query aggregates sales data by country and quarter, providing insights into sales performance across different regions

SELECT C.Country, T.Quarter, SUM(F.SalesAmount) AS TotalSales
FROM SalesFact F
JOIN CustomerDim C ON F.CustomerID = C.CustomerID
JOIN TimeDim T ON F.TimeID = T.TimeID
GROUP BY C.Country, T.Quarter
ORDER BY C.Country, T.Quarter;

# Drill down: Sales details for a specific country
# This query retrieves detailed sales information for a specific country, allowing for deeper analysis of sales performance

SELECT T.Month, SUM(F.SalesAmount) AS MonthlySales
FROM SalesFact F
JOIN CustomerDim C ON F.CustomerID = C.CustomerID
JOIN TimeDim T ON F.TimeID = T.TimeID
WHERE C.Country = 'South Africa'
GROUP BY T.Month
ORDER BY T.Month;

# Slice: Total sales for electronics category
# This query calculates the total sales amount for products in the electronics category, providing insights into this specific product segment

SELECT SUM(F.SalesAmount) AS ElectronicsSales
FROM SalesFact F
JOIN ProductDim P ON F.ProductID = P.ProductID
WHERE P.Category = 'Electronics';
