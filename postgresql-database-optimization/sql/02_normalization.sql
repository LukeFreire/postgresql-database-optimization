--PART 2. Normalize the Data (Up to 3NF)

-- 1. Convert data to First Normal Form (1NF) by eliminating repeating groups.

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    CustomerID TEXT PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    Address TEXT
);

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID TEXT PRIMARY KEY,
    ProductName TEXT NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,  
    CustomerID TEXT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--Newly Created OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INTEGER,
    ProductID TEXT,
    Quantity INTEGER,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Recopy data from the dataset
COPY Customers FROM 'data/customers.csv' DELIMITER ',' CSV HEADER;
COPY Orders (OrderID, CustomerID, OrderDate) FROM 'data/orders.csv' WITH (FORMAT CSV, HEADER, DELIMITER ',');
COPY Products FROM 'data/products.csv' DELIMITER ',' CSV HEADER;
COPY OrderDetails (OrderID, ProductID, Quantity, Price) FROM 'data/orders.csv' DELIMITER ',' CSV HEADER;


-- 2. Refine it to Second Normal Form (2NF) by ensuring every non-key attribute depends on the entire primary key.


DROP TABLE IF EXISTS OrderDetails;
--Update table, remove Price
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INTEGER,
    ProductID TEXT,
    Quantity INTEGER,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Recopy data from the dataset
COPY OrderDetails (OrderID, ProductID, Quantity) FROM 'data/orders.csv' DELIMITER ',' CSV HEADER;


-- 3. Transform it into Third Normal Form (3NF) by removing transitive dependencies.

DROP TABLE IF EXISTS Customers;
--Update Table, remove Address
CREATE TABLE Customers (
    CustomerID TEXT PRIMARY KEY,
    CustomerName TEXT NOT NULL
);

--Create Address Table
CREATE TABLE Addresses (
    AddressID SERIAL PRIMARY KEY,
    Address TEXT NOT null
);

--Recopy data from the dataset
COPY Customers (CustomerID, CustomerName) FROM 'data/customers.csv' DELIMITER ',' CSV HEADER;
COPY Addresses (Address) FROM 'data/customers.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Addresses;
