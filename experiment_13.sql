/*
==========================================================================
 Experiment 13 — Mini Project: Complete Database Design (Library Management System)
==========================================================================
*/

/* --- Aim --- */
-- To design a simple Library Database System using SQL to manage books and members, and to perform operations such as issuing and returning books.

/* --- Algorithm --- */
-- 1. Create a `Books` table with attributes: `id`, `name`, `copies`.
-- 2. Create a `Members` table with attributes: `id`, `name`.
-- 3. Insert sample data into both tables.
-- 4. Issue a book by decrementing the copy count using `UPDATE`.
-- 5. Return a book by incrementing the copy count using `UPDATE`.
-- 6. Display all records from both tables.

/* --- Program --- */

-- Create Tables
CREATE TABLE Books (
    id     INT PRIMARY KEY,
    name   VARCHAR(30),
    copies INT
);

CREATE TABLE Members (
    id   INT PRIMARY KEY,
    name VARCHAR(30)
);

-- Insert Data
INSERT INTO Books   VALUES (1, 'DBMS', 5);
INSERT INTO Members VALUES (1, 'Ram');

-- Issue a Book (reduce copy count)
UPDATE Books SET copies = copies - 1 WHERE id = 1;

-- Return a Book (restore copy count)
UPDATE Books SET copies = copies + 1 WHERE id = 1;

-- Display Records
SELECT * FROM Books;
SELECT * FROM Members;

/* --- Output --- */
-- 
-- **Books Table (after issue and return — net copies unchanged):**
-- 
-- | id | name | copies |
-- |----|------|--------|
-- | 1  | DBMS | 5      |
-- 
-- **Members Table:**
-- 
-- | id | name |
-- |----|------|
-- | 1  | Ram  |

/* --- Result --- */
-- Thus, a simple Library Management System database was successfully created, and operations such as book issue and return were performed correctly using SQL queries.
