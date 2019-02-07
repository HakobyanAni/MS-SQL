-->>>	 CONTINUATION OF THE TASK 4.

SELECT [Country] FROM [Country]  -- select only one country name where the famous food name is tea
WHERE [Famous food] = 'tea'

INSERT [Country] -- add a new row in the table
([Country], [Capital], [Continent], [Population], [Water space], [Famous People], [Religion], [Famous place], [Famous food], [Time zone])
VALUES
('Switzerland', 'Bern', 'Europe', '8544034','River Aare', 'Albert Einstein', 'Christianity', 'Munster', 'Fondue', '01:00:00') 
GO

UPDATE [Country] -- change the famous place name of the row where the country name is Armenia
SET [Famous place] = 'Tatev Monastery'
WHERE [Country] = 'Armenia'

SELECT [Capital] FROM [Country] -- select the capitals where the second symbol is 1
WHERE [Time zone] LIKE '_1%'

SELECT * FROM [Country]  -- select all information about countries which population number starts by 3
WHERE [Population] LIKE '[3]%'

SELECT TOP 3 * FROM [Country] 
ORDER BY [Population] DESC

SELECT SUM([Population]) AS [Sum of population]
FROM [Country]
WHERE [Population] IS NOT NULL

SELECT AVG([Population]) AS [Average population]  -- print the average number of population
FROM [Country]                            -- of the countries where the population is between 
WHERE [Population] BETWEEN 10000000 AND 100000000   -- 10000000 and 100000000 

SELECT [Famous people] FROM [Country] -- select famous people from Armenia and United Kingdom
WHERE [Country] IN ('Armenia', 'United Kingdom') 

ALTER TABLE [Country] -- make changes in the table
ALTER COLUMN [Time zone] time NULL

INSERT [Country]  -- add a new row in the table
([Country], [Capital], [Continent], [Population], [Water space], [Famous People], [Religion], [Famous place], [Famous food], [Time zone])
VALUES
('Canada', 'Ottawa', 'North America', '37058856', 'Lake Ontario', 'Jim Carrey', 'Christianity', 'Capilano Suspension Bridge', 'Poutine', NULL)
GO 

SELECT [Capital] FROM [Country] -- select the column capital and print it descending
GROUP BY [Capital]
ORDER BY [Capital] DESC

UPDATE [Country]  -- change the water space name of the row where the country name is Canada
SET [Water space] = 'Waterfall Niagara'
WHERE [Country] = 'Canada'

SELECT [Country], [Water space] FROM [Country]

TRUNCATE TABLE [Country]  -- clear the table

SELECT * FROM [Country]   -- the table is empty
