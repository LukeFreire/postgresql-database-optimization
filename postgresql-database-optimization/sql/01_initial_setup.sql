--PART 1: Load the CSV Data into PostgreSQL

-- 1. Create unnormalized Customers table

CREATE TABLE Customers (
    CustomerID TEXT PRIMARY KEY,
    CustomerName TEXT,
    Address TEXT
);

-- 2. Create an unnormalized Orders table

CREATE TABLE Orders (
    OrderID INTEGER,
    CustomerID TEXT,
    ProductID TEXT,
    Quantity INTEGER,
    Price DECIMAL(10,2),
    OrderDate DATE,
    OrderLineID SERIAL PRIMARY KEY, -- New unique identifier
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 3. Create an unnormalized Products table
CREATE TABLE Products (
    ProductID TEXT PRIMARY KEY,
    ProductName TEXT,
    Price DECIMAL(10,2)
);

-- 4. Import CSV Data into the Database
COPY Customers FROM 'data/customers.csv' DELIMITER ',' CSV HEADER;
COPY Orders FROM 'data/orders.csv' DELIMITER ',' CSV HEADER;
COPY Products FROM 'data/products.csv' DELIMITER ',' CSV HEADER;

-- 5. Query Test

-- Display all customers in the database.
SELECT * FROM Customers;

-- Show the first 10 orders.
SELECT * FROM Orders LIMIT 10;

-- Count total number of products.
SELECT COUNT(*) FROM Products;

