USE s7131322
GO

CREATE view dbo.Q10
as

SELECT M.ProductModelID FROM
AdventureWorks2014.Production.ProductModel M JOIN AdventureWorks2014.Production.ProductModelProductDescriptionCulture D
ON m.ProductModelID=d.ProductModelID
GROUP BY m.ProductModelID
HAVING COUNT(CultureID) = (
	SELECT COUNT (DISTINCT CultureID) FROM AdventureWorks2014.Production.ProductModelProductDescriptionCulture
	)