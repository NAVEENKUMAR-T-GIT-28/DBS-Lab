/*
==========================================================================
 Experiment 7 — Create and Manipulate Views; Demonstrate Indexes
==========================================================================
*/

/* --- Aim --- */
-- To create and manipulate views in a database and to demonstrate the creation and use of indexes for efficient data retrieval.

/* --- Algorithm --- */
-- 1. Create the Student table and insert sample records.
-- 2. Commit the data.
-- 3. Create a view to display filtered records.
-- 4. Display data through the view.
-- 5. Drop the existing view.
-- 6. Recreate the view with a modified condition.
-- 7. Display data through the modified view.
-- 8. Create an index on the required column.
-- 9. Display existing indexes.
-- 10. Drop the index.

/* --- Program --- */

-- Step 1: Create Table
CREATE TABLE Se2 (
    ROLLNO     NUMBER PRIMARY KEY,
    NAME       VARCHAR2(50),
    DEPARTMENT VARCHAR2(50),
    MARKS      NUMBER
);

-- Step 2: Insert Data
INSERT INTO Se2 VALUES (1, 'ANU',    'CSE', 85);
INSERT INTO Se2 VALUES (2, 'BALA',   'ECE', 78);
INSERT INTO Se2 VALUES (3, 'CHITRA', 'CSE', 92);
INSERT INTO Se2 VALUES (4, 'DAVID',  'EEE', 74);

-- Step 3: Commit
COMMIT;

-- Step 4: Create View
CREATE VIEW CSE_VIEW AS
    SELECT NAME, MARKS FROM Se2 WHERE DEPARTMENT = 'CSE';

-- Step 5: Display View
SELECT * FROM CSE_VIEW;

-- Step 6: Drop View
DROP VIEW CSE_VIEW;

-- Step 7: Recreate View with Modified Condition
CREATE VIEW CSE_VIEW AS
    SELECT NAME, MARKS FROM Se2 WHERE MARKS > 80;

-- Step 8: Display Modified View
SELECT * FROM CSE_VIEW;

-- Step 9: Create Index
CREATE INDEX NAME ON Se2(NAME);

-- Step 10: Display Indexes
SELECT INDEX_NAME FROM USER_INDEXES WHERE TABLE_NAME = 'SE2';

/* --- Output --- */
-- 
-- **Initial View (DEPARTMENT = 'CSE'):**
-- 
-- | NAME   | MARKS |
-- |--------|-------|
-- | ANU    | 85    |
-- | CHITRA | 92    |
-- 
-- **Modified View (MARKS > 80):**
-- 
-- | NAME   | MARKS |
-- |--------|-------|
-- | ANU    | 85    |
-- | CHITRA | 92    |

/* --- Result --- */
-- Thus, views and indexes were successfully created, manipulated, and demonstrated.
