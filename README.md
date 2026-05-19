# Database Systems Lab Record

---

## Experiment 1 — Implement DDL and DML Operations (Create, Insert, Update, Delete)

### Aim
To implement DDL and DML operations such as CREATE, INSERT, UPDATE, and DELETE using SQL commands.

### Algorithm
1. Start the program.
2. Create a database table using the `CREATE` command.
3. Insert records into the table using the `INSERT` command.
4. Display the table contents using `SELECT`.
5. Modify existing records using the `UPDATE` command.
6. Delete selected records using the `DELETE` command.
7. Display the updated table.
8. Stop the program.

### Program

```sql
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
```

### Output

**After INSERT:**

| RollNo | Name    | Department | Marks |
|--------|---------|------------|-------|
| 1      | Arun    | CSE        | 85    |
| 2      | Divya   | IT         | 90    |
| 3      | Karthik | ECE        | 78    |

**After UPDATE (Karthik's marks changed to 88):**

| RollNo | Name    | Department | Marks |
|--------|---------|------------|-------|
| 1      | Arun    | CSE        | 85    |
| 2      | Divya   | IT         | 90    |
| 3      | Karthik | ECE        | 88    |

**After DELETE (RollNo 1 removed):**

| RollNo | Name    | Department | Marks |
|--------|---------|------------|-------|
| 2      | Divya   | IT         | 90    |
| 3      | Karthik | ECE        | 88    |

### Result
Thus, the DDL and DML operations (CREATE, INSERT, UPDATE, and DELETE) were successfully implemented using SQL, and the records were created, modified, and deleted as required.

---

## Experiment 2 — SQL Queries Using WHERE, ORDER BY, BETWEEN, IN, LIKE Clauses

### Aim
To write and execute SQL queries using WHERE, ORDER BY, BETWEEN, IN, and LIKE clauses to filter and sort data from a database table.

### Algorithm
1. Create a table with required fields.
2. Insert sample records into the table.
3. Use the `WHERE` clause to filter records based on conditions.
4. Use `ORDER BY` to sort the result set.
5. Use `BETWEEN` to select values within a range.
6. Use `IN` to match values from a given list.
7. Use `LIKE` to search for patterns in text fields.
8. Observe and verify the output.

### Program

```sql
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
```

### Output

**WHERE (Department = 'CSE'):**

| RollNo | Name   | Department | Marks |
|--------|--------|------------|-------|
| 1      | Anu    | CSE        | 85    |
| 3      | Charan | CSE        | 90    |

**ORDER BY Marks DESC:**

| RollNo | Name   | Department | Marks |
|--------|--------|------------|-------|
| 3      | Charan | CSE        | 90    |
| 1      | Anu    | CSE        | 85    |
| 5      | Arun   | IT         | 78    |
| 2      | Bala   | ECE        | 72    |
| 4      | Divya  | EEE        | 65    |

**BETWEEN 70 AND 85:**

| RollNo | Name | Department | Marks |
|--------|------|------------|-------|
| 1      | Anu  | CSE        | 85    |
| 2      | Bala | ECE        | 72    |
| 5      | Arun | IT         | 78    |

**IN ('CSE', 'IT'):**

| RollNo | Name   | Department | Marks |
|--------|--------|------------|-------|
| 1      | Anu    | CSE        | 85    |
| 3      | Charan | CSE        | 90    |
| 5      | Arun   | IT         | 78    |

**LIKE 'A%':**

| RollNo | Name | Department | Marks |
|--------|------|------------|-------|
| 1      | Anu  | CSE        | 85    |
| 5      | Arun | IT         | 78    |

### Result
Thus, SQL queries using WHERE, ORDER BY, BETWEEN, IN, and LIKE clauses were successfully written and executed, and the required results were obtained.

---

## Experiment 3 — Implement Different Types of Joins (Inner, Left, Right, Outer, Self Join)

### Aim
To implement and execute different types of SQL joins — INNER JOIN, LEFT JOIN, RIGHT JOIN, OUTER JOIN, and SELF JOIN — to combine data from multiple tables.

### Algorithm
1. Create two related tables.
2. Insert sample records into both tables.
3. Use `INNER JOIN` to retrieve matching records from both tables.
4. Use `LEFT JOIN` to retrieve all records from the left table and matching records from the right.
5. Use `RIGHT JOIN` to retrieve all records from the right table and matching records from the left.
6. Use `FULL OUTER JOIN` to retrieve all records from both tables.
7. Use `SELF JOIN` to join a table with itself.
8. Observe and verify the output.

### Program

```sql
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
```

### Output

**INNER JOIN:**

| EmpName | DeptName |
|---------|----------|
| Anu     | CSE      |
| Bala    | ECE      |
| Charan  | CSE      |
| Divya   | EEE      |

**LEFT JOIN:** *(same as INNER JOIN here since all employees have a department)*

| EmpName | DeptName |
|---------|----------|
| Anu     | CSE      |
| Bala    | ECE      |
| Charan  | CSE      |
| Divya   | EEE      |

**RIGHT JOIN:** *(all departments shown; unmatched departments show NULL)*

| EmpName | DeptName |
|---------|----------|
| Anu     | CSE      |
| Charan  | CSE      |
| Bala    | ECE      |
| Divya   | EEE      |

**SELF JOIN:**

| Employee | Manager |
|----------|---------|
| Anu      | NULL    |
| Bala     | Anu     |
| Charan   | Anu     |
| Divya    | Bala    |

### Result
Thus, different types of SQL joins were successfully implemented and executed, and the required outputs were obtained.

---

## Experiment 4 — Aggregate Functions (COUNT, SUM, AVG, MAX, MIN) with GROUP BY and HAVING

### Aim
To use aggregate functions COUNT, SUM, AVG, MAX, and MIN along with GROUP BY and HAVING clauses to perform calculations on grouped data.

### Algorithm
1. Create a table with numeric fields.
2. Insert sample records into the table.
3. Use `COUNT` to count the number of records per group.
4. Use `SUM` to calculate total values per group.
5. Use `AVG` to calculate average values per group.
6. Use `MAX` and `MIN` to find the highest and lowest values per group.
7. Use `GROUP BY` to group records by department.
8. Use `HAVING` to filter groups based on aggregate conditions.
9. Observe and verify the output.

### Program

```sql
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
```

### Output

| Department | COUNT(*) | SUM(Marks) | AVG(Marks) | MAX(Marks) | MIN(Marks) |
|------------|----------|------------|------------|------------|------------|
| CSE        | 3        | 253        | 84.33      | 90         | 78         |
| ECE        | 1        | 72         | 72.00      | 72         | 72         |
| EEE        | 1        | 65         | 65.00      | 65         | 65         |

**HAVING AVG(Marks) > 75:**

| Department | AvgMarks |
|------------|----------|
| CSE        | 84.33    |

### Result
Thus, aggregate functions using GROUP BY and HAVING clauses were successfully executed and the required results were obtained.

---

## Experiment 5 — ER Diagram and Relational Schema Implementation in SQL

### Aim
To design an ER diagram for a College Management System, convert it into a Relational Schema, and implement the schema using SQL commands.

### Algorithm
1. Identify entities: Department, Student, Course, Enrollment.
2. Assign primary keys and necessary attributes to each entity.
3. Identify foreign keys for relationships between entities.
4. Establish that one Department has many Students and many Courses.
5. Resolve the many-to-many relationship between Students and Courses using the Enrollment entity.
6. Convert the ER diagram to a Relational Schema with Primary and Foreign Keys.
7. Write `CREATE TABLE` statements and insert sample data.
8. Retrieve and display data using `SELECT` queries.

### Program

```sql
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
```

### Output

**Student Table:**

| Student_ID | Name  | Email            | Dept_ID |
|------------|-------|------------------|---------|
| 101        | Arun  | arun@gmail.com   | 1       |
| 102        | Priya | priya@gmail.com  | 1       |

**Course Table:**

| Course_ID | Course_Name | Credits | Dept_ID |
|-----------|-------------|---------|---------|
| 201       | DBMS        | 4       | 1       |
| 202       | Python      | 3       | 1       |

**Enrollment Table:**

| Enrollment_ID | Student_ID | Course_ID | Semester   | Grade |
|---------------|------------|-----------|------------|-------|
| 1             | 101        | 201       | Semester 1 | A     |
| 2             | 102        | 202       | Semester 1 | B     |

### Result
Thus, the ER diagram was designed, converted into a relational schema, and successfully implemented using SQL commands.

---

## Experiment 6 — Normalization (Up to 3NF) on a Redundant Dataset

### Aim
To apply normalization up to Third Normal Form (3NF) to a dataset containing redundant data and convert it into well-structured relational tables to eliminate redundancy and dependency issues.

### Algorithm
1. Start with the unnormalized dataset (UNF).
2. Convert the table to 1NF by removing repeating groups and ensuring atomic values.
3. Identify the primary key.
4. Check for partial dependencies and decompose tables to achieve 2NF.
5. Identify transitive dependencies.
6. Separate attributes causing transitive dependency into new tables to achieve 3NF.
7. Establish foreign key relationships between tables.
8. The resulting tables represent the database in 3NF.

### Program

```sql
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
```

### Output

**Student Table:**

| StudentID | StudentName | StudentAddress |
|-----------|-------------|----------------|
| 101       | Amit        | Mumbai         |
| 102       | Neha        | Delhi          |
| 103       | Rahul       | Pune           |
| 104       | Priya       | Mumbai         |
| 105       | Karan       | Delhi          |

**Instructor Table:**

| InstructorID | InstructorName | InstructorPhone |
|--------------|----------------|-----------------|
| 1            | Dr. Rao        | 9876543210      |
| 2            | Dr. Sharma     | 9876501234      |
| 3            | Dr. Mehta      | 9876512345      |
| 4            | Dr. Patel      | 9876598765      |

**Course Table:**

| CourseID | CourseName           | InstructorID | Department |
|----------|----------------------|--------------|------------|
| 201      | DBMS                 | 1            | Computer   |
| 202      | Operating System     | 2            | Computer   |
| 203      | Computer Networks    | 3            | IT         |
| 204      | Data Structures      | 4            | Computer   |

**Enrollment Table:**

| StudentID | CourseID |
|-----------|----------|
| 101       | 201      |
| 101       | 202      |
| 102       | 201      |
| 103       | 203      |
| 104       | 204      |
| 105       | 203      |

### Result
Thus, normalization up to 3NF was successfully applied, eliminating redundancy and dependency issues from the dataset.

---

## Experiment 7 — Create and Manipulate Views; Demonstrate Indexes

### Aim
To create and manipulate views in a database and to demonstrate the creation and use of indexes for efficient data retrieval.

### Algorithm
1. Create the Student table and insert sample records.
2. Commit the data.
3. Create a view to display filtered records.
4. Display data through the view.
5. Drop the existing view.
6. Recreate the view with a modified condition.
7. Display data through the modified view.
8. Create an index on the required column.
9. Display existing indexes.
10. Drop the index.

### Program

```sql
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
```

### Output

**Initial View (DEPARTMENT = 'CSE'):**

| NAME   | MARKS |
|--------|-------|
| ANU    | 85    |
| CHITRA | 92    |

**Modified View (MARKS > 80):**

| NAME   | MARKS |
|--------|-------|
| ANU    | 85    |
| CHITRA | 92    |

### Result
Thus, views and indexes were successfully created, manipulated, and demonstrated.

---

## Experiment 8 — Simulate Transactions and Demonstrate ACID Properties

### Aim
To simulate database transactions and demonstrate the ACID properties — Atomicity, Consistency, Isolation, and Durability — using SQL commands.

### Algorithm
1. Start the transaction.
2. Create a `BankAccount` table and insert sample records.
3. Perform a transfer operation: deduct amount from one account and add to another.
4. If all operations succeed, commit the transaction.
5. If any error occurs, roll back the transaction.
6. Display the final balances.
7. Verify each ACID property based on the transaction behaviour.

### Program

```sql
-- Create Table
CREATE TABLE BankAccount (
    AccountID INT,
    Name      VARCHAR(20),
    Balance   INT
);

-- Insert Values
INSERT INTO BankAccount VALUES (1, 'Ram',  5000);
INSERT INTO BankAccount VALUES (2, 'Ravi', 3000);

-- Deduct from Ram
UPDATE BankAccount SET Balance = Balance - 500 WHERE AccountID = 1;

-- Add to Ravi
UPDATE BankAccount SET Balance = Balance + 500 WHERE AccountID = 2;

-- Commit Transaction
COMMIT;

-- Display Final Balances
SELECT * FROM BankAccount;
```

### Output

| AccountID | Name | Balance |
|-----------|------|---------|
| 1         | Ram  | 4500    |
| 2         | Ravi | 3500    |

### ACID Properties Demonstrated

| Property    | Description |
|-------------|-------------|
| **Atomicity**    | All operations complete together or none do. If deduction from Ram fails, the credit to Ravi is also rolled back. |
| **Consistency**  | Total balance before (5000 + 3000 = 8000) equals total balance after (4500 + 3500 = 8000). No value is lost. |
| **Isolation**    | Concurrent transactions operate independently and do not interfere with each other's intermediate states. |
| **Durability**   | Once committed, changes are permanently stored even if the system crashes immediately after. |

### Result
Thus, the transaction simulation was successfully performed and the ACID properties (Atomicity, Consistency, Isolation, Durability) were demonstrated.

---

## Experiment 9 — Demonstrate Concurrency Using Lock-Based Mechanisms

### Aim
To demonstrate concurrency control using lock-based mechanisms in SQL by applying row-level locking with `SELECT ... FOR UPDATE`.

### Algorithm
1. Create a `bank_lock` table and insert a record.
2. Start Transaction 1 and acquire a row-level lock using `SELECT ... FOR UPDATE`.
3. Update the balance within Transaction 1.
4. Start Transaction 2 and attempt to access the same locked row — it waits.
5. Commit Transaction 1 to release the lock.
6. Transaction 2 proceeds, updates the balance, and commits.
7. Display the final state.

### Program

```sql
-- Create Table and Insert Data
CREATE TABLE bank_lock (
    id      INT PRIMARY KEY,
    name    VARCHAR(20),
    balance INT
);

INSERT INTO bank_lock VALUES (1, 'Ram', 5000);

-- Transaction 1: Lock the row
SELECT * FROM bank_lock WHERE id = 1 FOR UPDATE;

-- Transaction 1: Update balance
UPDATE bank_lock SET balance = balance - 500 WHERE id = 1;

-- Transaction 2: Attempts to access same row (waits until lock is released)
SELECT * FROM bank_lock WHERE id = 1 FOR UPDATE;

-- Transaction 1: Commit — lock is released
COMMIT;

-- Transaction 2: Now proceeds and updates
UPDATE bank_lock SET balance = balance + 1000 WHERE id = 1;
COMMIT;

-- Display Final State
SELECT * FROM bank_lock;
```

### Output

| State              | id | Name | Balance |
|--------------------|----|------|---------|
| Initial            | 1  | Ram  | 5000    |
| After T1 Update    | 1  | Ram  | 4500    |
| After T2 Update    | 1  | Ram  | 5500    |

### Result
Thus, concurrency using lock-based mechanisms was successfully demonstrated using `SELECT ... FOR UPDATE`, where Transaction 2 waits until the locked row is released by Transaction 1 before proceeding.

---

## Experiment 10 — Create and Execute PL/SQL Procedures, Functions, and Triggers

### Aim
To create and execute PL/SQL procedures, functions, and triggers in Oracle.

### Algorithm
1. Enable server output using `SET SERVEROUTPUT ON`.
2. Create a `Students` table and insert sample records.
3. Create a PL/SQL **procedure** to display a message and execute it.
4. Create a PL/SQL **function** to return the total number of students and execute it.
5. Create a **trigger** that fires before each `INSERT` on the Students table.
6. Insert a new record to activate the trigger.
7. Observe and verify all outputs.

### Program

```sql
SET SERVEROUTPUT ON;

-- Create Table
CREATE TABLE Students (
    Student_Id   NUMBER,
    Student_Name VARCHAR2(50),
    Marks        NUMBER
);

-- Insert Data
INSERT INTO Students VALUES (1, 'Arun',  80);
INSERT INTO Students VALUES (2, 'Divya', 90);
COMMIT;

-- Procedure: Display a message
CREATE OR REPLACE PROCEDURE display_message AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Procedure executed successfully');
END;
/

-- Execute Procedure
BEGIN
    display_message;
END;
/

-- Function: Return total student count
CREATE OR REPLACE FUNCTION get_student_count RETURN NUMBER IS
    Total_Students NUMBER;
BEGIN
    SELECT COUNT(*) INTO Total_Students FROM Students;
    RETURN Total_Students;
END;
/

-- Execute Function
DECLARE
    total NUMBER;
BEGIN
    total := get_student_count;
    DBMS_OUTPUT.PUT_LINE('Total Students: ' || total);
END;
/

-- Trigger: Fire before each INSERT
CREATE OR REPLACE TRIGGER student_trigger
    BEFORE INSERT ON Students
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger executed before inserting a record');
END;
/

-- Fire the Trigger
INSERT INTO Students VALUES (3, 'Naveen', 95);
```

### Output

```
Procedure executed successfully
Total Students: 2
Trigger executed before inserting a record
```

### Result
Thus, PL/SQL procedures, functions, and triggers were successfully created and executed.

---

## Experiment 11(A) — Case Study: Library Database Schema

### Aim
To design and implement a simple Library Database System using SQL to manage books, members, and book issue details.

### Algorithm
1. Create tables for `Books`, `Members`, and `Issue` with appropriate attributes.
2. Define primary keys and foreign keys for relational integrity.
3. Insert sample records into the Books and Members tables.
4. Insert an issue record using `TO_DATE()` for proper date formatting.
5. Retrieve and display all records using `SELECT` queries.

### Program

```sql
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
```

### Output

**BooksTbl:**

| Book\_ID | Title        | Author       | Quantity |
|----------|--------------|--------------|----------|
| 1        | Harry Potter | J.K. Rowling | 5        |

**MembersTbl:**

| Member\_ID | Name   |
|------------|--------|
| 101        | Suriya |

**IssueTbl:**

| Issue\_ID | Book\_ID | Member\_ID | Issue\_Date |
|-----------|----------|------------|-------------|
| 1001      | 1        | 101        | 11-APR-26   |

### Result
Thus, the Library Database was successfully created, and records for books, members, and issued books were inserted and displayed correctly.

---

## Experiment 11(B) — Case Study: Hospital Database Schema

### Aim
To create a hospital database to manage patients, doctors, and appointments.

### Algorithm
1. Create `Patients`, `Doctors`, and `Appointment` tables with appropriate attributes.
2. Define primary keys and foreign keys.
3. Insert sample patient, doctor, and appointment records.
4. Use `TO_DATE()` for proper date formatting.
5. Display all records using `SELECT` queries.

### Program

```sql
-- Patients Table
CREATE TABLE PatientsTbl (
    Patient_ID INT PRIMARY KEY,
    Name       VARCHAR2(50),
    Disease    VARCHAR2(50)
);

-- Doctors Table
CREATE TABLE DoctorsTbl (
    Doctor_ID      INT PRIMARY KEY,
    Name           VARCHAR2(50),
    Specialization VARCHAR2(50)
);

-- Appointment Table
CREATE TABLE AppointmentTbl (
    App_ID     INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID  INT,
    App_Date   DATE,
    FOREIGN KEY (Patient_ID) REFERENCES PatientsTbl(Patient_ID),
    FOREIGN KEY (Doctor_ID)  REFERENCES DoctorsTbl(Doctor_ID)
);

-- Insert Data
INSERT INTO PatientsTbl VALUES (1, 'Ravi', 'Fever');
INSERT INTO DoctorsTbl VALUES (101, 'Dr. Kumar', 'General');
INSERT INTO AppointmentTbl (App_ID, Patient_ID, Doctor_ID, App_Date)
    VALUES (1001, 1, 101, TO_DATE('2026-04-11', 'YYYY-MM-DD'));

-- Display Data
SELECT * FROM PatientsTbl;
SELECT * FROM DoctorsTbl;
SELECT * FROM AppointmentTbl;
```

### Output

**PatientsTbl:**

| Patient\_ID | Name | Disease |
|-------------|------|---------|
| 1           | Ravi | Fever   |

**DoctorsTbl:**

| Doctor\_ID | Name      | Specialization |
|------------|-----------|----------------|
| 101        | Dr. Kumar | General        |

**AppointmentTbl:**

| App\_ID | Patient\_ID | Doctor\_ID | App\_Date |
|---------|-------------|------------|-----------|
| 1001    | 1           | 101        | 11-APR-26 |

### Result
Thus, the Hospital Database was successfully created and records were inserted and displayed correctly.

---

## Experiment 11(C) — Case Study: E-Commerce Database Schema

### Aim
To create an e-commerce database to manage customers, products, and orders.

### Algorithm
1. Create `Customers`, `Products`, and `Orders` tables with appropriate attributes.
2. Define primary keys and foreign keys.
3. Insert sample records.
4. Use `TO_DATE()` for proper date formatting.
5. Display all records using `SELECT` queries.

### Program

```sql
-- Customers Table
CREATE TABLE CustomersTbl (
    Customer_ID INT PRIMARY KEY,
    Name        VARCHAR2(50),
    City        VARCHAR2(50)
);

-- Products Table
CREATE TABLE ProductsTbl (
    Product_ID   INT PRIMARY KEY,
    Product_Name VARCHAR2(50),
    Price        INT
);

-- Orders Table
CREATE TABLE OrdersTbl (
    Order_ID    INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID  INT,
    Order_Date  DATE,
    FOREIGN KEY (Customer_ID) REFERENCES CustomersTbl(Customer_ID),
    FOREIGN KEY (Product_ID)  REFERENCES ProductsTbl(Product_ID)
);

-- Insert Data
INSERT INTO CustomersTbl VALUES (1, 'Ram', 'Chennai');
INSERT INTO ProductsTbl VALUES (101, 'Laptop', 50000);
INSERT INTO OrdersTbl (Order_ID, Customer_ID, Product_ID, Order_Date)
    VALUES (1001, 1, 101, TO_DATE('2026-04-11', 'YYYY-MM-DD'));

-- Display Data
SELECT * FROM CustomersTbl;
SELECT * FROM ProductsTbl;
SELECT * FROM OrdersTbl;
```

### Output

**CustomersTbl:**

| Customer\_ID | Name | City    |
|--------------|------|---------|
| 1            | Ram  | Chennai |

**ProductsTbl:**

| Product\_ID | Product\_Name | Price |
|-------------|---------------|-------|
| 101         | Laptop        | 50000 |

**OrdersTbl:**

| Order\_ID | Customer\_ID | Product\_ID | Order\_Date |
|-----------|--------------|-------------|-------------|
| 1001      | 1            | 101         | 11-APR-26   |

### Result
Thus, the E-Commerce Database was successfully created and records were inserted and displayed correctly.

---

## Experiment 12 — Comparison of Relational and NoSQL Models

### Aim
To compare the Relational Database Model and the NoSQL Model by implementing a Student Management System using SQL and representing equivalent data in NoSQL document format.

### Algorithm
1. Create `Student_Info`, `Course_Info`, and `Enrollment_Info` tables in the relational model.
2. Insert sample student, course, and enrollment records.
3. Retrieve combined data using a multi-table JOIN query.
4. Represent the same data using a NoSQL document model.
5. Compare both models based on structure, schema, and query approach.

### Program

```sql
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
```

```json
// NoSQL Representation (Document Model — MongoDB style)
{ "name": "Rahul", "age": 20, "email": "rahul@email.com",
  "courses": ["Database Systems", "AI"] }

{ "name": "Priya", "age": 22, "email": "priya@email.com",
  "courses": ["Database Systems"] }
```

### Output

**SQL Output:**

| Name  | Course\_Name     |
|-------|-----------------|
| Rahul | Database Systems |
| Rahul | AI               |
| Priya | Database Systems |

**NoSQL Output (Document Model):**

| Name  | Age | Email            | Courses                   |
|-------|-----|------------------|---------------------------|
| Rahul | 20  | rahul@email.com  | Database Systems, AI      |
| Priya | 22  | priya@email.com  | Database Systems          |

### Difference Between Relational and NoSQL Models

| Feature         | Relational Model          | NoSQL Model               |
|-----------------|---------------------------|---------------------------|
| Data Storage    | Tables (rows and columns) | Documents (JSON format)   |
| Schema          | Fixed schema              | Flexible schema           |
| Relationships   | Primary & Foreign Keys    | Embedded data             |
| Querying        | SQL with JOINs            | No JOINs required         |
| Structure       | Multiple tables           | Single collection         |

### Result
The Student Management System was successfully implemented using the relational model in SQL, and the equivalent NoSQL document model was demonstrated, highlighting the structural differences between both approaches.

---

## Experiment 13 — Mini Project: Complete Database Design (Library Management System)

### Aim
To design a simple Library Database System using SQL to manage books and members, and to perform operations such as issuing and returning books.

### Algorithm
1. Create a `Books` table with attributes: `id`, `name`, `copies`.
2. Create a `Members` table with attributes: `id`, `name`.
3. Insert sample data into both tables.
4. Issue a book by decrementing the copy count using `UPDATE`.
5. Return a book by incrementing the copy count using `UPDATE`.
6. Display all records from both tables.

### Program

```sql
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
```

### Output

**Books Table (after issue and return — net copies unchanged):**

| id | name | copies |
|----|------|--------|
| 1  | DBMS | 5      |

**Members Table:**

| id | name |
|----|------|
| 1  | Ram  |

### Result
Thus, a simple Library Management System database was successfully created, and operations such as book issue and return were performed correctly using SQL queries.

---
