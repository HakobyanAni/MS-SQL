-- ԱՌԱՋԱԴՐԱՆՔ։

-- 1․Ստեղծել բազա 
-- 2․Ստեղծել "Freestyle" table, որը պետք է ունենա մինիմում 10 column, որից միայն 5-6ն է հենց table ստեղծելու ժամանակ 
--   տրվում (ցանկալի է տարբեր տիպեր օգտագործել) 
-- 3.Փոփոխել table-ը և ավելացնել մնացած column-երը միանգամից (multiple) 
-- 4.Փոփոխել column-երից մի քանիսը

CREATE DATABASE [Country]

CREATE TABLE [Country]
(
	[ID] int IDENTITY NOT NULL,
	[Country] char(20) NOT NULL,
	[Capital] varchar(30) NOT NULL,
	[Continent] char(20) NOT NULL,
	[Population] bigint NULL,
	[Water space] varchar(30) NULL,
)

ALTER TABLE [Country]
ADD [Race] varchar(15),
	[Famous people] varchar(30) NOT NULL,
	[Religion] varchar(20) NULL,
	[Famous place] varchar(30) NULL,
	[Famous food] varchar(20) NULL,
	[Time zone] time NULL

ALTER TABLE [Country]
ALTER COLUMN  [Religion] varchar(20) NOT NULL

ALTER TABLE [Country]
DROP COLUMN [Race]

ALTER TABLE [Country]
ALTER COLUMN [Time zone] time NOT NULL

INSERT INTO [Country] 
([Country] , [Capital], [Continent], [Population], [Water space], [Famous people], [Religion], [Famous place], [Famous food], [Time zone])
VALUES
('Armenia', 'Yerevan', 'Asia', '2934152', 'Lake Sevan', 'Hamo Sahyan', 'Christianity', 'Garni', 'Lavash', '04:00:00'),
('United Kingdom', 'London', 'Europe', '66803093', 'River Thames', 'Sherlock Holmes', 'Christianity', 'Tower Bridge', 'Tea', '00:00:00'),
('Saudi Arabia', 'Riyadh', 'Asia', '33554343', 'Red Sea', 'Ali al-Ahmed', 'Muslim', 'Medain Saleh', 'Fatir', '03:00:00') 
 
 SELECT * FROM [Country]
