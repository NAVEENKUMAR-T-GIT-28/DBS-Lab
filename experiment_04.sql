/*
==========================================================================
 Experiment 4 — Aggregate Functions (COUNT, SUM, AVG, MAX, MIN) with GROUP BY and HAVING
==========================================================================
*/

/* --- Aim --- */
-- To use aggregate functions COUNT, SUM, AVG, MAX, and MIN along with GROUP BY and HAVING clauses to perform calculations on grouped data.

/* --- Algorithm --- */
-- 1. Create a table with numeric fields.
-- 2. Insert sample records into the table.
-- 3. Use `COUNT` to count the number of records per group.
-- 4. Use `SUM` to calculate total values per group.
-- 5. Use `AVG` to calculate average values per group.
-- 6. Use `MAX` and `MIN` to find the highest and lowest values per group.
-- 7. Use `GROUP BY` to group records by department.
-- 8. Use `HAVING` to filter groups based on aggregate conditions.
-- 9. Observe and verify the output.

/* --- Program --- */

-- Create Table
CREATE TABLE Student (
    RollNo     INT,
    Name       VARCHAR(30),
    Department VARCHAR(20),
    Marks      INT
);

-- Insert Values
INSERT INTO Student VALUES (1, 'Anu',    'CSE', 85);
INSERT INTO Student VALUES (2, 'Bala',   'ECE', 72);
INSERT INTO Student VALUES (3, 'Charan', 'CSE', 90);
INSERT INTO Student VALUES (4, 'Divya',  'EEE', 65);
INSERT INTO Student VALUES (5, 'Arun',   'CSE', 78);

-- COUNT
SELECT Department, COUNT(*) AS Total FROM Student GROUP BY Department;

-- SUM
SELECT Department, SUM(Marks) AS TotalMarks FROM Student GROUP BY Department;

-- AVG
SELECT Department, AVG(Marks) AS AvgMarks FROM Student GROUP BY Department;

-- MAX and MIN
SELECT Department, MAX(Marks) AS Highest, MIN(Marks) AS Lowest
FROM Student GROUP BY Department;

-- HAVING — departments with average marks above 75
SELECT Department, AVG(Marks) AS AvgMarks
FROM Student
GROUP BY Department
HAVING AVG(Marks) > 75;

/* --- Output --- */
-- 
-- | Department | COUNT(*) | SUM(Marks) | AVG(Marks) | MAX(Marks) | MIN(Marks) |
-- |------------|----------|------------|------------|------------|------------|
-- | CSE        | 3        | 253        | 84.33      | 90         | 78         |
-- | ECE        | 1        | 72         | 72.00      | 72         | 72         |
-- | EEE        | 1        | 65         | 65.00      | 65         | 65         |
-- 
-- **HAVING AVG(Marks) > 75:**
-- 
-- | Department | AvgMarks |
-- |------------|----------|
-- | CSE        | 84.33    |

/* --- Result --- */
-- Thus, aggregate functions using GROUP BY and HAVING clauses were successfully executed and the required results were obtained.
