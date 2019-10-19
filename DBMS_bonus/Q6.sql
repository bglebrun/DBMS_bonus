USE s7131322
GO

Create view dbo.Q6
as

SELECT ProductID
FROM AdventureWorks2014.Production.Product
WHERE ProductID NOT IN(
	SELECT ProductID
	FROM AdventureWorks2014.Production.ProductDocument
)