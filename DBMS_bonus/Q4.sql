--USE s7131322
--GO

--Create view dbo.Q4
--as
SELECT TOP 5 C.[Name] 
FROM AdventureWorks2014.Production.ProductCategory C INNER JOIN AdventureWorks2014.Production.ProductSubcategory S ON 
C.ProductCategoryID=S.ProductCategoryID
WHERE S.ProductCategoryID IN (
SELECT ProductCategoryID, COUNT(ProductCategoryID) as cnt
FROM AdventureWorks2014.Production.ProductSubcategory U JOIN AdventureWorks2014.Production.Product P ON
U.ProductSubcategoryID=P.ProductSubcategoryID
WHERE P.ListPrice < 100)

