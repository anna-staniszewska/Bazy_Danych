-- 1. Wykorzystuj�c wyra�enie CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki pracownika oraz jego danych, 
--    a nast�pnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwi�� w oparciu o AdventureWorks.
WITH TempEmployeeInfo  
AS
(
	SELECT pay.Rate, prs.BusinessEntityID, prs.FirstName, prs.LastName FROM Person.Person prs 
	INNER JOIN HumanResources.EmployeePayHistory pay ON prs.BusinessEntityID = pay.BusinessEntityID
)
SELECT * FROM TempEmployeeInfo
ORDER BY BusinessEntityID;

-- 2. Uzyskaj informacje na temat przychod�w ze sprzeda�y wed�ug firmy i kontaktu (za pomoc� CTE i bazy AdventureWorksL).
WITH TempRevenueInfo  
AS
(
	SELECT CONCAT(c.CompanyName, ' (', c.FirstName, ' ', c.LastName, ') ') AS CompanyContact, s.TotalDue AS Revenue
	FROM SalesLT.Customer c
	INNER JOIN SalesLT.SalesOrderHeader s ON s.CustomerID = c.CustomerID
)
SELECT * FROM TempRevenueInfo
ORDER BY CompanyContact;

-- 3. Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w. Wykorzystaj CTE i baz� AdventureWorksLT.
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