Create view HW.Q0
With ENCRYPTION
as
SELECT [Name], AVG(Rating) AS AvgRating
FROM AdventureWorks2014.Production.Product P JOIN AdventureWorks2014.Production.ProductReview R ON
P.ProductIO=R.ProductID
WHERE Listprice > 1000
GROUP BY R.ProductID, [Name]

Create view s7131322.dbo.Q1
as
SELECT [Name]
FROM AdventureWorks2014.Production.Product P JOIN AdventureWorks2014.Production.ProductReview R ON
P.ProductID=R.ProductID
WHERE 