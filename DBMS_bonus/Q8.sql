USE s7131322
GO

CREATE view dbo.Q8
as

SELECT Name, AVG(Quantity) as AvgQuantity
FROM AdventureWorks2014.Production.Product P JOIN AdventureWorks2014.Production.TransactionHistory T
ON P.ProductID=T.ProductID
GROUP BY Name
HAVING COUNT(T.ProductID) > 2000