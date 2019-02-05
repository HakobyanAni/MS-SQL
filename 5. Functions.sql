-->>>>>>>>>>>>>>>>>> Scalar functions <<<<<<<<<<<<<<<<<<--


------------   System Functions   ------------
--> @@ERROR
--> @@IDENTITY
--> @@ROWCOUNT
--> NEWID()
--> ISNUMERIC()
--> ISNULL()


------------  @@ERROR  ------------
-- gives us an error message

DECLARE  @variable INT
SET @variable = 'space'
PRINT  @Variable
GO

SELECt @@ERROR
GO  -- if we write GO after every part of code, 
    -- in case of error in any part, the other parts will work

BEGIN TRY
	DECLARE @temp INT
	SET @temp = 1 / 0
END TRY
BEGIN CATCH
	SELECT -- Here we get all information about error, if it occurs
		ERROR_NUMBER() AS [Error Number],
		ERROR_SEVERITY() AS [Error Severity],
		ERROR_STATE() AS [Error State],
		ERROR_PROCEDURE() AS [Error Procedure],
		ERROR_LINE() AS [Error Line],
		ERROR_MESSAGE() AS [Error Message]
END CATCH


------------   @@IDENTITY   ------------
-- returns the last id of rows

USE [MY DATABASE] 
INSERT INTO [Country]
([Country], [Capital], [Continent], [Population], [Water space], [Famous People], [Religion], [Famous place], [Famous food], [Time zone])
VALUES
('Switzerland', 'Bern', 'Europe', '8544034','River Aare', 'Albert Einstein', 'Christianity', 'Munster', 'Fondue', '01:00:00') 
GO
SELECT @@IDENTITY -- id of this row is 2, so the number 2 will print
GO


------------   @@ROWCOUNT   ------------
-- returns the count of rows

UPDATE [Country]
SET [Capital] = 'London'
WHERE [ID] = 2
GO
SELECT @@ROWCOUNT -- as we worked with one row, the row count will be 1 
GO

DELETE [Country]
GO
SELECT @@ROWCOUNT -- as we delete 2 rows, so the row count will be 2 
GO 


------------   NEWID()   ------------
-- gives unique id  
DECLARE @Var uniqueidentifier
SET @Var = NEWID()
PRINT @Var  -- here prints this id: 2627580A-42EB-49C9-86A3-39A61F8ACE8D


------------   ISNUMERIC()   ------------
-- returns 1 if the variable can be casted to number, otherwise returns 0
SELECT
	ISNUMERIC('30'), -- 1
	ISNUMERIC(17),  -- 1
--	ISNUMERIC(@Var), -- 0
	ISNUMERIC('abcd'), -- 0
	ISNUMERIC('#'), -- 0
	ISNUMERIC('+') -- 1


------------   ISNULL()   ------------
-- replaces the first argument by the second argument if the first one is null

SELECT [ID], [Name], ISNULL(Salary, 0.0) AS SALARY
-- Creating an alias of the column Salary(creating new Salary column)
-- and replacing all the cells, that where null, by 0.0 
FROM Employees

DECLARE @int INT, @bigint bigint
SET @int = 3
SELECT 3 + @int + ISNULL(@bigint, 0) -- 3 + 3 + 0
-- so, prints 6



------------   Conversation Functions   ------------


------------   CAST   ------------
------------   CONVERT   ------------

SELECT 20 / 9,  -- 2
	   20. / 9,  -- 2.222222	
	   CAST(20 as DECIMAL)/9,  -- 2.222222
	   CONVERT(DECIMAL, 20)/9  -- 2.222222

SELECT CONVERT (datetime,'20200502 11:11') -- 2020-05-02 11:11:00.000

SELECT
	GETDATE() AS withoutConvert, -- 2019-02-05 23:19:31.987
	CAST(GETDATE() AS nvarchar(30)) AS converted -- Feb  5 2019 11:19PM
GO

------------   TRY_CAST   ------------
------------   TRY_CONVERT   ------------

SELECT
	TRY_CAST('11/30/2020' as date), -- 2020-11-30
	TRY_CONVERT('30/11/2020' as date) -- null
GO




------------   String Functions   ------------

------------   ASCII   ------------
------------   UNICODE   ------------

-- ASCII and UNICODE returns the code of the first symbol
SELECT ASCII('hello world!') [ASCII], -- code of 'h' is 104
	   UNICODE(N'Ola')[UNICODE]  -- code of 'O' is 79
GO

------------   CHAR   ------------
------------   NCHAR   ------------
SELECT CHAR(105)[char], --  105 is 'i'
	   NCHAR(100)[nchar] --  100 is 'd' 
GO

------------   LEFT   ------------
------------   RIGHT   ------------
------------   LOWER   ------------
------------   UPPER   ------------
------------   LEN   ------------
------------   REVERSE   ------------

SELECT LEFT('abcdefg', 3)[left], -- abc
	   RIGHT('abcdefg', 3)[right],  -- efg
	   LOWER('ASDFG')[lower], -- asdfg
	   UPPER('asdfg')[upper],  -- ASDFG
	   LEN('1235   lol')[length],  -- 10
	   REVERSE('123456789')[reverse]  -- 987654321
GO


------------   STUFF   ------------
------------   SUBSTRING   ------------

SELECT STUFF('aaabbbccc', 3, 2, '!!')[stuff],  --  aa!!bbccc
-- STUFF -- 3 - how many symbols should be deleted
		 -- 2 - how many symbols should be replaced in a deleted place
		 -- '!!' - what kind of symbols should be replaced the deleted symbols
	   SUBSTRING('aaabbbccc', 3, 2)[substring] -- ab
GO

------------   SPACE   ------------
-- gives empty spaces
PRINT 'Hello' + SPACE(5) + 'world' + SPACE(2) + '!'  --  Hello     world  !

------------   CHARINDEX   ------------
SELECT CHARINDEX ('Two', 'One Two Three'),  -- 5
	   PATINDEX('%Th_ee%', 'One Two Three Four Five')  -- 9
	   
 
------------   REPLACE   ------------
SELECT REPLACE('One Two Three Four Five', 'Five', 5) -- One Two Three Four 5


-- Any concotenation with NULL is NULL
SELECT 'hello' + NULL  -- NULL

 

------------   Mathematical Functions   ------------
--> SQRT
--> SQUARE
--> POWER
--> ROUND
--> FLOOR

SELECT SQRT(144), -- 12
	   SQUARE(25),  -- 625
	   POWER(2, 8), -- 256
	   FLOOR(123.4), -- 123, non-mathematical rounding
	   FLOOR(123.8), -- 123
	   ROUND(123.4567, 3, 1), -- 123.4560, mathematical rounding 
	   ROUND(123.6, 0), -- 124.0 
	   PI()  -- 3.14159265358979


------------   Date and Time Functions   ------------

SELECT DATEDIFF(MONTH, '20200101', '20200201'), -- how many months is the difference: 1
	   DATEDIFF(DAY, '20200101', '20200201'), -- how many days is the difference: 31
	   DATEADD(MONTH, -3, GETDATE()) -- get current date time and take a month from it: 2018-11-06 00:27:36.320

DECLARE @now date = GETDATE() -- get current date time
PRINT @now -- 2019-02-06

SELECT 
	DATENAME(yy, @now), -- 2019
	DATENAME(MONTH, @now),  -- February
	DATENAME(DAY, @now)  -- 6

DECLARE @today char(25) = CURRENT_TIMESTAMP  -- 2019-02-06
PRINT @today
