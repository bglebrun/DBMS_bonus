USE s7131322
GO

Create view dbo.Q0
as
Select [Name], AVG(Rating) AS AvgRating
FROM AdventureWorks2014.Production.Product P JOIN AdventureWorks2014.Production.ProductReview R ON
P.ProductID=R.ProductID
WHERE Listprice > 1000
GROUP BY R.ProductID, [Name]