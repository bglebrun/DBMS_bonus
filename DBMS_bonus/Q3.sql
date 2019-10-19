USE s7131322
GO

CREATE view dbo.Q3
as

SELECT [Name], MAX(L.ListPrice) as MaxPrice
FROM AdventureWorks2014.Production.Product P FULL OUTER JOIN AdventureWorks2014.Production.ProductListPriceHistory L ON
P.ProductID=L.ProductID
WHERE L.ListPrice IS NOT NULL
GROUP BY P.[Name]
