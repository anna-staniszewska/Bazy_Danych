-- zad1
CREATE FUNCTION dbo.fibofunction (@n INT)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;
	DECLARE @first INT = 0;
	DECLARE @second INT = 1;

	IF @n=0 
		SET @result = @first;

	ELSE IF @n=1
		SET @result = @second;

	ELSE IF @n>=2
		SET @result = dbo.fibofunction(@n-1) + dbo.fibofunction(@n-2);

	RETURN @result 
END;
GO

CREATE PROCEDURE dbo.fiboprint @n INT
AS
BEGIN
	DECLARE @fibovalue INT
	DECLARE @i INT = 0
	WHILE @i < @n
	BEGIN
		SET @fibovalue = dbo.fibofunction(@i)
		PRINT @fibovalue
		SET @i = @i + 1
	END;
END;

EXEC dbo.fiboprint 6;

-- zad2
GO
CREATE TRIGGER lastnameT ON Person.Person
AFTER INSERT
AS
BEGIN
	UPDATE Person.Person SET LastName = UPPER(LastName)
	WHERE BusinessEntityID = (SELECT MAX(BusinessEntityID) FROM Person.Person);
END
GO

INSERT INTO Person.BusinessEntity(rowguid) VALUES (NEWID());
SELECT * FROM Person.BusinessEntity;
INSERT INTO Person.Person(BusinessEntityID, FirstName, MiddleName, LastName, PersonType)
VALUES (20778, 'fgdr', 'dfghh', 'fdhhf', 'IN');

SELECT * FROM Person.Person;

-- zad3
GO
CREATE TRIGGER taxRateMonitoring ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
	DECLARE @old DECIMAL(10,2);
    DECLARE @new DECIMAL(10,2);
    SELECT @old = TaxRate FROM deleted;
    SELECT @new = TaxRate FROM inserted;

    IF ABS(@new - @old)/@old > 0.3
    BEGIN
        RAISERROR('Zmiana wartoœci w polu TaxRate o wiêcej ni¿ 30 procent jest niedozwolona.', 0, 1);
        ROLLBACK; 
    END
END;
GO

UPDATE Sales.SalesTaxRate SET TaxRate = 0.5 * TaxRate;

SELECT * FROM Sales.SalesTaxRate;