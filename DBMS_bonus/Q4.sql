USE s7131322
GO

Create view dbo.Q4
as
SELECT TOP 1 [Name] from AdventureWorks2014.Production.ProductCategory C
INNER JOIN (
	SELECT S.ProductCategoryID, count(S.ProductCategoryID) as cnt 
	FROM AdventureWorks2014.Production.ProductSubcategory S
	JOIN AdventureWorks2014.Production.Product P ON S.ProductSubcategoryID=P.ProductSubcategoryID
	WHERE P.ListPrice < 100
	GROUP BY S.ProductCategoryID
	)
G ON G.ProductCategoryID=C.ProductCategoryID
ORDER BY cnt DESC