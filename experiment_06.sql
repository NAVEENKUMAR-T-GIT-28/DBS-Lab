/*
==========================================================================
 Experiment 6 — Normalization (Up to 3NF) on a Redundant Dataset
==========================================================================
*/

/* --- Aim --- */
-- To apply normalization up to Third Normal Form (3NF) to a dataset containing redundant data and convert it into well-structured relational tables to eliminate redundancy and dependency issues.

/* --- Algorithm --- */
-- 1. Start with the unnormalized dataset (UNF).
-- 2. Convert the table to 1NF by removing repeating groups and ensuring atomic values.
-- 3. Identify the primary key.
-- 4. Check for partial dependencies and decompose tables to achieve 2NF.
-- 5. Identify transitive dependencies.
-- 6. Separate attributes causing transitive dependency into new tables to achieve 3NF.
-- 7. Establish foreign key relationships between tables.
-- 8. The resulting tables represent the database in 3NF.

/* --- Program --- */

-- Student Table (3NF)
CREATE TABLE Student (
    StudentID      INT PRIMARY KEY,
    StudentName    VARCHAR(50),
    StudentAddress VARCHAR(50)
);

INSERT INTO Student VALUES (101, 'Amit',  'Mumbai');
INSERT INTO Student VALUES (102, 'Neha',  'Delhi');
INSERT INTO Student VALUES (103, 'Rahul', 'Pune');
INSERT INTO Student VALUES (104, 'Priya', 'Mumbai');
INSERT INTO Student VALUES (105, 'Karan', 'Delhi');

-- Instructor Table (3NF)
CREATE TABLE Instructor (
    InstructorID    INT PRIMARY KEY,
    InstructorName  VARCHAR(50),
    InstructorPhone VARCHAR(15)
);

INSERT INTO Instructor VALUES (1, 'Dr. Rao',    '9876543210');
INSERT INTO Instructor VALUES (2, 'Dr. Sharma', '9876501234');
INSERT INTO Instructor VALUES (3, 'Dr. Mehta',  '9876512345');
INSERT INTO Instructor VALUES (4, 'Dr. Patel',  '9876598765');

-- Course Table (3NF)
CREATE TABLE Course (
    CourseID     INT PRIMARY KEY,
    CourseName   VARCHAR(50),
    InstructorID INT,
    Department   VARCHAR(50),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

INSERT INTO Course VALUES (201, 'DBMS',               1, 'Computer');
INSERT INTO Course VALUES (202, 'Operating System',   2, 'Computer');
INSERT INTO Course VALUES (203, 'Computer Networks',  3, 'IT');
INSERT INTO Course VALUES (204, 'Data Structures',    4, 'Computer');

-- Enrollment Table
CREATE TABLE Enrollment (
    StudentID INT,
    CourseID  INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)  REFERENCES Course(CourseID)
);

INSERT INTO Enrollment VALUES (101, 201);
INSERT INTO Enrollment VALUES (101, 202);
INSERT INTO Enrollment VALUES (102, 201);
INSERT INTO Enrollment VALUES (103, 203);
INSERT INTO Enrollment VALUES (104, 204);
INSERT INTO Enrollment VALUES (105, 203);

/* --- Output --- */
-- 
-- **Student Table:**
-- 
-- | StudentID | StudentName | StudentAddress |
-- |-----------|-------------|----------------|
-- | 101       | Amit        | Mumbai         |
-- | 102       | Neha        | Delhi          |
-- | 103       | Rahul       | Pune           |
-- | 104       | Priya       | Mumbai         |
-- | 105       | Karan       | Delhi          |
-- 
-- **Instructor Table:**
-- 
-- | InstructorID | InstructorName | InstructorPhone |
-- |--------------|----------------|-----------------|
-- | 1            | Dr. Rao        | 9876543210      |
-- | 2            | Dr. Sharma     | 9876501234      |
-- | 3            | Dr. Mehta      | 9876512345      |
-- | 4            | Dr. Patel      | 9876598765      |
-- 
-- **Course Table:**
-- 
-- | CourseID | CourseName           | InstructorID | Department |
-- |----------|----------------------|--------------|------------|
-- | 201      | DBMS                 | 1            | Computer   |
-- | 202      | Operating System     | 2            | Computer   |
-- | 203      | Computer Networks    | 3            | IT         |
-- | 204      | Data Structures      | 4            | Computer   |
-- 
-- **Enrollment Table:**
-- 
-- | StudentID | CourseID |
-- |-----------|----------|
-- | 101       | 201      |
-- | 101       | 202      |
-- | 102       | 201      |
-- | 103       | 203      |
-- | 104       | 204      |
-- | 105       | 203      |

/* --- Result --- */
-- Thus, normalization up to 3NF was successfully applied, eliminating redundancy and dependency issues from the dataset.
