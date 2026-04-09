--Part 3: Implementing Indexing for Performance Optimization

--SQL scripts for index creation

-- 1. Index on CustomerID in the Orders table
CREATE INDEX idx_customer_id ON Orders(CustomerID);

-- 2. Index on ProductID in the OrderDetails table 
CREATE INDEX idx_product_id ON OrderDetails(ProductID);

-- 3. Index on OrderDate in the Orders table 
CREATE INDEX idx_order_date ON Orders(OrderDate);



--Part 4: Evaluating Performance Before and After Indexing
-- 1. Find all orders placed by a specific customer.
--EXPLAIN ANALYZE
SELECT * 
FROM Orders
WHERE CustomerID = 'C0006';  

-- 2. Calculate the total revenue generated per product.
--EXPLAIN ANALYZE
SELECT od.ProductID, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID;


-- 3. List all orders placed within a specific date range.
--EXPLAIN ANALYZE
SELECT * 
FROM Orders
WHERE OrderDate BETWEEN '2024-01-01' AND '2025-12-31'; 