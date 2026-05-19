/*
==========================================================================
 Experiment 1 — Implement DDL and DML Operations (Create, Insert, Update, Delete)
==========================================================================
*/

/* --- Aim --- */
-- To implement DDL and DML operations such as CREATE, INSERT, UPDATE, and DELETE using SQL commands.

/* --- Algorithm --- */
-- 1. Start the program.
-- 2. Create a database table using the `CREATE` command.
-- 3. Insert records into the table using the `INSERT` command.
-- 4. Display the table contents using `SELECT`.
-- 5. Modify existing records using the `UPDATE` command.
-- 6. Delete selected records using the `DELETE` command.
-- 7. Display the updated table.
-- 8. Stop the program.

/* --- Program --- */

-- DDL Operation: CREATE
CREATE TABLE Student (
    RollNo     INT PRIMARY KEY,
    Name       VARCHAR(50),
    Department VARCHAR(30),
    Marks      INT
);

-- DML Operation: INSERT
INSERT INTO Student VALUES (1, 'Arun',    'CSE', 85);
INSERT INTO Student VALUES (2, 'Divya',   'IT',  90);
INSERT INTO Student VALUES (3, 'Karthik', 'ECE', 78);

-- Display Table
SELECT * FROM Student;

-- DML Operation: UPDATE
UPDATE Student SET Marks = 88 WHERE RollNo = 3;

-- DML Operation: DELETE
DELETE FROM Student WHERE RollNo = 1;

-- Display After UPDATE and DELETE
SELECT * FROM Student;

/* --- Output --- */
-- 
-- **After INSERT:**
-- 
-- | RollNo | Name    | Department | Marks |
-- |--------|---------|------------|-------|
-- | 1      | Arun    | CSE        | 85    |
-- | 2      | Divya   | IT         | 90    |
-- | 3      | Karthik | ECE        | 78    |
-- 
-- **After UPDATE (Karthik's marks changed to 88):**
-- 
-- | RollNo | Name    | Department | Marks |
-- |--------|---------|------------|-------|
-- | 1      | Arun    | CSE        | 85    |
-- | 2      | Divya   | IT         | 90    |
-- | 3      | Karthik | ECE        | 88    |
-- 
-- **After DELETE (RollNo 1 removed):**
-- 
-- | RollNo | Name    | Department | Marks |
-- |--------|---------|------------|-------|
-- | 2      | Divya   | IT         | 90    |
-- | 3      | Karthik | ECE        | 88    |

/* --- Result --- */
-- Thus, the DDL and DML operations (CREATE, INSERT, UPDATE, and DELETE) were successfully implemented using SQL, and the records were created, modified, and deleted as required.
