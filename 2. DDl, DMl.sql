-- >> DDL << --

----> CREATING DATABASE
CREATE DATABASE MyFirstDB  -- creating a db

ALTER DATABASE MyFirstDB  -- making changes in db 
COLLATE Cyrillic_General_CI_AS

-- DROP DATABASE MyFirstDB  -- deleting db

USE tempdb  -- use another db

CREATE TABLE Students  -- creating table
(
	ID int NOT NULL IDENTITY,
	FirstName nvarchar(20),
	LastName nvarchar (12),
	Email varchar(20),
	Phone char(12)
);

ALTER TABLE Students  -- making changes in table Students
ALTER COLUMN LastName nvarchar(25) NOT NULL  -- changing column LastName 

ALTER TABLE Students  -- making changes in table Students
ADD  MiddleName nvarchar(30)  -- adding new column

ALTER TABLE Students  -- making changes in the table Students
DROP COLUMN MiddleName  -- deleting column MiddleName


-- >> DML << --

--- > INSERT
INSERT INTO Students  -- adding rows in the table
(FirstName, LastName, Email, Phone)
VALUES
('Joseph' , 'Smith' , 'msdn.microsoft.com' , NULL),
('Kenny' , 'Ortega' , 'msdn.microsoft.com' , +33311223344)

SET IDENTITY_INSERT Students ON  -- turn on identity insert ability
INSERT INTO Students  -- adding rows in the table
(ID, FirstName, LastName, Email, Phone)
VALUES
(5, 'Adam' , 'Efron' , 'msdn.microsoft.com' , NULL)
SET IDENTITY_INSERT Students OFF  -- turn off identity insert ability

---> SELECT
SELECT * FROM Students -- choose all columns from the table
-- * means all columns

SELECT LastName, Email FROM Students  
WHERE ID = 1;  

---> INSERT
CREATE TABLE StudentsPhones  -- creating another the table
(
    ID int,
    LName nvarchar(20),
    PhoneNumber char(20)
);

INSERT StudentsPhones  -- adding columns from the table Students to the table StudentsPhone
	SELECT ID, LastName, Phone FROM Students

--- > UPDATE
UPDATE Students  
	SET Phone = NULL
	WHERE ID = 1

UPDATE Students  
	SET Phone = sp.PhoneNumber
	FROM Students s 
	JOIN StudentsPhones sp ON s.ID = sp.ID

--- > DELETE  
DELETE Students  -- deleting data from the table Students
WHERE ID = 2

--- > TRUNCATE
TRUNCATE TABLE Students  -- clearing tables
TRUNCATE TABLE StudentsPhone

--- > OUTPUT
INSERT INTO Students  -- printing all columns of the table
OUTPUT inserted.*
VALUES
('Joseph' , 'Smith' , 'msdn.microsoft.com' , NULL),
('Kenny' , 'Ortega' , 'msdn.microsoft.com' , +33311223344)

DELETE Students  -- printing deleted data
OUTPUT deleted.ID, deleted.FirstName
WHERE ID = 1

UPDATE Students
SET Phone = '(011)123123'  -- printing any data to see it's inserted and deleted values
OUTPUT inserted.ID, inserted.LastName, inserted.Phone AS [new phone], deleted.Phone "old phone"
WHERE ID = 2

DELETE Students  -- filling the table StudentsPhones
OUTPUT deleted.ID, deleted.LastName, deleted.Phone INTO StudentsPhones
 
TRUNCATE TABLE Students  -- clearing table
