/*
==========================================================================
 Experiment 5 — ER Diagram and Relational Schema Implementation in SQL
==========================================================================
*/

/* --- Aim --- */
-- To design an ER diagram for a College Management System, convert it into a Relational Schema, and implement the schema using SQL commands.

/* --- Algorithm --- */
-- 1. Identify entities: Department, Student, Course, Enrollment.
-- 2. Assign primary keys and necessary attributes to each entity.
-- 3. Identify foreign keys for relationships between entities.
-- 4. Establish that one Department has many Students and many Courses.
-- 5. Resolve the many-to-many relationship between Students and Courses using the Enrollment entity.
-- 6. Convert the ER diagram to a Relational Schema with Primary and Foreign Keys.
-- 7. Write `CREATE TABLE` statements and insert sample data.
-- 8. Retrieve and display data using `SELECT` queries.

/* --- Program --- */

-- Department Table
CREATE TABLE Department (
    Dept_ID   INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);

-- Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name       VARCHAR(100),
    Email      VARCHAR(100),
    Dept_ID    INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Course Table
CREATE TABLE Course (
    Course_ID   INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Credits     INT,
    Dept_ID     INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID    INT,
    Course_ID     INT,
    Semester      VARCHAR(20),
    Grade         VARCHAR(5),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID)  REFERENCES Course(Course_ID)
);

-- Insert Sample Data
INSERT INTO Department VALUES (1, 'Computer Science');

INSERT INTO Student VALUES (101, 'Arun',  'arun@gmail.com',  1);
INSERT INTO Student VALUES (102, 'Priya', 'priya@gmail.com', 1);

INSERT INTO Course VALUES (201, 'DBMS',   4, 1);
INSERT INTO Course VALUES (202, 'Python', 3, 1);

INSERT INTO Enrollment VALUES (1, 101, 201, 'Semester 1', 'A');
INSERT INTO Enrollment VALUES (2, 102, 202, 'Semester 1', 'B');

-- Display Data
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;

/* --- Output --- */
-- 
-- **Student Table:**
-- 
-- | Student_ID | Name  | Email            | Dept_ID |
-- |------------|-------|------------------|---------|
-- | 101        | Arun  | arun@gmail.com   | 1       |
-- | 102        | Priya | priya@gmail.com  | 1       |
-- 
-- **Course Table:**
-- 
-- | Course_ID | Course_Name | Credits | Dept_ID |
-- |-----------|-------------|---------|---------|
-- | 201       | DBMS        | 4       | 1       |
-- | 202       | Python      | 3       | 1       |
-- 
-- **Enrollment Table:**
-- 
-- | Enrollment_ID | Student_ID | Course_ID | Semester   | Grade |
-- |---------------|------------|-----------|------------|-------|
-- | 1             | 101        | 201       | Semester 1 | A     |
-- | 2             | 102        | 202       | Semester 1 | B     |

/* --- Result --- */
-- Thus, the ER diagram was designed, converted into a relational schema, and successfully implemented using SQL commands.
