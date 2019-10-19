USE s7131322
GO

Create view dbo.Q1
as
SELECT TOP 1 [Name] from AdventureWorks2014.Production.Product P
INNER JOIN (SELECT ProductID, count(ProductID) as cnt FROM AdventureWorks2014.Production.ProductReview
	GROUP BY ProductID) R ON P.ProductID=R.ProductID
	ORDER BY cnt DESC