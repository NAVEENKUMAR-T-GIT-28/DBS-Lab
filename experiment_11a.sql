/*
==========================================================================
 Experiment 11(A) — Case Study: Library Database Schema
==========================================================================
*/

/* --- Aim --- */
-- To design and implement a simple Library Database System using SQL to manage books, members, and book issue details.

/* --- Algorithm --- */
-- 1. Create tables for `Books`, `Members`, and `Issue` with appropriate attributes.
-- 2. Define primary keys and foreign keys for relational integrity.
-- 3. Insert sample records into the Books and Members tables.
-- 4. Insert an issue record using `TO_DATE()` for proper date formatting.
-- 5. Retrieve and display all records using `SELECT` queries.

/* --- Program --- */

-- Books Table
CREATE TABLE BooksTbl (
    Book_ID  INT PRIMARY KEY,
    Title    VARCHAR2(50),
    Author   VARCHAR2(50),
    Quantity INT
);

-- Members Table
CREATE TABLE MembersTbl (
    Member_ID INT PRIMARY KEY,
    Name      VARCHAR2(50)
);

-- Issue Table
CREATE TABLE IssueTbl (
    Issue_ID  INT PRIMARY KEY,
    Book_ID   INT,
    Member_ID INT,
    Issue_Date DATE,
    FOREIGN KEY (Book_ID)   REFERENCES BooksTbl(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES MembersTbl(Member_ID)
);

-- Insert Data
INSERT INTO BooksTbl VALUES (1, 'Harry Potter', 'J.K. Rowling', 5);
INSERT INTO MembersTbl VALUES (101, 'Suriya');
INSERT INTO IssueTbl (Issue_ID, Book_ID, Member_ID, Issue_Date)
    VALUES (1001, 1, 101, TO_DATE('2026-04-11', 'YYYY-MM-DD'));

-- Display Data
SELECT * FROM BooksTbl;
SELECT * FROM MembersTbl;
SELECT * FROM IssueTbl;

/* --- Output --- */
-- 
-- **BooksTbl:**
-- 
-- | Book\_ID | Title        | Author       | Quantity |
-- |----------|--------------|--------------|----------|
-- | 1        | Harry Potter | J.K. Rowling | 5        |
-- 
-- **MembersTbl:**
-- 
-- | Member\_ID | Name   |
-- |------------|--------|
-- | 101        | Suriya |
-- 
-- **IssueTbl:**
-- 
-- | Issue\_ID | Book\_ID | Member\_ID | Issue\_Date |
-- |-----------|----------|------------|-------------|
-- | 1001      | 1        | 101        | 11-APR-26   |

/* --- Result --- */
-- Thus, the Library Database was successfully created, and records for books, members, and issued books were inserted and displayed correctly.
