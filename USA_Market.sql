#Step 1
CREATE TABLE USA_Chocolate_Sales AS
SELECT *
FROM Chocolate_Sales
WHERE Country = 'USA';


#step 2
ALTER TABLE USA_Chocolate_Sales
ADD Clean_Price REAL

ALTER TABLE USA_Chocolate_Sales 
ADD Formatted_Date DATE;

UPDATE USA_Chocolate_Sales
SET Clean_Price = REPLACE(TRIM(Price), '$', '') ;

UPDATE "USA_Chocolate_Sales"
SET "Formatted_Date" = 
    SUBSTR("Date", 7, 4) || '-' || 
    SUBSTR("Date", 4, 2) || '-' || 
    SUBSTR("Date", 1, 2);
	
	
#step 3 Drinking Coco
	CREATE TABLE USA_Drinking_Coco AS
SELECT 
    Formatted_Date,
    Clean_Price,
    Country,
    "Boxes Shipped"
FROM USA_Chocolate_Sales
WHERE Product = 'Drinking Coco';
#step 3 70% Dark Bites
	CREATE TABLE USA_70_Dark_Bites AS
SELECT 
    Formatted_Date,
    Clean_Price,
    Country,
    "Boxes Shipped"
FROM USA_Chocolate_Sales
WHERE Product = '70% Dark Bites';
#step 3 85% Dark Bars
CREATE TABLE USA_85_Dark_Bars AS
SELECT 
    Formatted_Date,
    Clean_Price,
    Country,
    "Boxes Shipped"
FROM USA_Chocolate_Sales
WHERE Product = '85% Dark Bars';
#step 3 99% Dark & Pure
CREATE TABLE USA_99_Dark_Pure AS
SELECT 
    Formatted_Date,
    Clean_Price,
    Country,
    "Boxes Shipped"
FROM USA_Chocolate_Sales
WHERE Product = '99% Dark & Pure';
#step 3 Peanut Butter Cubes
CREATE TABLE USA_Peanut_Butter_Cubes AS
SELECT 
    Formatted_Date,
    Clean_Price,
    Country,
    "Boxes Shipped"
FROM USA_Chocolate_Sales
WHERE Product = 'Peanut Butter Cubes';

#step 4
SELECT 
    MIN(Clean_Price) AS Min_Price,
    MAX(Clean_Price) AS Max_Price,
    AVG(Clean_Price) AS Avg_Price
FROM USA_Drinking_Coco; 

DELETE FROM USA_Drinking_Coco
WHERE Clean_Price > 40.00 
   OR Clean_Price < 17.00;

SELECT 
    MIN(Clean_Price) AS Min_Price,
    MAX(Clean_Price) AS Max_Price,
    AVG(Clean_Price) AS Avg_Price
FROM USA_70_Dark_Bites; 

 #Here I decided to not change the data because the variance was not big
 
 SELECT 
    MIN(Clean_Price) AS Min_Price,
    MAX(Clean_Price) AS Max_Price,
    AVG(Clean_Price) AS Avg_Price
FROM USA_85_Dark_Bars; 

DELETE FROM USA_85_Dark_Bars
WHERE Clean_Price < 5.00 
   OR Clean_Price > 53.00;
   
   SELECT 
    MIN(Clean_Price) AS Min_Price,
    MAX(Clean_Price) AS Max_Price,
    AVG(Clean_Price) AS Avg_Price
FROM USA_99_Dark_Pure; 

DELETE FROM USA_99_Dark_Pure
WHERE Clean_Price <3.00 
   OR Clean_Price >35.00 ;
   
    SELECT 
    MIN(Clean_Price) AS Min_Price,
    MAX(Clean_Price) AS Max_Price,
    AVG(Clean_Price) AS Avg_Price
FROM USA_Peanut_Butter_Cubes;

DELETE FROM USA_Peanut_Butter_Cubes
WHERE Clean_Price <10.00 
   OR Clean_Price >80.00 ;
   
   #step 5 
   
   INSERT INTO USA_Drinking_Coco (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2022', '2023'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.98 AS INTEGER)  
FROM USA_Drinking_Coco
WHERE Formatted_Date LIKE '%2022%';
      INSERT INTO USA_Drinking_Coco (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2023', '2024'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.98 AS INTEGER)  
FROM USA_Drinking_Coco
WHERE Formatted_Date LIKE '%2023%';
  INSERT INTO USA_Drinking_Coco (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2024', '2025'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.98 AS INTEGER)  
FROM USA_Drinking_Coco
WHERE Formatted_Date LIKE '%2024%';
--------------------------------------------------------------

 INSERT INTO USA_70_Dark_Bites (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2022', '2023'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.8 AS INTEGER)  
FROM USA_70_Dark_Bites
WHERE Formatted_Date LIKE '%2022%';
INSERT INTO USA_70_Dark_Bites (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2023', '2024'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.8 AS INTEGER)  
FROM USA_70_Dark_Bites
WHERE Formatted_Date LIKE '%2023%';
INSERT INTO USA_70_Dark_Bites (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2024', '2025'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.8 AS INTEGER)  
FROM USA_70_Dark_Bites
WHERE Formatted_Date LIKE '%2024%';
-----------------------------------------------

INSERT INTO USA_85_Dark_Bars (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2022', '2023'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.75 AS INTEGER)  
FROM USA_85_Dark_Bars
WHERE Formatted_Date LIKE '%2022%';
INSERT INTO USA_85_Dark_Bars (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2023', '2024'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.75 AS INTEGER)  
FROM USA_85_Dark_Bars
WHERE Formatted_Date LIKE '%2023%';
INSERT INTO USA_85_Dark_Bars (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2024', '2025'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.75 AS INTEGER)  
FROM USA_85_Dark_Bars
WHERE Formatted_Date LIKE '%2024%';
--------------------------------------------------

INSERT INTO USA_99_Dark_Pure (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2022', '2023'), 
    Clean_Price * 1.05,                      
    Country,
    CAST("Boxes Shipped" * 0.83 AS INTEGER)  
FROM USA_99_Dark_Pure
WHERE Formatted_Date LIKE '%2022%';
INSERT INTO USA_99_Dark_Pure (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2023', '2024'), 
    Clean_Price * 1.05,                      
    Country,
    CAST("Boxes Shipped" * 0.83 AS INTEGER)  
FROM USA_99_Dark_Pure
WHERE Formatted_Date LIKE '%2023%';
INSERT INTO USA_99_Dark_Pure (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2024', '2025'), 
    Clean_Price * 1.05,                      
    Country,
    CAST("Boxes Shipped" * 0.83 AS INTEGER)  
FROM USA_99_Dark_Pure
WHERE Formatted_Date LIKE '%2024%';
------------------------------------------------------------

INSERT INTO USA_Peanut_Butter_Cubes (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2022', '2023'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.97 AS INTEGER)  
FROM USA_Peanut_Butter_Cubes
WHERE Formatted_Date LIKE '%2022%';
INSERT INTO USA_Peanut_Butter_Cubes (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2023', '2024'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.97 AS INTEGER)  
FROM USA_Peanut_Butter_Cubes
WHERE Formatted_Date LIKE '%2023%';
INSERT INTO USA_Peanut_Butter_Cubes (Formatted_Date, Clean_Price, Country, "Boxes Shipped")
SELECT
    REPLACE(Formatted_Date, '2024', '2025'), 
    Clean_Price * 1.1,                      
    Country,
    CAST("Boxes Shipped" * 0.97 AS INTEGER)  
FROM USA_Peanut_Butter_Cubes
WHERE Formatted_Date LIKE '%2024%';
-----------------------------------------------------------------
#step 6

CREATE TABLE Final_Chocolate_Master_USA AS
SELECT *, 'Drinking Coco' AS Product FROM USA_Drinking_Coco
UNION ALL
SELECT *, '85% Dark Bars' AS Product FROM USA_85_Dark_Bars
UNION ALL
SELECT *, 'Peanut Butter Cubes' AS Product FROM USA_Peanut_Butter_Cubes
UNION ALL
SELECT *, '99% Dark & Pure' AS Product FROM USA_99_Dark_Pure
UNION ALL
SELECT *, '70% Dark Bites' AS Product FROM USA_70_Dark_Bites;