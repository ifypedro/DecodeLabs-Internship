/*-----(Brief informations)-------#
> Coder: Onwubuya Ifeany Pedro
> This script is a step by step approach in completing the week 2 (task 1)  project Decodelab intenship program
> The name of my Dataset is decode_wps
       ====== OBJECTIVES =========
	 > Calculate basic statistics,
     > Identify trends
     > Identify outliers
     > Summerize observations
*/
     
SELECT * FROM decode_wps; # (to Preview the content of the dataset)
DESCRIBE decode_wps; # (Ensuring the datatype of each column especially Quantity, UnitPrice, TotalPrice and Date)
     
     #---- How many data am working with ----
     SELECT count(*) AS TotalRows
     FROM decode_wps;
     
      #---- How many customers am working with ----
     SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers
	 FROM decode_wps;
     
#--- count, Min, Max ---
SELECT
    COUNT(Quantity) AS TotalRecords,
    MIN(Quantity) AS MinimumQuantity,
    MAX(Quantity) AS MaximumQuantity
FROM decode_wps;

#--- Min / Average----
SELECT
    AVG(Quantity) AS AverageQuantity
FROM decode_wps;

#----- Median ---
SELECT
    AVG(Quantity) AS MedianQuantity
FROM (
    SELECT
        Quantity,
        ROW_NUMBER() OVER (ORDER BY Quantity) AS RowNum,
        COUNT(*) OVER () AS TotalRows
    FROM decode_wps
) AS ranked
WHERE RowNum IN (
    FLOOR((TotalRows + 1) / 2),
    CEIL((TotalRows + 1) / 2)
);

 #---- Analyzing TotalPrice----
SELECT
    COUNT(TotalPrice) AS TotalRecords,
    MIN(TotalPrice) AS MinimumOrderValue,
    MAX(TotalPrice) AS MaximumOrderValue,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM decode_wps;

#-----Median TotalPrice----
SELECT
    ROUND(AVG(TotalPrice), 2) AS MedianOrderValue
FROM (
    SELECT
        TotalPrice,
        ROW_NUMBER() OVER (ORDER BY TotalPrice) AS RowNum,
        COUNT(*) OVER () AS TotalRows
    FROM decode_wps
) AS ranked
WHERE RowNum IN (
    FLOOR((TotalRows + 1) / 2),
    CEIL((TotalRows + 1) / 2)
);

#---- Looking for trends/ Outliers----
SELECT
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM decode_wps
ORDER BY TotalPrice DESC
LIMIT 10;

#=== OBSERVATION CLEAN ! ====
/*-----END OF CODE----
SIGNED : ONWUBUYA IFEANYI PEDRO(PEDROTECH)
CC: Decodelabs tech
Date : 17-09-2026
*/
