-- Create Fact_Sales table with an additional Date column
CREATE TABLE Fact_Sales (
    FactID INT PRIMARY KEY,
    DateKey INT,
    Date DATE,
    ProductKey INT,
    CustomerKey INT,
    SalespersonKey INT,
    StoreKey INT,
    SalesQuantity INT,
    TransactionAmount DECIMAL(10, 2)
);

-- Insert sample data into Fact_Sales table for January, February, and March
INSERT INTO Fact_Sales (FactID, DateKey, Date, ProductKey, CustomerKey, SalespersonKey, StoreKey, SalesQuantity, TransactionAmount) VALUES
(1, 20230101, '2023-01-01', 101, 201, 301, 401, 10, 150.00),
(2, 20230102, '2023-01-02', 102, 202, 302, 402, 20, 300.00),
(3, 20230103, '2023-01-03', 103, 203, 303, 403, 15, 225.00),
(4, 20230104, '2023-01-04', 104, 204, 304, 404, 25, 375.00),
(5, 20230105, '2023-01-05', 105, 205, 305, 405, 30, 450.00),
(6, 20230106, '2023-01-06', 106, 206, 306, 406, 10, 150.00),
(7, 20230107, '2023-01-07', 107, 207, 307, 407, 20, 300.00),
(8, 20230108, '2023-01-08', 108, 208, 308, 408, 15, 225.00),
(9, 20230109, '2023-01-09', 109, 209, 309, 409, 25, 375.00),
(10, 20230110, '2023-01-10', 110, 210, 310, 410, 30, 450.00),
(11, 20230201, '2023-02-01', 111, 211, 311, 411, 10, 150.00),
(12, 20230202, '2023-02-02', 112, 212, 312, 412, 20, 300.00),
(13, 20230203, '2023-02-03', 113, 213, 313, 413, 15, 225.00),
(14, 20230204, '2023-02-04', 114, 214, 314, 414, 25, 375.00),
(15, 20230205, '2023-02-05', 115, 215, 315, 415, 30, 450.00),
(16, 20230206, '2023-02-06', 116, 216, 316, 416, 10, 150.00),
(17, 20230207, '2023-02-07', 117, 217, 317, 417, 20, 300.00),
(18, 20230208, '2023-02-08', 118, 218, 318, 418, 15, 225.00),
(19, 20230209, '2023-02-09', 119, 219, 319, 419, 25, 375.00),
(20, 20230210, '2023-02-10', 120, 220, 320, 420, 30, 450.00),
(21, 20230301, '2023-03-01', 121, 221, 321, 421, 10, 150.00),
(22, 20230302, '2023-03-02', 122, 222, 322, 422, 20, 300.00),
(23, 20230303, '2023-03-03', 123, 223, 323, 423, 15, 225.00),
(24, 20230304, '2023-03-04', 124, 224, 324, 424, 25, 375.00),
(25, 20230305, '2023-03-05', 125, 225, 325, 425, 30, 450.00),
(26, 20230306, '2023-03-06', 126, 226, 326, 426, 10, 150.00),
(27, 20230307, '2023-03-07', 127, 227, 327, 427, 20, 300.00),
(28, 20230308, '2023-03-08', 128, 228, 328, 428, 15, 225.00),
(29, 20230309, '2023-03-09', 129, 229, 329, 429, 25, 375.00),
(30, 20230310, '2023-03-10', 130, 230, 330, 430, 30, 450.00);

-- Verify the inserted data
SELECT * FROM Fact_Sales;

-- Cumslstive Sum of Sales Quantity
SELECT
    FactID,
    Date,
    SalesQuantity,
    SUM(SalesQuantity) OVER (ORDER BY Date) AS CumulativeSalesQuantity
FROM Fact_Sales;

-- Running total of Transaction Amount
SELECT
    FactID,
    Date,
    TransactionAmount,
    SUM(TransactionAmount) OVER (ORDER BY Date) AS RunningTotalTransactionAmount
FROM Fact_Sales;

-- Add TotalSales column
ALTER TABLE Fact_Sales
ADD TotalSales DECIMAL(10, 2);

-- Update the TotalSales column with sample data
UPDATE Fact_Sales
SET TotalSales = SalesQuantity * 15.00;

-- Verify the updated data
SELECT * FROM Fact_Sales;

--- Cumalative sales for Each Month
SELECT
    FactID,
    Date,
    TotalSales,
    SUM(TotalSales) OVER (ORDER BY Date) AS CumalativeSales
FROM Fact_Sales;

-- Assigning row number to each record
SELECT
    FactID,
    Date,
    SalesQuantity,
    ROW_NUMBER() OVER (ORDER BY Date) AS SaleRowNumber
FROM Fact_Sales;

--- Lead Function to Show Next Sale's Transaction Amount
SELECT
    FactID,
    Date,
    TransactionAmount,
    LEAD(TransactionAmount, 1) OVER (ORDER BY Date) AS NextTransactionAmount
FROM Fact_Sales;

--- Sum of Sales for Each Month
SELECT 
    TO_CHAR(Date, 'YYYY-MM') AS Month,
    SUM(TotalSales) AS TotalMonthlySales
FROM Fact_Sales
GROUP BY TO_CHAR(Date, 'YYYY-MM')
ORDER BY Month;


--- Avg of Sales for Each Month
SELECT 
    TO_CHAR(Date, 'YYYY-MM') AS Month,
    AVG(TotalSales) AS AverageMonthlySales
FROM Fact_Sales
GROUP BY TO_CHAR(Date, 'YYYY-MM')
ORDER BY Month;










