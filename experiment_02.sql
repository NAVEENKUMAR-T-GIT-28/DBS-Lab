/*
==========================================================================
 Experiment 2 — SQL Queries Using WHERE, ORDER BY, BETWEEN, IN, LIKE Clauses
==========================================================================
*/

/* --- Aim --- */
-- To write and execute SQL queries using WHERE, ORDER BY, BETWEEN, IN, and LIKE clauses to filter and sort data from a database table.

/* --- Algorithm --- */
-- 1. Create a table with required fields.
-- 2. Insert sample records into the table.
-- 3. Use the `WHERE` clause to filter records based on conditions.
-- 4. Use `ORDER BY` to sort the result set.
-- 5. Use `BETWEEN` to select values within a range.
-- 6. Use `IN` to match values from a given list.
-- 7. Use `LIKE` to search for patterns in text fields.
-- 8. Observe and verify the output.

/* --- Program --- */

-- Create Table
CREATE TABLE Student (
    RollNo     INT,
    Name       VARCHAR(50),
    Department VARCHAR(30),
    Marks      INT
);

-- Insert Values
INSERT INTO Student VALUES (1, 'Anu',    'CSE', 85);
INSERT INTO Student VALUES (2, 'Bala',   'ECE', 72);
INSERT INTO Student VALUES (3, 'Charan', 'CSE', 90);
INSERT INTO Student VALUES (4, 'Divya',  'EEE', 65);
INSERT INTO Student VALUES (5, 'Arun',   'IT',  78);

-- 1. WHERE clause — filter by department
SELECT * FROM Student WHERE Department = 'CSE';

-- 2. ORDER BY clause — sort by marks descending
SELECT * FROM Student ORDER BY Marks DESC;

-- 3. BETWEEN clause — marks in range 70 to 85
SELECT * FROM Student WHERE Marks BETWEEN 70 AND 85;

-- 4. IN clause — students from CSE or IT
SELECT * FROM Student WHERE Department IN ('CSE', 'IT');

-- 5. LIKE clause — names starting with 'A'
SELECT * FROM Student WHERE Name LIKE 'A%';

/* --- Output --- */
-- 
-- **WHERE (Department = 'CSE'):**
-- 
-- | RollNo | Name   | Department | Marks |
-- |--------|--------|------------|-------|
-- | 1      | Anu    | CSE        | 85    |
-- | 3      | Charan | CSE        | 90    |
-- 
-- **ORDER BY Marks DESC:**
-- 
-- | RollNo | Name   | Department | Marks |
-- |--------|--------|------------|-------|
-- | 3      | Charan | CSE        | 90    |
-- | 1      | Anu    | CSE        | 85    |
-- | 5      | Arun   | IT         | 78    |
-- | 2      | Bala   | ECE        | 72    |
-- | 4      | Divya  | EEE        | 65    |
-- 
-- **BETWEEN 70 AND 85:**
-- 
-- | RollNo | Name | Department | Marks |
-- |--------|------|------------|-------|
-- | 1      | Anu  | CSE        | 85    |
-- | 2      | Bala | ECE        | 72    |
-- | 5      | Arun | IT         | 78    |
-- 
-- **IN ('CSE', 'IT'):**
-- 
-- | RollNo | Name   | Department | Marks |
-- |--------|--------|------------|-------|
-- | 1      | Anu    | CSE        | 85    |
-- | 3      | Charan | CSE        | 90    |
-- | 5      | Arun   | IT         | 78    |
-- 
-- **LIKE 'A%':**
-- 
-- | RollNo | Name | Department | Marks |
-- |--------|------|------------|-------|
-- | 1      | Anu  | CSE        | 85    |
-- | 5      | Arun | IT         | 78    |

/* --- Result --- */
-- Thus, SQL queries using WHERE, ORDER BY, BETWEEN, IN, and LIKE clauses were successfully written and executed, and the required results were obtained.
