/*-----------------(Brief informations)--------------------#
-- This script is a step by step approach in completing the week 3 (taks 2) project Decodelab intenship program
-- The name of my Dataset is decode_wps
*/

# Preview the content of the dataset
SELECT * 
FROM decode_wps;

# Ensuring the datatype of each column especially Quantity, UnitPrice, TotalPrice and Date
DESCRIBE decode_wps;


#----(Selecting useful columns)--------#
SELECT 
	OrderID, 
	Date, 
	CustomerID, 
	Product, 
    Quantity, 
    UnitPrice, 
    TotalPrice
FROM decode_wps;

#--(Checking orders that was successfully delivered)--#
SELECT *
FROM decode_wps
WHERE OrderStatus = 'delivered';

#--(Orders above 1,000)--#
SELECT
    OrderID,
    CustomerID,
    Product,
    TotalPrice
FROM decode_wps
WHERE TotalPrice > 1000 ;

#--(Orders with quantity greater than 2)--#
SELECT *
FROM decode_wps
WHERE Quantity > 2;

#--(sort the data, Highest-value orders)--#
SELECT
    OrderID,
    CustomerID,
    Product,
    TotalPrice
FROM decode_wps
ORDER BY TotalPrice DESC;

#--(sort the data, lowest-value orders)--#
SELECT
    OrderID,
    CustomerID,
    Product,
    TotalPrice
FROM decode_wps
ORDER BY TotalPrice ASC;

#--(combining WHERE and ORDER BY:)--#
SELECT
    OrderID,
    Product,
    TotalPrice,
    OrderStatus
FROM decode_wps
WHERE OrderStatus = 'Delivered'
ORDER BY TotalPrice DESC;

#--(Determining hoe many orders are where made:)--#
SELECT COUNT(*) AS TotalOrders
FROM decode_wps;

#--(How many unique customers?)--#
SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM decode_wps;

#--(Total quantity sold?)--#
SELECT SUM(Quantity) AS TotalQuantitySold
FROM decode_wps;

#--(Total sales?)--#
SELECT SUM(TotalPrice) AS TotalRevenue
FROM decode_wps;

#--(Average order value)--#
SELECT AVG(TotalPrice) AS AverageOrderValue
FROM decode_wps;

#--(Group by Product)----suitable for visualization(eg PowerBI)---#
SELECT
    Product,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(Quantity) AS UnitsSold,
    SUM(TotalPrice) AS TotalRevenue,
    AVG(TotalPrice) AS AverageOrderValue
FROM decode_wps
GROUP BY Product
ORDER BY TotalRevenue DESC;

#--(Which payment methods are being used most?)--#
SELECT
    PaymentMethod,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalRevenue
FROM decode_wps
GROUP BY PaymentMethod
ORDER BY NumberOfOrders DESC;

#--(Order Status)--#
SELECT
    OrderStatus,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalValue
FROM decode_wps
GROUP BY OrderStatus
ORDER BY NumberOfOrders DESC;

#--(ReferralSource)--#
SELECT
    ReferralSource,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalRevenue
FROM decode_wps
GROUP BY ReferralSource
ORDER BY TotalRevenue DESC;

#--(CUSTOMER ANALYSIS)--#
SELECT
    CustomerID,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSpent,
    AVG(TotalPrice) AS AverageOrderValue
FROM decode_wps
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

#--(COUPON ANALYSIS)--#
SELECT
    CouponCode,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalRevenue
FROM decode_wps
WHERE CouponCode IS NOT NULL
GROUP BY CouponCode
ORDER BY NumberOfOrders DESC;

#--(DATE ANALYSIS)--#
SELECT
    YEAR(Date) AS OrderYear,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalRevenue
FROM decode_wps
GROUP BY YEAR(Date)
ORDER BY OrderYear;

/*---END OF CODE---
SIGNED : ONWUBUYA IFEANYI PEDRO(PEDROTECH)
CC: Decodelabs
Date : 22-09-2026
*/


