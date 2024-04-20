-- 1. Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki pracownika oraz jego danych, 
--    a nastêpnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks.
WITH TempEmployeeInfo  
AS
(
	SELECT pay.Rate, prs.BusinessEntityID, prs.FirstName, prs.LastName FROM Person.Person prs 
	INNER JOIN HumanResources.EmployeePayHistory pay ON prs.BusinessEntityID = pay.BusinessEntityID
)
SELECT * FROM TempEmployeeInfo
ORDER BY BusinessEntityID;

-- 2. Uzyskaj informacje na temat przychodów ze sprzeda¿y wed³ug firmy i kontaktu (za pomoc¹ CTE i bazy AdventureWorksL).
WITH TempRevenueInfo  
AS
(
	SELECT CONCAT(c.CompanyName, ' (', c.FirstName, ' ', c.LastName, ') ') AS CompanyContact, s.TotalDue AS Revenue
	FROM SalesLT.Customer c
	INNER JOIN SalesLT.SalesOrderHeader s ON s.CustomerID = c.CustomerID
)
SELECT * FROM TempRevenueInfo
ORDER BY CompanyContact;

-- 3. Napisz zapytanie, które zwróci wartoœæ sprzeda¿y dla poszczególnych kategorii produktów. Wykorzystaj CTE i bazê AdventureWorksLT.
WITH TempProductSalesInfo  
AS
(
	SELECT pc.Name, CAST(SUM(s.LineTotal) AS decimal(10,2))  AS SalesValue
	FROM SalesLT.Product p
	INNER JOIN SalesLT.SalesOrderDetail s ON p.ProductID = s.ProductID
	INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
	GROUP BY pc.Name
)
SELECT * FROM TempProductSalesInfo;