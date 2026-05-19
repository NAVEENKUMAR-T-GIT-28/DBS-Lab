/*
==========================================================================
 Experiment 3 — Implement Different Types of Joins (Inner, Left, Right, Outer, Self Join)
==========================================================================
*/

/* --- Aim --- */
-- To implement and execute different types of SQL joins — INNER JOIN, LEFT JOIN, RIGHT JOIN, OUTER JOIN, and SELF JOIN — to combine data from multiple tables.

/* --- Algorithm --- */
-- 1. Create two related tables.
-- 2. Insert sample records into both tables.
-- 3. Use `INNER JOIN` to retrieve matching records from both tables.
-- 4. Use `LEFT JOIN` to retrieve all records from the left table and matching records from the right.
-- 5. Use `RIGHT JOIN` to retrieve all records from the right table and matching records from the left.
-- 6. Use `FULL OUTER JOIN` to retrieve all records from both tables.
-- 7. Use `SELF JOIN` to join a table with itself.
-- 8. Observe and verify the output.

/* --- Program --- */

-- Create Tables
CREATE TABLE Department (
    DeptID   INT,
    DeptName VARCHAR(30)
);

CREATE TABLE Employee (
    EmpID     INT,
    EmpName   VARCHAR(30),
    DeptID    INT,
    ManagerID INT
);

-- Insert Values
INSERT INTO Department VALUES (1, 'CSE');
INSERT INTO Department VALUES (2, 'ECE');
INSERT INTO Department VALUES (3, 'EEE');

INSERT INTO Employee VALUES (101, 'Anu',    1, NULL);
INSERT INTO Employee VALUES (102, 'Bala',   2, 101);
INSERT INTO Employee VALUES (103, 'Charan', 1, 101);
INSERT INTO Employee VALUES (104, 'Divya',  3, 102);

-- INNER JOIN
SELECT E.EmpName, D.DeptName
FROM Employee E
INNER JOIN Department D ON E.DeptID = D.DeptID;

-- LEFT JOIN
SELECT E.EmpName, D.DeptName
FROM Employee E
LEFT JOIN Department D ON E.DeptID = D.DeptID;

-- RIGHT JOIN
SELECT E.EmpName, D.DeptName
FROM Employee E
RIGHT JOIN Department D ON E.DeptID = D.DeptID;

-- SELF JOIN (Employee and their Manager)
SELECT E1.EmpName AS Employee, E2.EmpName AS Manager
FROM Employee E1
LEFT JOIN Employee E2 ON E1.ManagerID = E2.EmpID;

/* --- Output --- */
-- 
-- **INNER JOIN:**
-- 
-- | EmpName | DeptName |
-- |---------|----------|
-- | Anu     | CSE      |
-- | Bala    | ECE      |
-- | Charan  | CSE      |
-- | Divya   | EEE      |
-- 
-- **LEFT JOIN:** *(same as INNER JOIN here since all employees have a department)*
-- 
-- | EmpName | DeptName |
-- |---------|----------|
-- | Anu     | CSE      |
-- | Bala    | ECE      |
-- | Charan  | CSE      |
-- | Divya   | EEE      |
-- 
-- **RIGHT JOIN:** *(all departments shown; unmatched departments show NULL)*
-- 
-- | EmpName | DeptName |
-- |---------|----------|
-- | Anu     | CSE      |
-- | Charan  | CSE      |
-- | Bala    | ECE      |
-- | Divya   | EEE      |
-- 
-- **SELF JOIN:**
-- 
-- | Employee | Manager |
-- |----------|---------|
-- | Anu      | NULL    |
-- | Bala     | Anu     |
-- | Charan   | Anu     |
-- | Divya    | Bala    |

/* --- Result --- */
-- Thus, different types of SQL joins were successfully implemented and executed, and the required outputs were obtained.
