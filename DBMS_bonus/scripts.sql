-- Q1
USE s7131322
GO

Create view dbo.Q1
as
SELECT TOP 1 [Name] from AdventureWorks2014.Production.Product P
INNER JOIN (SELECT ProductID, count(ProductID) as cnt FROM AdventureWorks2014.Production.ProductReview
	GROUP BY ProductID) R ON P.ProductID=R.ProductID
	ORDER BY cnt DESC

-- Q2 
USE s7131322
GO

Create view dbo.Q2
AS

SELECT [Name], (([ListPrice]-[StandardCost])/[StandardCost] ) as ProfitRatio
FROM  AdventureWorks2014.Production.Product
WHERE [SellEndDate] IS NULL AND [StandardCost] > 0

-- Q3
USE s7131322
GO

CREATE view dbo.Q3
as

SELECT [Name], MAX(L.ListPrice) as MaxPrice
FROM AdventureWorks2014.Production.Product P FULL OUTER JOIN AdventureWorks2014.Production.ProductListPriceHistory L ON
P.ProductID=L.ProductID
WHERE L.ListPrice IS NOT NULL
GROUP BY P.[Name]

-- Q4
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

-- Q5
USE s7131322
GO

Create view dbo.Q5
as

SELECT TOP 3 P.Name, AVG(R.Rating) as AvgRating
FROM AdventureWorks2014.Production.Product P JOIN AdventureWorks2014.Production.ProductReview R 
ON P.ProductID=R.ProductID
WHERE R.Rating > 2
GROUP BY P.ProductID, P.Name
ORDER BY AVG(R.Rating) DESC

-- Q6
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

-- Q8
USE s7131322
GO

CREATE view dbo.Q8
as

SELECT Name, AVG(Quantity) as AvgQuantity
FROM AdventureWorks2014.Production.Product P JOIN AdventureWorks2014.Production.TransactionHistory T
ON P.ProductID=T.ProductID
GROUP BY Name
HAVING COUNT(T.ProductID) > 2000

-- Q10
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