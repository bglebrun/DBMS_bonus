USE s7131322
GO

Create view dbo.Q2
AS

SELECT [Name], (([ListPrice]-[StandardCost])/[StandardCost] ) as ProfitRatio
FROM  AdventureWorks2014.Production.Product
WHERE [SellEndDate] IS NULL AND [StandardCost] > 0