--- >  SELECT  <----------------------------
SELECT TOP 3 * FROM Company  -- Select first 3 rows

SELECT TOP 25 PERCENT * FROM Company  -- Select 25% of rows


--->  ORDER BY  <----------------------------
SELECT * FROM Company  -- Select all the table
ORDER BY [Company Name] DESC -- Sorting by company names (descending)

SELECT * FROM Company  -- Select all the table
ORDER BY [NACE_2 Sector], [NACE_2 Code]  -- Sorting by NACE_2 Sector then by NACE_2 Code


--->  WITH TIES  <----------------------------
SELECT TOP 3 [Nace_2 Sector], [Company Name], [Employee count]  FROM Company  -- Select 3 columns
ORDER BY [Employee count] DESC -- Sorting  by Employee count (descending)

SELECT TOP 4 WITH TIES [Nace_2 Sector], [Company Name], [Employee count]  FROM Company  -- Select 4 columns
-- WITH TIES includes rows which have the same Employee count valu as the last row from the sorted table  
ORDER BY [Employee count] DESC -- Sorting  by Employee count (descending)


 --->  SELECT ... INTO  <----------------------------
 SELECT [Company Name], [Employee count]  -- Select 2 columns from the table Company
 INTO CompEmp  -- and put them into the table CompEmp (just has been created)
 FROM Company


--->  WHERE  <----------------------------
SELECT * FROM Company  -- Select all rows where Employee count = 100
WHERE [Employee count]  = 100

SELECT * FROM Company  -- Select all rows where Nace_2 Sector = 'C'
WHERE [Nace_2 Sector]  = 'C'


SELECT * FROM Company  -- Select all rows where Employee count > 100 and Nace_2 Sector = 'C'
WHERE [Employee count] > 100 AND [Nace_2 Sector]  = 'C'

SELECT * FROM Company  -- Select all rows where Employee count = 100 or Nace_2 Sector = 'B'
WHERE [Employee count] = 100 OR [Nace_2 Sector]  = 'B'


--->  IN  <----------------------------
-- Select all rows where Employee count = 100 or 250
/*1)*/  SELECT * FROM Company 
        WHERE [Employee count] = 100 OR [Employee count] = 250

/*2)*/  SELECT * FROM Company  
        WHERE [Employee count] IN(100, 250)


--->  BETWEEN  <----------------------------
/*1.*/  SELECT * FROM Company 
        WHERE [Employee count] > 100 AND [Employee count] < 500  -- (doesn't include 100 and 500)

/*2.*/  SELECT * FROM Company 
        WHERE [Employee count] BETWEEN 100 AND 500 -- (includes 100 and 500)


--->  LIKE  <----------------------------
----  WildCard Characters  %, _, []
SELECT * FROM Company -- Select all rows where Nace_2 Sector = 'C'
WHERE [Nace_2 Sector]  LIKE 'C'

SELECT * FROM Company -- Select all rows where Employee count starts by 1
WHERE [Employee count]  LIKE '1%'

SELECT * FROM Company -- Select all rows where Employee count starts by 1 or 2
WHERE [Employee count] LIKE '[1,2]0' -- and the second number is 0


--->  IS NULL  <----------------------------
SELECT * FROM Company -- Select all rows where Employee count is null
WHERE [Employee count] IS NULL 

SELECT * FROM Company -- Select all rows where Employee count is 180 or 500 or null
WHERE [Employee count] IN(180,500)
OR [Employee count] IS NULL


---> CASE <----------------------------
SELECT [Nace_2 Sector], [Company Name], [Employee count],
CASE
	WHEN [Employee count] <= 100 THEN 'small'
	WHEN [Employee count] > 100 AND [Employee count] < 250 THEN 'middle'
	WHEN [Employee count] >= 250 THEN 'big'
	ELSE 'none'
END AS Position  -- Creating new column
FROM Company


SELECT [Nace_2 Code], [Company Name], [Employee count],
CASE  [Employee count]
	WHEN '100' THEN 3 
	WHEN '500' THEN 5
	ELSE 1
END AS [Report count]
FROM Company


ALTER TABLE Company  -- Editing the table by adding a new column
ADD [Monthly reports count] nvarchar

---> IIF  <----------------------------
UPDATE Company
SET [Monthly reports count] = IIF([Employee count] <= 100, 0, 1)  --Giving values to the new column: Monthly reports count

SELECT [Nace_2 Code], [Company Name], [Employee count],
IIF([Employee count] <= 100, 'small', 'middle or big') AS [Company type]
FROM Company

SELECT  * FROM Company


--->  GROUP BY  <----------------------------
SELECT [Company Name], [Monthly reports count] FROM Company
GROUP BY [Company Name], [Monthly reports count] 


--->  HAVING  <----------------------------
SELECT [Employee count] FROM Company
GROUP BY [Employee count]
	HAVING [Employee count] LIKE '1%'  -- Having keyword is like a keyword where
