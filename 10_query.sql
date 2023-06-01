-- zad1
BEGIN TRANSACTION;
UPDATE Production.Product SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680;
COMMIT;

-- zad2
BEGIN TRANSACTION;
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
DELETE FROM Production.Product
WHERE ProductID = 707;
ROLLBACK;
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';

SELECT * FROM Production.ProductInventory;

--zad3
BEGIN TRANSACTION;
SET IDENTITY_INSERT Production.Product ON;
INSERT INTO Production.Product(ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag,
SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate )
VALUES (1000, 'dsgdftgh', 'GF-3456', 1, 0, 700, 800, 0, 0, 1, '2008-04-30 00:00:00.000');
SET IDENTITY_INSERT Production.Product OFF;
COMMIT;

SELECT * FROM Production.Product;

-- zad4
BEGIN TRANSACTION;
UPDATE Production.Product SET StandardCost = 1.1 * StandardCost;
IF (SELECT SUM(StandardCost) FROM Production.Product) <= 50000
	COMMIT;
ELSE
	ROLLBACK;

-- zad5
BEGIN TRANSACTION;
IF NOT EXISTS (SELECT ProductID FROM Production.Product WHERE ProductID = 1003)
BEGIN
	SET IDENTITY_INSERT Production.Product ON;
	INSERT INTO Production.Product(ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag,
	SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate )
	VALUES (1003, 'reghn', 'UH-gdfh', 1, 0, 700, 800, 0, 0, 1, '2008-04-30 00:00:00.000');
	SET IDENTITY_INSERT Production.Product OFF;
	COMMIT;
END
ELSE
	ROLLBACK;

SELECT * FROM Production.Product;

-- zad6
BEGIN TRANSACTION;
DECLARE @n INT = (SELECT COUNT(OrderQTY) FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
UPDATE Sales.SalesOrderDetail SET OrderQty = 6;
IF @n > 0
	ROLLBACK;
ELSE
	COMMIT;

SELECT * FROM Sales.SalesOrderDetail;

-- zad7
BEGIN TRANSACTION;
DECLARE @m INT = (SELECT COUNT(*) FROM Production.Product
	WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product));
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
DELETE FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);
IF @m > 10
	ROLLBACK;
ELSE
	COMMIT;

EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';

SELECT * FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);