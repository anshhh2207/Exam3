use dd1;

select * from [dbo].[MT3]  ;

select * from [dbo].[MT3]  where OrderStatus = 'Completed';

select State, COUNT(*) AS CompletedOrders FROM [dbo].[MT3] group by State;

SELECT SUM(Quantity) AS TotalQuantitySold FROM [dbo].[MT3] ;

SELECT SUM(NetSales) as totalns from [dbo].[MT3] ;

select SUM(Profit) as totalprft from [dbo].[MT3];

SELECT AVG(HighValueOrder) AS AverageOrderValue FROM [dbo].[MT3] ;

select State from [dbo].[MT3] where NetSales>1000000; 

SELECT State, SUM(NetSales) AS TotalSales FROM [dbo].[MT3] GROUP BY State ORDER BY TotalSales DESC;

WITH CompletedOrders AS
( SELECT * FROM [dbo].[MT3] WHERE OrderStatus = 'Completed')

SELECT *FROM CompletedOrders;

WITH StateSales AS
(
    SELECT State,SUM(NetSales) AS TotalSales
    FROM [dbo].[MT3] WHERE OrderStatus = 'Completed' GROUP BY State
)
SELECT *FROM StateSales;



WITH CustomerSales AS (
    SELECT
        CustomerID,
        CustomerName,
        SUM(NetSales) AS TotalSales
    FROM [dbo].[MT3]
    WHERE OrderStatus = 'Completed'
    GROUP BY CustomerID, CustomerName
)

SELECT TOP 5
    CustomerID,
    CustomerName,
    TotalSales
FROM CustomerSales
ORDER BY TotalSales DESC;


SELECT
    State,
    SUM(NetSales) AS TotalSales,
    RANK() OVER (ORDER BY SUM(NetSales) DESC) AS SalesRank
FROM [dbo].[MT3]
WHERE OrderStatus = 'Completed'
GROUP BY State
ORDER BY SalesRank;








