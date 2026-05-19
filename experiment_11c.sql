/*
==========================================================================
 Experiment 11(C) — Case Study: E-Commerce Database Schema
==========================================================================
*/

/* --- Aim --- */
-- To create an e-commerce database to manage customers, products, and orders.

/* --- Algorithm --- */
-- 1. Create `Customers`, `Products`, and `Orders` tables with appropriate attributes.
-- 2. Define primary keys and foreign keys.
-- 3. Insert sample records.
-- 4. Use `TO_DATE()` for proper date formatting.
-- 5. Display all records using `SELECT` queries.

/* --- Program --- */

-- Customers Table
CREATE TABLE CustomersTbl (
    Customer_ID INT PRIMARY KEY,
    Name        VARCHAR2(50),
    City        VARCHAR2(50)
);

-- Products Table
CREATE TABLE ProductsTbl (
    Product_ID   INT PRIMARY KEY,
    Product_Name VARCHAR2(50),
    Price        INT
);

-- Orders Table
CREATE TABLE OrdersTbl (
    Order_ID    INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID  INT,
    Order_Date  DATE,
    FOREIGN KEY (Customer_ID) REFERENCES CustomersTbl(Customer_ID),
    FOREIGN KEY (Product_ID)  REFERENCES ProductsTbl(Product_ID)
);

-- Insert Data
INSERT INTO CustomersTbl VALUES (1, 'Ram', 'Chennai');
INSERT INTO ProductsTbl VALUES (101, 'Laptop', 50000);
INSERT INTO OrdersTbl (Order_ID, Customer_ID, Product_ID, Order_Date)
    VALUES (1001, 1, 101, TO_DATE('2026-04-11', 'YYYY-MM-DD'));

-- Display Data
SELECT * FROM CustomersTbl;
SELECT * FROM ProductsTbl;
SELECT * FROM OrdersTbl;

/* --- Output --- */
-- 
-- **CustomersTbl:**
-- 
-- | Customer\_ID | Name | City    |
-- |--------------|------|---------|
-- | 1            | Ram  | Chennai |
-- 
-- **ProductsTbl:**
-- 
-- | Product\_ID | Product\_Name | Price |
-- |-------------|---------------|-------|
-- | 101         | Laptop        | 50000 |
-- 
-- **OrdersTbl:**
-- 
-- | Order\_ID | Customer\_ID | Product\_ID | Order\_Date |
-- |-----------|--------------|-------------|-------------|
-- | 1001      | 1            | 101         | 11-APR-26   |

/* --- Result --- */
-- Thus, the E-Commerce Database was successfully created and records were inserted and displayed correctly.
