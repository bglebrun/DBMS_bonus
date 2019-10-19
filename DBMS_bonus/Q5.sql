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