/*
==========================================================================
 Experiment 12 — Comparison of Relational and NoSQL Models
==========================================================================
*/

/* --- Aim --- */
-- To compare the Relational Database Model and the NoSQL Model by implementing a Student Management System using SQL and representing equivalent data in NoSQL document format.

/* --- Algorithm --- */
-- 1. Create `Student_Info`, `Course_Info`, and `Enrollment_Info` tables in the relational model.
-- 2. Insert sample student, course, and enrollment records.
-- 3. Retrieve combined data using a multi-table JOIN query.
-- 4. Represent the same data using a NoSQL document model.
-- 5. Compare both models based on structure, schema, and query approach.

/* --- Program --- */

-- Relational Model: Create Tables
CREATE TABLE Student_Info (
    student_id NUMBER PRIMARY KEY,
    name       VARCHAR2(100),
    age        NUMBER,
    email      VARCHAR2(100)
);

CREATE TABLE Course_Info (
    course_id   NUMBER PRIMARY KEY,
    course_name VARCHAR2(100)
);

CREATE TABLE Enrollment_Info (
    enrollment_id NUMBER PRIMARY KEY,
    student_id    NUMBER,
    course_id     NUMBER,
    FOREIGN KEY (student_id) REFERENCES Student_Info(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course_Info(course_id)
);

-- Insert Data
INSERT INTO Student_Info VALUES (1, 'Rahul', 20, 'rahul@email.com');
INSERT INTO Student_Info VALUES (2, 'Priya', 22, 'priya@email.com');
INSERT INTO Course_Info VALUES (101, 'Database Systems');
INSERT INTO Course_Info VALUES (102, 'AI');
INSERT INTO Enrollment_Info VALUES (1, 1, 101);
INSERT INTO Enrollment_Info VALUES (2, 1, 102);
INSERT INTO Enrollment_Info VALUES (3, 2, 101);
COMMIT;

-- Retrieve with JOIN
SET LINESIZE 200;
SELECT s.name, c.course_name
FROM Student_Info s, Course_Info c, Enrollment_Info e
WHERE s.student_id = e.student_id
  AND c.course_id  = e.course_id;

-- NoSQL Representation (Document Model — MongoDB style)
-- { "name": "Rahul", "age": 20, "email": "rahul@email.com",
--   "courses": ["Database Systems", "AI"] }
-- 
-- { "name": "Priya", "age": 22, "email": "priya@email.com",
--   "courses": ["Database Systems"] }

/* --- Output --- */
-- 
-- **SQL Output:**
-- 
-- | Name  | Course\_Name     |
-- |-------|-----------------|
-- | Rahul | Database Systems |
-- | Rahul | AI               |
-- | Priya | Database Systems |
-- 
-- **NoSQL Output (Document Model):**
-- 
-- | Name  | Age | Email            | Courses                   |
-- |-------|-----|------------------|---------------------------|
-- | Rahul | 20  | rahul@email.com  | Database Systems, AI      |
-- | Priya | 22  | priya@email.com  | Database Systems          |

/* --- Difference Between Relational and NoSQL Models --- */
-- 
-- | Feature         | Relational Model          | NoSQL Model               |
-- |-----------------|---------------------------|---------------------------|
-- | Data Storage    | Tables (rows and columns) | Documents (JSON format)   |
-- | Schema          | Fixed schema              | Flexible schema           |
-- | Relationships   | Primary & Foreign Keys    | Embedded data             |
-- | Querying        | SQL with JOINs            | No JOINs required         |
-- | Structure       | Multiple tables           | Single collection         |

/* --- Result --- */
-- The Student Management System was successfully implemented using the relational model in SQL, and the equivalent NoSQL document model was demonstrated, highlighting the structural differences between both approaches.
