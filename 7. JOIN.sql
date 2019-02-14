CREATE DATABASE DBforJoin

CREATE TABLE Companies
(
	[Company ID] int NOT NULL IDENTITY,
	[Company name] nvarchar(30),
	[Type of activity] varchar(30) 
);

CREATE TABLE Activity
(
	[ID] int NOT NULL IDENTITY,
	[Activity type] nvarchar(100),
	[NACE_2 code of activity] varchar(7)
);

ALTER TABLE Companies
ALTER COLUMN [Company name] nvarchar(30) NULL

ALTER TABLE Companies
ALTER COLUMN [Type of activity] nvarchar(100)

INSERT INTO Activity
([Activity type], [NACE_2 code of activity])
VALUES
('Water collection, treatment and supply', '36.00'),
('Mining of hard coal', '05.10'),
('Construction of residential and non-residential buildings', '41.20'),
('Manufacture of essential oils', '20.53'),
('Manufacture of bicycles and invalid carriages', '30.92')

INSERT INTO Companies
([Company name], [Type of activity])
VALUES
('Coal LLC', 'Mining of hard coal'),
('Bicycle-of-the-future', 'Manufacture of bicycles and invalid carriages'),
('MUSICool', 'Sound recording and music publishing activities '),
('A & H Corporation', NULL)

---------------- >>>  INNER JOINS  <<< ----------------
SELECT * FROM Companies

SELECT * FROM Activity

SELECT * FROM Companies c
JOIN Activity a
ON c.[Type of activity] = a.[Activity type]

SELECT * FROM Activity a
JOIN Companies c
ON a.[Activity type] = c.[Type of activity]


---------------- >>>  OUTER JOINS  <<< ----------------

---------------- >>> 1.  LEFT  JOIN
-- We see all the rows of the table Companies
SELECT c.[Company name], c.[Type of activity], a.[NACE_2 code of activity] FROM Companies c
LEFT JOIN Activity a
ON c.[Type of activity] = a.[Activity type]

---------------- >>> 2. RIGHT JOIN
-- We see all the rows of the table Activity
SELECT * FROM Companies c 
RIGHT JOIN Activity a
ON c.[Type of activity] = a.[Activity type] 

---------------- >>> 2. FULL JOIN
-- We see all the rows of two tables
SELECt * FROM Companies c
FULL JOIN Activity a
ON c.[Type of activity] = a.[Activity type]

-- We see all the rows of the previous table where company names (from the table Companies) 
-- or activity types(from the table Activity) don't exist
SELECT * FROM Companies c
FULL JOIN Activity a
ON c.[Type of activity] = a.[Activity type]
WHERE c.[Company name] IS NULL 
OR a.[Activity type] IS NULL

---------------- >>>  CROSS JOIN  <<< ----------------
SELECT * FROM Companies
CROSS JOIN Activity

---------------- >>>  THETA JOIN  <<< ----------------
SELECT * FROM Companies c 
JOIN Activity a
ON a.[NACE_2 code of activity] > 30.00

---------------- >>>  SELF JOIN  <<< ----------------
------ In case of Self Join we must create alias of table
SELECT * FROM [Activity] a1 
JOIN [Activity] a2
ON a1.ID = a2.ID
 
-- Theta, Cross and Self Joins is logicaly wrong for this example, these are only to show the syntax.
