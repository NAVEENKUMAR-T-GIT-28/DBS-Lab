# DBMS – Complete 16-Mark Answers (Semester Exam)

---

## Q1. Use DDL Commands to Create and Modify Database Tables

### Introduction
Data Definition Language (DDL) is a subset of SQL used to define, modify, and delete database structures such as tables, indexes, and schemas. DDL commands do not manipulate data directly — they operate on the structure (schema) of the database. The main DDL commands are **CREATE, ALTER, DROP, TRUNCATE, and RENAME**.

---

### 1. CREATE Command
The `CREATE` command is used to create a new table or database.

**Syntax:**
```sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    ...
);
```

**Example – Create a Student Table:**
```sql
CREATE TABLE Student (
    StudentID   INT PRIMARY KEY,
    Name        VARCHAR(50) NOT NULL,
    Age         INT,
    Department  VARCHAR(30),
    Email       VARCHAR(50) UNIQUE
);
```

**Example – Create a Courses Table:**
```sql
CREATE TABLE Courses (
    CourseID    INT PRIMARY KEY,
    CourseName  VARCHAR(100) NOT NULL,
    Credits     INT DEFAULT 3,
    StudentID   INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
```

---

### 2. ALTER Command
The `ALTER` command modifies an existing table structure — adding, modifying, or dropping columns.

**a) Add a new column:**
```sql
ALTER TABLE Student ADD PhoneNumber VARCHAR(15);
```

**b) Modify an existing column:**
```sql
ALTER TABLE Student MODIFY Age SMALLINT NOT NULL;
```

**c) Drop a column:**
```sql
ALTER TABLE Student DROP COLUMN PhoneNumber;
```

**d) Add a constraint:**
```sql
ALTER TABLE Student ADD CONSTRAINT chk_age CHECK (Age >= 17);
```

**e) Rename a column (MySQL):**
```sql
ALTER TABLE Student RENAME COLUMN Email TO EmailAddress;
```

---

### 3. DROP Command
Permanently removes a table and all its data from the database.

```sql
DROP TABLE Courses;
DROP DATABASE CollegeDB;
```

> ⚠️ DROP cannot be rolled back. All data is permanently deleted.

---

### 4. TRUNCATE Command
Removes all rows from a table but keeps the table structure intact.

```sql
TRUNCATE TABLE Student;
```

| Feature | DROP | TRUNCATE |
|---------|------|----------|
| Removes structure | Yes | No |
| Removes data | Yes | Yes |
| Rollback possible | No | No |
| Faster | No | Yes |

---

### 5. RENAME Command
Renames an existing table.

```sql
RENAME TABLE Student TO Students;
-- OR
ALTER TABLE Students RENAME TO StudentInfo;
```

---

### Summary Table of DDL Commands

| Command | Purpose | Example |
|---------|---------|---------|
| CREATE | Creates new table/DB | CREATE TABLE Student(...) |
| ALTER | Modifies table structure | ALTER TABLE Student ADD... |
| DROP | Deletes table/DB permanently | DROP TABLE Student |
| TRUNCATE | Removes all rows, keeps structure | TRUNCATE TABLE Student |
| RENAME | Renames a table | RENAME TABLE A TO B |

---

### Constraints Used in DDL

- **PRIMARY KEY** – Uniquely identifies each row
- **FOREIGN KEY** – Links two tables
- **NOT NULL** – Field cannot be empty
- **UNIQUE** – All values must be distinct
- **CHECK** – Enforces a condition
- **DEFAULT** – Assigns a default value

---

### Conclusion
DDL commands form the backbone of database schema management. They allow DBAs and developers to precisely define the structure of the data to be stored, enforce integrity constraints, and evolve the schema over time without losing data unnecessarily.

---

---

## Q2. Differentiate Entity Set and Attribute with Suitable Examples

### Introduction
In the Entity-Relationship (ER) model, the two fundamental building blocks are **Entities** and **Attributes**. Understanding the difference is crucial for designing a good database schema.

---

### Entity
An **Entity** is a real-world object or concept that has an independent existence and can be distinctly identified. It is anything about which data is stored in a database.

**Examples:**
- A **Student** in a college
- A **Book** in a library
- A **Bank Account** in a bank
- An **Employee** in a company

An **Entity Set** is a collection of similar entities that share the same properties.

**Example:** All students enrolled in a university form the entity set `Student`.

```
Entity Set: Student
{(101, Alice, CSE), (102, Bob, ECE), (103, Carol, MECH)}
```

---

### Attribute
An **Attribute** is a property or characteristic that describes an entity. Attributes hold the actual data values of an entity.

**Example:** For a `Student` entity, the attributes are:
- StudentID
- Name
- Age
- Department
- Email

---

### Types of Attributes

#### 1. Simple (Atomic) Attribute
Cannot be divided further.
> Example: `Age`, `StudentID`

#### 2. Composite Attribute
Can be divided into smaller sub-parts.
> Example: `Name` → (FirstName, MiddleName, LastName)
> `Address` → (Street, City, State, PinCode)

#### 3. Single-Valued Attribute
Holds only one value per entity.
> Example: `StudentID` — each student has exactly one ID.

#### 4. Multi-Valued Attribute
Can hold multiple values.
> Example: `PhoneNumber` — a student may have more than one phone number.
> Represented with **double ellipse** in ER diagram.

#### 5. Derived Attribute
Value can be computed from other attributes.
> Example: `Age` derived from `DateOfBirth`.
> Represented with **dashed ellipse** in ER diagram.

#### 6. Key Attribute
Uniquely identifies each entity in the entity set.
> Example: `StudentID` for Student entity.
> Represented with **underline** in ER diagram.

---

### Comparison Table: Entity Set vs Attribute

| Feature | Entity Set | Attribute |
|---------|-----------|-----------|
| Definition | Collection of similar entities | Property describing an entity |
| Representation | Rectangle in ER diagram | Ellipse in ER diagram |
| Independence | Exists independently | Depends on entity |
| Example | Student, Employee, Book | Name, Age, StudentID |
| Contains | Multiple instances | Single/multiple values |
| Can have relationships | Yes | No |

---

### ER Diagram Representation (Library Example)

```
         BookID (key)
            |
Title ---- Book ---- Author
            |
         Publisher
```

Here:
- **Book** = Entity
- **BookID, Title, Author, Publisher** = Attributes of Book entity
- All Books together = **Entity Set**

---

### Real-World Example: Hospital System

**Entity Sets:** Patient, Doctor, Ward

**Attributes of Patient:**
- PatientID *(Key Attribute)*
- Name *(Composite: FirstName + LastName)*
- DOB *(Simple)*
- Age *(Derived from DOB)*
- PhoneNumbers *(Multi-valued)*
- Address *(Composite)*

---

### Conclusion
Entity sets represent the "things" we store data about, while attributes represent the "details" about those things. A well-designed ER model correctly identifies all entities and their attributes before translating into relational tables, ensuring data integrity and minimal redundancy.

---

---

## Q3. Demonstrate Database Operations – Creating a Table and Retrieving Records Using SQL

### Introduction
SQL (Structured Query Language) is the standard language for interacting with relational databases. Database operations include creating tables (DDL), inserting data (DML), and retrieving records (DQL). This answer demonstrates all these with a practical example.

---

### Step 1: Create the Database and Table

```sql
-- Create Database
CREATE DATABASE CollegeDB;
USE CollegeDB;

-- Create Student Table
CREATE TABLE Student (
    StudentID   INT PRIMARY KEY AUTO_INCREMENT,
    Name        VARCHAR(50) NOT NULL,
    Age         INT,
    Department  VARCHAR(30),
    CGPA        DECIMAL(3,2),
    City        VARCHAR(30)
);
```

---

### Step 2: Insert Records (DML – INSERT)

```sql
INSERT INTO Student (Name, Age, Department, CGPA, City)
VALUES
('Alice',   20, 'CSE',  9.1, 'Chennai'),
('Bob',     21, 'ECE',  8.3, 'Mumbai'),
('Carol',   19, 'MECH', 7.5, 'Delhi'),
('David',   22, 'CSE',  8.8, 'Bangalore'),
('Eva',     20, 'IT',   9.4, 'Chennai'),
('Frank',   21, 'ECE',  6.9, 'Pune'),
('Grace',   23, 'CSE',  7.2, 'Mumbai');
```

---

### Step 3: Retrieve Records (DQL – SELECT)

**a) Retrieve all records:**
```sql
SELECT * FROM Student;
```

| StudentID | Name  | Age | Department | CGPA | City |
|-----------|-------|-----|------------|------|------|
| 1 | Alice | 20 | CSE | 9.10 | Chennai |
| 2 | Bob | 21 | ECE | 8.30 | Mumbai |
| 3 | Carol | 19 | MECH | 7.50 | Delhi |

**b) Retrieve specific columns:**
```sql
SELECT Name, Department, CGPA FROM Student;
```

**c) Retrieve with condition (WHERE):**
```sql
SELECT * FROM Student WHERE Department = 'CSE';
```

**d) Retrieve with multiple conditions (AND / OR):**
```sql
SELECT * FROM Student WHERE Department = 'CSE' AND CGPA > 8.5;
SELECT * FROM Student WHERE City = 'Chennai' OR City = 'Mumbai';
```

**e) Retrieve with ORDER BY:**
```sql
SELECT * FROM Student ORDER BY CGPA DESC;
```

**f) Retrieve with LIMIT:**
```sql
SELECT * FROM Student ORDER BY CGPA DESC LIMIT 3;
```

**g) Retrieve using aggregate functions:**
```sql
SELECT Department, AVG(CGPA) AS Avg_CGPA FROM Student GROUP BY Department;
SELECT COUNT(*) AS Total_Students FROM Student;
SELECT MAX(CGPA) AS Highest, MIN(CGPA) AS Lowest FROM Student;
```

**h) Retrieve using HAVING:**
```sql
SELECT Department, AVG(CGPA) AS Avg_CGPA
FROM Student
GROUP BY Department
HAVING AVG(CGPA) > 8.0;
```

---

### Step 4: Update and Delete Records

**Update:**
```sql
UPDATE Student SET CGPA = 9.5 WHERE StudentID = 3;
```

**Delete:**
```sql
DELETE FROM Student WHERE CGPA < 7.0;
```

---

### Step 5: Retrieve Using Joins (Two Tables)

```sql
CREATE TABLE Courses (
    CourseID   INT PRIMARY KEY,
    CourseName VARCHAR(50),
    StudentID  INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

INSERT INTO Courses VALUES (1, 'DBMS', 1), (2, 'Networks', 2), (3, 'OS', 1);

-- JOIN Query
SELECT S.Name, S.Department, C.CourseName
FROM Student S
INNER JOIN Courses C ON S.StudentID = C.StudentID;
```

---

### Conclusion
SQL provides a rich set of commands to create, populate, and query databases efficiently. Using SELECT with WHERE, ORDER BY, GROUP BY, HAVING, and JOINs enables precise data retrieval for real-world applications like student management, inventory, banking, and more.

---

---

## Q4. Apply DDL, DML, and DCL Commands in a Banking Application

### Introduction
In database management, SQL commands are classified into three main categories:
- **DDL (Data Definition Language)** – Defines database structure
- **DML (Data Manipulation Language)** – Manipulates data
- **DCL (Data Control Language)** – Controls access and permissions

A **banking application** is an ideal scenario to demonstrate all three.

---

### DDL Commands – Creating Banking Tables

```sql
-- Create Database
CREATE DATABASE BankDB;
USE BankDB;

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID   INT PRIMARY KEY AUTO_INCREMENT,
    Name         VARCHAR(50) NOT NULL,
    Address      VARCHAR(100),
    Phone        VARCHAR(15) UNIQUE,
    Email        VARCHAR(50)
);

-- Create Account Table
CREATE TABLE Account (
    AccountNo    INT PRIMARY KEY,
    CustomerID   INT,
    AccountType  VARCHAR(20) CHECK (AccountType IN ('Savings','Current')),
    Balance      DECIMAL(12,2) DEFAULT 0.00,
    OpenDate     DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Transaction Table
CREATE TABLE Transactions (
    TransID     INT PRIMARY KEY AUTO_INCREMENT,
    AccountNo   INT,
    TxnType     VARCHAR(10) CHECK (TxnType IN ('Credit','Debit')),
    Amount      DECIMAL(12,2),
    TxnDate     DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountNo) REFERENCES Account(AccountNo)
);
```

**ALTER – Add new column:**
```sql
ALTER TABLE Customer ADD DateOfBirth DATE;
ALTER TABLE Account ADD BranchCode VARCHAR(10);
```

**DROP – Remove a table:**
```sql
DROP TABLE IF EXISTS TempLogs;
```

---

### DML Commands – Inserting, Updating, Deleting Records

**INSERT:**
```sql
INSERT INTO Customer (Name, Address, Phone, Email)
VALUES ('Ravi Kumar', 'Chennai', '9876543210', 'ravi@email.com');

INSERT INTO Account (AccountNo, CustomerID, AccountType, Balance, OpenDate)
VALUES (1001, 1, 'Savings', 50000.00, '2023-01-15');
```

**UPDATE – Credit/Debit operation:**
```sql
-- Deposit Rs. 10,000
UPDATE Account SET Balance = Balance + 10000 WHERE AccountNo = 1001;

-- Withdraw Rs. 5,000
UPDATE Account SET Balance = Balance - 5000
WHERE AccountNo = 1001 AND Balance >= 5000;
```

**INSERT Transaction log:**
```sql
INSERT INTO Transactions (AccountNo, TxnType, Amount)
VALUES (1001, 'Credit', 10000);

INSERT INTO Transactions (AccountNo, TxnType, Amount)
VALUES (1001, 'Debit', 5000);
```

**DELETE – Remove a customer record:**
```sql
DELETE FROM Customer WHERE CustomerID = 5;
```

**SELECT – View account balance:**
```sql
SELECT C.Name, A.AccountNo, A.AccountType, A.Balance
FROM Customer C
JOIN Account A ON C.CustomerID = A.CustomerID
WHERE A.AccountNo = 1001;
```

---

### DCL Commands – Access Control

**Create Users:**
```sql
CREATE USER 'bank_teller'@'localhost' IDENTIFIED BY 'Teller@123';
CREATE USER 'bank_manager'@'localhost' IDENTIFIED BY 'Manager@456';
CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'Audit@789';
```

**GRANT Permissions:**
```sql
-- Teller: Only view and insert transactions
GRANT SELECT, INSERT ON BankDB.Transactions TO 'bank_teller'@'localhost';
GRANT SELECT ON BankDB.Account TO 'bank_teller'@'localhost';

-- Manager: Full access to all tables
GRANT ALL PRIVILEGES ON BankDB.* TO 'bank_manager'@'localhost';

-- Auditor: Read-only access
GRANT SELECT ON BankDB.* TO 'auditor'@'localhost';
```

**REVOKE Permissions:**
```sql
-- Remove delete permission from teller
REVOKE DELETE ON BankDB.Transactions FROM 'bank_teller'@'localhost';
```

**Apply changes:**
```sql
FLUSH PRIVILEGES;
```

---

### Summary Table

| Category | Command | Purpose |
|----------|---------|---------|
| DDL | CREATE | Create tables |
| DDL | ALTER | Modify table structure |
| DDL | DROP | Delete table |
| DML | INSERT | Add new records |
| DML | UPDATE | Modify existing records |
| DML | DELETE | Remove records |
| DML | SELECT | Retrieve records |
| DCL | GRANT | Give user permissions |
| DCL | REVOKE | Remove user permissions |

---

### Conclusion
DDL, DML, and DCL commands together provide complete control over a database system. In a banking scenario, DDL defines the schema, DML handles daily transactions, and DCL ensures security and controlled access to sensitive financial data.

---

---

## Q5. What is Normalization? Explain 3NF, 4NF, and BCNF with Examples

### Introduction
**Normalization** is the process of organizing a relational database to reduce data redundancy and improve data integrity. It involves decomposing a table into smaller tables and defining relationships between them, following a set of rules called **Normal Forms (NF)**.

---

### Benefits of Normalization
1. **Eliminates redundancy** – Avoids storing the same data in multiple places
2. **Prevents update anomalies** – Ensures updating one record doesn't require updating many
3. **Prevents insertion anomalies** – Allows inserting data without needing unrelated data
4. **Prevents deletion anomalies** – Avoids losing important data when deleting a record
5. **Improves query performance** – Smaller, focused tables are faster to query
6. **Ensures data consistency** – Single source of truth for each piece of data

---

### Normal Forms Overview

| Normal Form | Requirement |
|-------------|-------------|
| 1NF | Atomic values, no repeating groups |
| 2NF | 1NF + No partial dependencies |
| 3NF | 2NF + No transitive dependencies |
| BCNF | 3NF + Every determinant is a candidate key |
| 4NF | BCNF + No multi-valued dependencies |

---

### Third Normal Form (3NF)

**Definition:** A relation is in 3NF if:
1. It is in 2NF
2. No non-prime attribute is transitively dependent on the primary key

**Transitive Dependency:** A → B → C, where A is the primary key and C is transitively dependent on A through B.

**Example – Violation:**

| StudentID | Name | ZipCode | City |
|-----------|------|---------|------|
| 101 | Alice | 600001 | Chennai |
| 102 | Bob | 400001 | Mumbai |

Here: `StudentID → ZipCode → City`
City is transitively dependent on StudentID through ZipCode. This violates 3NF.

**After 3NF Decomposition:**

*Student Table:*
| StudentID | Name | ZipCode |
|-----------|------|---------|
| 101 | Alice | 600001 |
| 102 | Bob | 400001 |

*Zip Table:*
| ZipCode | City |
|---------|------|
| 600001 | Chennai |
| 400001 | Mumbai |

---

### Boyce-Codd Normal Form (BCNF)

**Definition:** A relation is in BCNF if for every functional dependency X → Y, X must be a **superkey** (candidate key or primary key).

BCNF is a stronger version of 3NF. A relation can be in 3NF but not in BCNF.

**Example – Violation:**

Consider: `CourseEnrollment(StudentID, Course, Instructor)`

Functional Dependencies:
- `{StudentID, Course} → Instructor`
- `Instructor → Course` ← Instructor is not a superkey!

| StudentID | Course | Instructor |
|-----------|--------|------------|
| 101 | DBMS | Dr. Raj |
| 102 | OS | Dr. Priya |
| 101 | OS | Dr. Priya |

This violates BCNF because `Instructor → Course` and Instructor is not a superkey.

**After BCNF Decomposition:**

*InstructorCourse Table:*
| Instructor | Course |
|------------|--------|
| Dr. Raj | DBMS |
| Dr. Priya | OS |

*StudentInstructor Table:*
| StudentID | Instructor |
|-----------|------------|
| 101 | Dr. Raj |
| 102 | Dr. Priya |
| 101 | Dr. Priya |

---

### Fourth Normal Form (4NF)

**Definition:** A relation is in 4NF if it is in BCNF and has **no multi-valued dependencies** (MVD).

**Multi-Valued Dependency:** If A →→ B, it means for each value of A, there are multiple independent values of B.

**Example – Violation:**

`Employee(EmpID, Skill, Hobby)`

| EmpID | Skill | Hobby |
|-------|-------|-------|
| E01 | Java | Cricket |
| E01 | Java | Chess |
| E01 | Python | Cricket |
| E01 | Python | Chess |

Here:
- `EmpID →→ Skill` (employee can have multiple skills)
- `EmpID →→ Hobby` (employee can have multiple hobbies)

Skills and Hobbies are **independent** of each other → MVD violation → causes redundancy.

**After 4NF Decomposition:**

*EmpSkill Table:*
| EmpID | Skill |
|-------|-------|
| E01 | Java |
| E01 | Python |

*EmpHobby Table:*
| EmpID | Hobby |
|-------|-------|
| E01 | Cricket |
| E01 | Chess |

---

### Comparison: 3NF vs BCNF vs 4NF

| Feature | 3NF | BCNF | 4NF |
|---------|-----|------|-----|
| Eliminates transitive dependency | Yes | Yes | Yes |
| Every determinant is candidate key | Not required | Required | Required |
| Handles multi-valued dependencies | No | No | Yes |
| Lossless decomposition | Yes | Sometimes | Yes |
| Dependency preservation | Yes | May not | Yes |

---

### Conclusion
Normalization is essential for building a clean, efficient, and consistent database. 3NF removes transitive dependencies, BCNF strengthens 3NF by requiring every determinant to be a candidate key, and 4NF goes further to eliminate multi-valued dependencies. Each level builds upon the previous to ensure higher data integrity.

---

---

## Q6. Illustrate an ER Model for a Library Management System

### Introduction
An **Entity-Relationship (ER) Model** is a high-level conceptual data model used to describe the structure of a database. For a **Library Management System (LMS)**, the ER model captures all entities, their attributes, and their relationships.

---

### Entities and Their Attributes

#### 1. Member (Library Member)
- **MemberID** *(Primary Key)*
- Name *(Composite: FirstName, LastName)*
- Address *(Composite: Street, City, PinCode)*
- Phone
- Email
- MembershipType *(Regular / Premium)*
- MembershipExpiry

#### 2. Book
- **BookID** *(Primary Key)*
- Title
- ISBN *(Unique)*
- Publisher
- Year
- Genre
- TotalCopies
- AvailableCopies

#### 3. Author
- **AuthorID** *(Primary Key)*
- Name
- Nationality

#### 4. Staff
- **StaffID** *(Primary Key)*
- Name
- Role *(Librarian / Assistant)*
- Phone

#### 5. BorrowRecord
- **RecordID** *(Primary Key)*
- BorrowDate
- DueDate
- ReturnDate *(Nullable)*
- Fine *(Derived from ReturnDate and DueDate)*

---

### Relationships

| Relationship | Entities Involved | Cardinality |
|-------------|------------------|-------------|
| Writes | Author – Book | Many-to-Many |
| Borrows | Member – Book | Many-to-Many (through BorrowRecord) |
| Manages | Staff – BorrowRecord | One-to-Many |
| Has | Book – BorrowRecord | One-to-Many |

---

### ER Diagram (Text Representation)

```
[Author] ----<Writes>---- [Book] ----<Has>---- [BorrowRecord]
                            |                         |
                          <Borrows>              <Manages>
                            |                         |
                         [Member]                 [Staff]
```

---

### Detailed Attribute Listing (ER Style)

```
MEMBER
  ├── MemberID (PK, underlined)
  ├── Name
  │    ├── FirstName
  │    └── LastName
  ├── Address
  │    ├── Street
  │    ├── City
  │    └── PinCode
  ├── Phone (multi-valued)
  ├── Email
  └── MembershipType

BOOK
  ├── BookID (PK)
  ├── Title
  ├── ISBN (unique)
  ├── Publisher
  ├── Year
  └── Genre

AUTHOR
  ├── AuthorID (PK)
  ├── Name
  └── Nationality

BORROW_RECORD
  ├── RecordID (PK)
  ├── BorrowDate
  ├── DueDate
  ├── ReturnDate
  └── Fine (derived)
```

---

### Cardinality and Participation Constraints

- **Author – Book (Writes):** Many-to-Many (M:N)
  - One book can have multiple authors
  - One author can write multiple books
  - **Total participation** on Book side (every book must have at least one author)

- **Member – BorrowRecord (Borrows):** One-to-Many (1:N)
  - One member can borrow many books
  - **Partial participation** on Member (not every member borrows)

- **Staff – BorrowRecord (Manages):** One-to-Many (1:N)
  - One staff member manages many borrow records
  - **Total participation** on BorrowRecord

---

### SQL Schema from ER Model

```sql
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Nationality VARCHAR(30)
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE,
    Publisher VARCHAR(50),
    Year INT,
    Genre VARCHAR(30),
    AvailableCopies INT DEFAULT 0
);

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    MembershipType VARCHAR(20)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(30)
);

-- Many-to-Many: Author writes Book
CREATE TABLE Writes (
    AuthorID INT,
    BookID INT,
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

-- BorrowRecord links Member and Book
CREATE TABLE BorrowRecord (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    StaffID INT,
    BorrowDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    Fine DECIMAL(8,2) DEFAULT 0,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
```

---

### Conclusion
The ER model for the Library Management System clearly identifies 5 main entities: Member, Book, Author, Staff, and BorrowRecord. The relationships (Writes, Borrows, Manages) with proper cardinality constraints ensure the database design accurately reflects real-world library operations and forms a solid foundation for the relational schema.

---

---

## Q7. ACID Properties – Examine and Implement in Transaction Processing

### Introduction
**ACID** stands for **Atomicity, Consistency, Isolation, and Durability**. These are the four key properties that guarantee reliable transaction processing in a DBMS, especially when multiple transactions run concurrently or when system failures occur.

---

### a) Atomicity

**Definition:** A transaction is treated as a single unit — it either **completely succeeds** or **completely fails**. If any step in a transaction fails, all previous steps in the same transaction are rolled back.

**Example – Bank Transfer:**
```
Transaction T: Transfer Rs. 5000 from Account A to Account B
  Step 1: Deduct Rs. 5000 from Account A
  Step 2: Add Rs. 5000 to Account B
```

If Step 1 succeeds but Step 2 fails (due to a crash), the Rs. 5000 would simply disappear without Atomicity.

**SQL Implementation:**
```sql
START TRANSACTION;

UPDATE Account SET Balance = Balance - 5000 WHERE AccountNo = 1001;
UPDATE Account SET Balance = Balance + 5000 WHERE AccountNo = 1002;

-- If both succeed:
COMMIT;

-- If any step fails:
ROLLBACK;
```

With Atomicity, either both updates happen or neither does. Data remains consistent.

---

### b) Consistency

**Definition:** A transaction must bring the database from one **valid state to another valid state**, maintaining all defined rules, constraints, and integrity conditions.

**Example:**
```
Rule: Total money in the bank must remain constant during a transfer.
Before: Account A = Rs. 10,000 | Account B = Rs. 5,000 | Total = Rs. 15,000
After transfer of Rs. 3,000:
  Account A = Rs. 7,000 | Account B = Rs. 8,000 | Total = Rs. 15,000 ✓
```

**Constraints that enforce Consistency:**
```sql
-- Balance cannot go below 0
ALTER TABLE Account ADD CONSTRAINT chk_balance CHECK (Balance >= 0);

-- Referential integrity
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
```

If a transaction violates any constraint, it is aborted to maintain consistency.

---

### c) Isolation

**Definition:** Concurrent transactions execute **independently** of each other. The intermediate state of a transaction is not visible to other transactions until it is committed.

**Problem without Isolation – Dirty Read:**
```
T1: Read Balance (Rs. 10,000)
T1: Deduct Rs. 3,000 → Balance = Rs. 7,000 (not yet committed)
T2: Read Balance = Rs. 7,000 ← DIRTY READ (T1 not committed yet)
T1: ROLLBACK → Balance back to Rs. 10,000
T2: Works with wrong value!
```

**Isolation Levels in SQL:**

| Level | Dirty Read | Non-Repeatable Read | Phantom Read |
|-------|-----------|-------------------|--------------|
| READ UNCOMMITTED | Possible | Possible | Possible |
| READ COMMITTED | Prevented | Possible | Possible |
| REPEATABLE READ | Prevented | Prevented | Possible |
| SERIALIZABLE | Prevented | Prevented | Prevented |

```sql
-- Set isolation level
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;
SELECT Balance FROM Account WHERE AccountNo = 1001;
-- Other transactions cannot modify this row until COMMIT
COMMIT;
```

---

### d) Durability

**Definition:** Once a transaction is **committed**, its changes are **permanently saved** in the database — even if the system crashes immediately afterward.

**Implementation – Write-Ahead Logging (WAL):**
```
Before any change:
  Write to LOG file: "T1 updating Account 1001 Balance from 10000 to 7000"
Then apply change to Database.

If crash occurs:
  On restart → Read LOG → Re-apply committed transactions
             → Undo uncommitted transactions
```

**SQL Example:**
```sql
START TRANSACTION;
UPDATE Account SET Balance = 7000 WHERE AccountNo = 1001;
COMMIT;
-- This is now written to disk permanently.
-- Even a power failure cannot undo this.
```

---

### ACID in Banking Scenario (Combined)

```
Scenario: Customer transfers Rs. 10,000 from Account A (Acc: 1001) to Account B (Acc: 1002)

T1:
  BEGIN TRANSACTION
    Step 1: Deduct Rs. 10,000 from Acc 1001   ← Atomicity ensures this is paired with Step 2
    Step 2: Add Rs. 10,000 to Acc 1002
  COMMIT
  → Change is permanently saved                 ← Durability
  → No other transaction sees partial state      ← Isolation
  → Total balance unchanged                      ← Consistency
```

---

### Summary Table

| Property | Guarantees | Mechanism |
|----------|-----------|-----------|
| Atomicity | All-or-nothing execution | ROLLBACK / COMMIT |
| Consistency | Valid state before and after | Constraints, triggers |
| Isolation | No interference between transactions | Locks, MVCC |
| Durability | Committed data survives crashes | WAL, checkpoints |

---

### Conclusion
ACID properties are the foundation of reliable database systems. Atomicity prevents partial updates, Consistency ensures rule compliance, Isolation handles concurrency correctly, and Durability ensures data survival across failures. Together they make banking, e-commerce, and all critical applications trustworthy.

---

---

## Q8. Compare Conflict Serializability and View Serializability in DBMS

### Introduction
In a multi-user DBMS, **concurrency control** ensures that simultaneous transactions produce correct results. **Serializability** is the gold standard — a concurrent schedule is correct if its result is equivalent to some serial schedule. There are two types: **Conflict Serializability** and **View Serializability**.

---

### Key Definitions

**Transaction Schedule:** A sequence of operations (Read/Write) from multiple transactions.

**Serial Schedule:** Transactions execute one after another without interleaving.

**Serializable Schedule:** A concurrent schedule whose result equals some serial schedule.

---

### Conflict Serializability

**Definition:** A schedule is conflict serializable if it can be transformed into a serial schedule by swapping **non-conflicting operations**.

**Conflicting Operations:** Two operations conflict if:
1. They belong to **different transactions**
2. They access the **same data item**
3. At least **one is a Write**

**Conflict pairs:**
- Read-Write (R-W)
- Write-Read (W-R)
- Write-Write (W-W)

**Non-conflicting:** Read-Read (R-R)

**How to check – Precedence Graph (Serializability Graph):**
- Create a node for each transaction
- Draw edge Ti → Tj if Ti has a conflicting operation before Tj
- If graph has **no cycle** → Schedule is **conflict serializable**

**Example:**

```
Schedule S:
T1: R(A)       W(A)
T2:      R(A)       W(A)

Operations: R1(A), R2(A), W1(A), W2(A)

Conflicts:
  R2(A) before W1(A): T1 conflicts with T2 → edge T2 → T1? No...
  W1(A) before W2(A): T1 → T2
  R2(A) before W1(A): T2 → T1

Cycle detected: T1→T2→T1 → NOT conflict serializable
```

**Another Example (Serializable):**
```
T1: R(A), W(A)
T2:              R(B), W(B)

No shared data → No edges → No cycle → Conflict Serializable
Equivalent to serial schedule: T1, T2
```

---

### View Serializability

**Definition:** A schedule S is view serializable if it is view equivalent to some serial schedule S'.

**Two schedules are view equivalent if:**
1. **Initial Read:** If Ti reads initial value of X in S, Ti must read initial value of X in S'
2. **Updated Read:** If Ti reads value written by Tj in S, same must happen in S'
3. **Final Write:** If Ti performs the final write on X in S, Ti must perform final write in S'

View serializability is **broader** than conflict serializability — every conflict serializable schedule is view serializable, but not vice versa.

---

### Blind Write
A **blind write** is a write operation that is not preceded by a read of the same item by the same transaction.

View serializable schedules can contain blind writes, which conflict serializability cannot handle.

**Example:**
```
Schedule S:
T1: W(A)
T2:      W(A)
T3:           R(A)

T2 writes A (blind write), T3 reads A.
This cannot be transformed by swapping non-conflicting operations.
→ NOT conflict serializable
→ IS view serializable (equivalent to T1,T2,T3 serial schedule)
```

---

### Comparison Table

| Feature | Conflict Serializability | View Serializability |
|---------|------------------------|---------------------|
| Basis | Conflict equivalence | View equivalence |
| Testing method | Precedence graph (cycle detection) | Match initial read, updated read, final write |
| Complexity | Polynomial (O(n²)) | NP-complete |
| Scope | Narrower | Broader |
| Blind writes | Cannot handle | Can handle |
| Practical use | Widely used in real DBMSs | Theoretically important |
| Every CS schedule | Is also view serializable | May not be conflict serializable |
| False negatives | May reject valid schedules | Fewer false rejections |

---

### Precedence Graph Example (Step by Step)

```
Schedule: R1(A), W2(A), R1(B), W1(B), W2(B)

Conflicting pairs:
1. W2(A) after R1(A): R-W conflict → edge T1 → T2
2. W1(B) after R1(B): same transaction, skip
3. W2(B) after W1(B): W-W conflict → edge T1 → T2

Precedence graph: T1 → T2 (no cycle)
→ CONFLICT SERIALIZABLE
Equivalent serial schedule: T1, T2
```

---

### Conclusion
Conflict serializability is the practical and efficient standard used by most real-world database systems. View serializability is theoretically more permissive but computationally expensive to verify. Understanding both helps database designers choose appropriate concurrency control protocols.

---

---

## Q9. Examine Single-Level and Multi-Level Indexing for Large Databases

### Introduction
**Indexing** is a data structure technique used to quickly locate and access records in a database without scanning every row. It works like a book's index — instead of reading every page, you go directly to the relevant page. For large databases, choosing the right indexing strategy is critical for performance.

---

### Single-Level Indexing

**Definition:** A single-level index creates **one level** of index entries that directly point to the data blocks on disk.

#### Types of Single-Level Indexes

**1. Primary Index (Ordered Index)**
- Built on the **primary key** of an ordered file
- One index entry per data block (sparse index)
- Index entry: `(Key Value, Pointer to Block)`

**Example:**
```
Data File (sorted by EmployeeID):
Block 1: E001, E002, E003
Block 2: E004, E005, E006

Primary Index:
E001 → Block 1
E004 → Block 2
```

**2. Clustering Index**
- Built on a **non-key field** that orders the file
- One entry per distinct value of that field

```
Data sorted by Department:
CSE records → Block 1, Block 2
ECE records → Block 3

Clustering Index:
CSE → Block 1
ECE → Block 3
```

**3. Secondary Index (Dense Index)**
- Built on a **non-ordering field**
- One entry for every record (dense)
- Useful for search on non-key fields

```
Secondary Index on Name:
Alice → Block 3, Offset 2
Bob → Block 1, Offset 5
Carol → Block 2, Offset 1
```

---

### Limitations of Single-Level Indexing
- As database grows, the **index file itself becomes very large**
- Searching through a large index still requires many disk I/Os
- Inserting/deleting records requires reorganizing the index
- For millions of records, single-level index access is slow

---

### Multi-Level Indexing

**Definition:** Multi-level indexing builds an **index on the index** itself, creating a hierarchy of index levels. The lowest level points to data; each higher level points to the level below.

**Analogy:** Like a table of contents pointing to chapter summaries, which point to actual pages.

#### Structure:
```
Level 3 (Root Index) ── 1 block
     ↓
Level 2 (Intermediate Index) ── few blocks
     ↓
Level 1 (Base Index) ── many blocks
     ↓
Data File ── thousands of blocks
```

#### B+ Tree (Most Common Multi-Level Index)

A **B+ Tree** is a self-balancing multi-level index structure where:
- Internal nodes hold keys and pointers
- Leaf nodes hold data pointers and are linked
- All records are accessible from leaf nodes

**Properties:**
- Order `p`: each node has at most `p` pointers
- Balanced: all leaf nodes at same level
- Efficient: O(log n) search, insert, delete

**Example B+ Tree (Order 3):**
```
          [30 | 60]
         /    |    \
    [10|20] [40|50] [70|80]
       ↓       ↓       ↓
   Data     Data     Data
```

**Search for 40:**
1. Start at root: 40 > 30, 40 < 60 → go middle
2. At [40|50]: found 40 → access data block
3. Only **2 disk I/Os** instead of scanning all records

---

### Performance Comparison

For a database with **1,000,000 records**, block size = 512 bytes, index entry = 10 bytes:

**Single-Level Index:**
- Index size = 1,000,000 × 10 = 10,000,000 bytes
- Blocks needed = ~20,000 blocks
- Binary search: log₂(20,000) ≈ **15 disk I/Os**

**Multi-Level B+ Tree (Order 100):**
- Level 1: 1,000,000 leaves
- Level 2: 10,000 nodes
- Level 3: 100 nodes
- Level 4: 1 root
- Search depth: **4 disk I/Os**

| Metric | Single-Level | Multi-Level (B+ Tree) |
|--------|-------------|----------------------|
| Search time | O(log n) on index | O(log_p n) – much faster |
| Disk I/Os (1M records) | ~15 | ~4 |
| Index update | Costly reorganization | Self-balancing |
| Storage overhead | Low-medium | Medium |
| Range queries | Slow | Very fast (linked leaves) |
| Practical use | Small-medium DBs | Large production DBs |

---

### Conclusion
Single-level indexing is simple and works well for small databases. However, for large-scale systems with millions of records, **multi-level indexing (especially B+ Trees)** is significantly more efficient, offering logarithmic search time with minimal disk I/Os. All modern RDBMS systems (MySQL, PostgreSQL, Oracle) use B+ Trees as the default indexing mechanism.

---

---

## Q10. SQL Queries Using IN, LIKE, BETWEEN, and EXISTS Operators

### Introduction
SQL provides powerful operators to filter and retrieve data precisely. The **IN, LIKE, BETWEEN, and EXISTS** operators are widely used in WHERE clauses to apply various conditions on data retrieval.

---

### Setup: Sample Tables

```sql
CREATE TABLE Employee (
    EmpID     INT PRIMARY KEY,
    Name      VARCHAR(50),
    Dept      VARCHAR(30),
    Salary    DECIMAL(10,2),
    City      VARCHAR(30),
    JoinDate  DATE
);

INSERT INTO Employee VALUES
(1, 'Alice',   'HR',      55000, 'Chennai',   '2020-01-15'),
(2, 'Bob',     'IT',      75000, 'Mumbai',    '2019-06-01'),
(3, 'Carol',   'Finance', 65000, 'Delhi',     '2021-03-10'),
(4, 'David',   'IT',      85000, 'Bangalore', '2018-09-20'),
(5, 'Eva',     'HR',      50000, 'Chennai',   '2022-07-01'),
(6, 'Frank',   'Finance', 70000, 'Mumbai',    '2020-11-05'),
(7, 'Grace',   'IT',      90000, 'Delhi',     '2017-04-15');

CREATE TABLE Department (
    DeptName  VARCHAR(30) PRIMARY KEY,
    ManagerID INT,
    Budget    DECIMAL(12,2)
);

INSERT INTO Department VALUES
('IT', 4, 500000),
('HR', 1, 200000),
('Finance', 6, 300000);
```

---

### 1. IN Operator

**Purpose:** Checks if a value matches any value in a list or subquery.

**Syntax:**
```sql
column_name IN (value1, value2, ...)
column_name IN (SELECT ...)
```

**Example 1 – Employees in specific departments:**
```sql
SELECT * FROM Employee
WHERE Dept IN ('IT', 'Finance');
```

**Result:** Returns Alice, Bob, Carol, David, Frank, Grace (not HR employees)

**Example 2 – NOT IN:**
```sql
SELECT Name, Dept FROM Employee
WHERE City NOT IN ('Chennai', 'Mumbai');
```
Returns employees from Delhi and Bangalore only.

**Example 3 – IN with Subquery:**
```sql
SELECT Name, Salary FROM Employee
WHERE Dept IN (
    SELECT DeptName FROM Department WHERE Budget > 250000
);
```

---

### 2. LIKE Operator

**Purpose:** Pattern matching using wildcards.
- `%` → matches zero or more characters
- `_` → matches exactly one character

**Syntax:**
```sql
column_name LIKE 'pattern'
```

**Example 1 – Names starting with 'A':**
```sql
SELECT * FROM Employee WHERE Name LIKE 'A%';
```
Returns: Alice

**Example 2 – Names ending with 'l':**
```sql
SELECT * FROM Employee WHERE Name LIKE '%l';
```
Returns: Carol

**Example 3 – Names containing 'ra':**
```sql
SELECT * FROM Employee WHERE Name LIKE '%ra%';
```
Returns: Grace

**Example 4 – Names with exactly 3 characters:**
```sql
SELECT * FROM Employee WHERE Name LIKE '___';
```
Returns: Bob, Eva

**Example 5 – Cities starting with any char then 'elhi':**
```sql
SELECT * FROM Employee WHERE City LIKE '_elhi';
```
Returns: Delhi employees

**Example 6 – NOT LIKE:**
```sql
SELECT Name FROM Employee WHERE Name NOT LIKE 'A%';
```
Returns all employees whose names don't start with 'A'.

---

### 3. BETWEEN Operator

**Purpose:** Selects values within a given range (inclusive of both endpoints).

**Syntax:**
```sql
column_name BETWEEN value1 AND value2
```

**Example 1 – Salary between 60,000 and 80,000:**
```sql
SELECT Name, Salary FROM Employee
WHERE Salary BETWEEN 60000 AND 80000;
```
Returns: Carol (65000), Bob (75000), Frank (70000)

**Example 2 – Employees who joined between two dates:**
```sql
SELECT Name, JoinDate FROM Employee
WHERE JoinDate BETWEEN '2019-01-01' AND '2021-12-31';
```
Returns: Bob, Alice, Carol, Frank

**Example 3 – NOT BETWEEN:**
```sql
SELECT Name, Salary FROM Employee
WHERE Salary NOT BETWEEN 60000 AND 80000;
```
Returns: Alice (55000), Eva (50000), David (85000), Grace (90000)

**Example 4 – Combined with AND:**
```sql
SELECT Name, Dept, Salary FROM Employee
WHERE Salary BETWEEN 50000 AND 70000
AND Dept = 'HR';
```

---

### 4. EXISTS Operator

**Purpose:** Returns TRUE if a subquery returns at least one row. Used to check the existence of records satisfying a condition.

**Syntax:**
```sql
WHERE EXISTS (SELECT 1 FROM table WHERE condition)
```

**Example 1 – Find employees whose department has a budget > 400,000:**
```sql
SELECT E.Name, E.Dept
FROM Employee E
WHERE EXISTS (
    SELECT 1 FROM Department D
    WHERE D.DeptName = E.Dept
    AND D.Budget > 400000
);
```
Returns: Bob, David, Grace (all IT dept employees, since IT budget = 500,000)

**Example 2 – NOT EXISTS – Departments with no high earners:**
```sql
SELECT DeptName FROM Department D
WHERE NOT EXISTS (
    SELECT 1 FROM Employee E
    WHERE E.Dept = D.DeptName
    AND E.Salary > 80000
);
```
Returns: HR, Finance (no employee earns > 80,000 in those depts)

**Example 3 – Find employees who are also managers:**
```sql
SELECT E.Name FROM Employee E
WHERE EXISTS (
    SELECT 1 FROM Department D
    WHERE D.ManagerID = E.EmpID
);
```

---

### Summary Table

| Operator | Purpose | Example |
|----------|---------|---------|
| IN | Match any value in list/subquery | `WHERE Dept IN ('IT','HR')` |
| NOT IN | Exclude values in list | `WHERE City NOT IN ('Delhi')` |
| LIKE | Pattern matching | `WHERE Name LIKE 'A%'` |
| NOT LIKE | Exclude pattern matches | `WHERE Name NOT LIKE '%ra%'` |
| BETWEEN | Range check (inclusive) | `WHERE Salary BETWEEN 50000 AND 80000` |
| NOT BETWEEN | Outside range | `WHERE Age NOT BETWEEN 20 AND 25` |
| EXISTS | Check if subquery has rows | `WHERE EXISTS (SELECT ...)` |
| NOT EXISTS | Check if subquery has no rows | `WHERE NOT EXISTS (SELECT ...)` |

---

### Conclusion
IN, LIKE, BETWEEN, and EXISTS are essential SQL operators that enable powerful and flexible data retrieval. IN simplifies multiple OR conditions, LIKE enables pattern matching, BETWEEN provides readable range filters, and EXISTS enables existence checks with correlated subqueries. Mastering these operators is fundamental to writing efficient SQL queries.

---

---

## Q11. Functional Dependency and Minimal Cover

### Introduction
**Functional Dependency (FD)** is a relationship between attributes in a relation. If X → Y, then for every value of X there is exactly one value of Y. **Minimal Cover (Canonical Cover)** is the smallest equivalent set of functional dependencies with no redundancies.

---

### Given Set of Functional Dependencies:
**E = {B → A, D → A, AB → D}**

---

### Steps to Find Minimal Cover

The standard algorithm for finding minimal cover involves 3 steps:
1. **Simplify right-hand sides** (make each FD have single attribute on RHS)
2. **Remove extraneous attributes** from left-hand sides
3. **Remove redundant FDs**

---

### Step 1: Simplify Right-Hand Sides

All given FDs already have single attributes on the RHS:
- B → A ✓
- D → A ✓
- AB → D ✓

No changes needed in this step.

**Current set: {B → A, D → A, AB → D}**

---

### Step 2: Remove Extraneous Attributes from LHS

Check each FD with multiple attributes on LHS. Only **AB → D** qualifies.

**Check if A is extraneous in AB → D:**
- Remove A: Does B → D follow from the remaining FDs?
- Compute B⁺ (closure of B) using {B → A, D → A, AB → D}:
  - B⁺ = {B}
  - B → A: add A → B⁺ = {B, A}
  - AB → D: B⁺ contains both A and B → add D → B⁺ = {B, A, D}
  - D → A: already have A
  - Final B⁺ = {A, B, D}
- D ∈ B⁺ → Yes! B alone can determine D
- **A is extraneous in AB → D**
- Replace AB → D with **B → D**

**Updated set: {B → A, D → A, B → D}**

**Check if B is extraneous in B → D (now checking the updated FD):**
- This is already a single-attribute LHS, skip.

---

### Step 3: Remove Redundant FDs

Check each FD to see if it can be derived from the others.

**Check if B → A is redundant:**
- Remove B → A from the set: {D → A, B → D}
- Compute B⁺ using {D → A, B → D}:
  - B⁺ = {B}
  - B → D: add D → B⁺ = {B, D}
  - D → A: add A → B⁺ = {B, D, A}
- A ∈ B⁺ → B → A can be derived!
- **B → A is redundant** → Remove it

**Updated set: {D → A, B → D}**

**Check if D → A is redundant:**
- Remove D → A: {B → D}
- Compute D⁺ using {B → D}:
  - D⁺ = {D} (nothing can determine A from D without D → A)
- A ∉ D⁺ → D → A is **NOT redundant** → Keep it

**Check if B → D is redundant:**
- Remove B → D: {D → A}
- Compute B⁺ using {D → A}:
  - B⁺ = {B} (D → A doesn't help since we don't have B → D)
- D ∉ B⁺ → B → D is **NOT redundant** → Keep it

---

### Final Minimal Cover

**Minimal Cover of E = {B → D, D → A}**

---

### Verification
- B → D (direct)
- B → A (via B → D → A) ✓ Covers original B → A
- D → A (direct) ✓ Covers original D → A
- AB → D: Since B → D, AB → D is covered ✓

All original FDs are derivable from the minimal cover.

---

### Summary of Steps

| Step | Action | Result |
|------|--------|--------|
| Initial | Given FDs | {B→A, D→A, AB→D} |
| Step 1 | Simplify RHS | No change needed |
| Step 2 | Remove extraneous A from AB→D | Replace with B→D |
| Step 2 result | | {B→A, D→A, B→D} |
| Step 3 | Remove redundant B→A | {D→A, B→D} |
| **Final** | **Minimal Cover** | **{B→D, D→A}** |

---

### Conclusion
The minimal cover of E = {B → A, D → A, AB → D} is **{B → D, D → A}**. This is the most compact, non-redundant set of FDs that preserves all the original dependencies. Minimal covers are essential in normalization (especially 3NF synthesis) to minimize schema complexity.

---

---

## Q12. NoSQL Models for E-Commerce – Key-Value, Document, Column-Family, Graph

### Introduction
**NoSQL (Not Only SQL)** databases are non-relational databases designed for large-scale, flexible, and high-performance data storage. Unlike RDBMS, NoSQL databases do not require a fixed schema and are ideal for unstructured or semi-structured data. For an **e-commerce application** storing product details, reviews, and ratings, a NoSQL model is an excellent choice.

---

### Four NoSQL Models

#### 1. Key-Value Store
**Structure:** Data stored as simple key-value pairs.
**Best for:** Session management, shopping carts, caching.
**Examples:** Redis, DynamoDB, Riak

```
Key: "cart:user123"
Value: {"items": [{"productID": "P001", "qty": 2}, {"productID": "P005", "qty": 1}]}

Key: "session:abc456"
Value: {"userID": "U123", "loginTime": "2024-01-10 10:30"}
```

**Advantages:** Extremely fast (O(1) lookups), simple structure
**Limitations:** No complex queries, no relationships between data

---

#### 2. Document Store (Best for E-Commerce)
**Structure:** Data stored as JSON/BSON documents. Each document is self-contained.
**Best for:** Product catalogs, user profiles, order details.
**Examples:** MongoDB, CouchDB, Firebase Firestore

**Product Document:**
```json
{
  "_id": "P001",
  "name": "Samsung Galaxy S24",
  "category": "Electronics",
  "brand": "Samsung",
  "price": 79999,
  "specifications": {
    "RAM": "8GB",
    "Storage": "256GB",
    "Camera": "50MP"
  },
  "tags": ["smartphone", "android", "5G"],
  "stock": 150,
  "images": ["img1.jpg", "img2.jpg"]
}
```

**Reviews Document:**
```json
{
  "_id": "R1001",
  "productID": "P001",
  "userID": "U456",
  "rating": 4.5,
  "title": "Excellent phone!",
  "review": "Great camera and battery life. Highly recommended.",
  "date": "2024-01-05",
  "helpful_votes": 23,
  "verified_purchase": true
}
```

**MongoDB Queries:**
```javascript
// Find all electronics under Rs. 50,000
db.products.find({ category: "Electronics", price: { $lt: 50000 } })

// Get average rating for a product
db.reviews.aggregate([
  { $match: { productID: "P001" } },
  { $group: { _id: "$productID", avgRating: { $avg: "$rating" } } }
])
```

---

#### 3. Column-Family Store
**Structure:** Data organized into rows and column families (groups of related columns).
**Best for:** Analytics, product inventory, time-series data.
**Examples:** Apache Cassandra, HBase

```
Row Key: "P001"
Column Family: product_info
  name: "Samsung Galaxy S24"
  category: "Electronics"
  price: 79999

Column Family: ratings
  avg_rating: 4.5
  total_reviews: 234
  five_star: 120
  four_star: 80
```

**Cassandra CQL:**
```sql
CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    name TEXT,
    category TEXT,
    price DECIMAL
);

CREATE TABLE ratings_by_product (
    product_id TEXT,
    user_id TEXT,
    rating FLOAT,
    review TEXT,
    review_date TIMESTAMP,
    PRIMARY KEY (product_id, user_id)
);
```

---

#### 4. Graph Database
**Structure:** Data stored as nodes and edges (relationships).
**Best for:** Product recommendations, social shopping, "customers also bought" features.
**Examples:** Neo4j, Amazon Neptune

```
Nodes: User, Product, Category, Brand
Edges: PURCHASED, REVIEWED, BELONGS_TO, SIMILAR_TO

(User: Alice) --[PURCHASED]--> (Product: Galaxy S24)
(User: Alice) --[REVIEWED {rating: 4.5}]--> (Product: Galaxy S24)
(Product: Galaxy S24) --[BELONGS_TO]--> (Category: Electronics)
(Product: Galaxy S24) --[SIMILAR_TO]--> (Product: iPhone 15)
```

**Neo4j Cypher Query:**
```cypher
// Find products similar to what Alice bought
MATCH (u:User {name:"Alice"})-[:PURCHASED]->(p:Product)
      -[:SIMILAR_TO]->(rec:Product)
WHERE NOT (u)-[:PURCHASED]->(rec)
RETURN rec.name AS Recommendation
```

---

### Best Choice for E-Commerce: Document + Key-Value Hybrid

| Feature | Key-Value | Document | Column-Family | Graph |
|---------|-----------|----------|--------------|-------|
| Product catalog | Poor | **Excellent** | Good | Poor |
| Reviews & ratings | Poor | **Excellent** | Good | Good |
| Shopping cart | **Excellent** | Good | Poor | Poor |
| Recommendations | Poor | Poor | Poor | **Excellent** |
| Analytics | Poor | Good | **Excellent** | Poor |
| Flexibility | Low | **High** | Medium | Medium |

---

### Recommended Architecture

```
E-Commerce Application
│
├── MongoDB (Document) ──── Products, Reviews, Orders, Users
├── Redis (Key-Value) ────── Sessions, Shopping Carts, Cache
├── Cassandra (Column) ───── Analytics, Inventory tracking
└── Neo4j (Graph) ────────── Recommendations, Similar products
```

---

### Conclusion
For an e-commerce application storing product details, reviews, and ratings in flexible formats, the **Document Store model (MongoDB)** is the most suitable primary choice due to its schema flexibility, nested document support, and powerful query capabilities. A hybrid approach combining Redis for caching and Neo4j for recommendations creates a highly scalable, performant e-commerce backend.

---

---

## Q13. Deadlock Resolution Techniques in DBMS

### Introduction
A **deadlock** occurs when two or more transactions are waiting indefinitely for each other to release locks on resources. This creates a cycle of dependencies where no transaction can proceed.

---

### Deadlock Example

```
Transaction T1:
  Lock(A) → Request Lock(B) → WAITING for T2

Transaction T2:
  Lock(B) → Request Lock(A) → WAITING for T1

Deadlock! T1 waits for T2, T2 waits for T1 → Neither can proceed.
```

---

### Deadlock Prevention Techniques

Prevention ensures that conditions for deadlock never arise.

#### 1. Wait-Die Scheme (Non-Preemptive)
- Based on transaction timestamps
- If Ti is **older** than Tj: Ti **waits**
- If Ti is **younger** than Tj: Ti **dies** (rollback and restart)

```
T1 (older, timestamp=5) wants lock held by T2 (newer, timestamp=10)
→ T1 waits

T2 (newer, timestamp=10) wants lock held by T1 (older, timestamp=5)
→ T2 dies (rolled back)
```

#### 2. Wound-Wait Scheme (Preemptive)
- If Ti is **older** than Tj: Ti **wounds** Tj (forces Tj to rollback)
- If Ti is **younger** than Tj: Ti **waits**

#### 3. No Preemption
- A transaction must release all locks before requesting new ones
- Prevents circular wait

#### 4. Resource Ordering
- Assign a global ordering to all resources
- Transactions must request resources in that order
- Eliminates circular wait

---

### Deadlock Detection Techniques

Allow deadlocks to occur, then detect and resolve them.

#### 1. Wait-For Graph
- Nodes = Transactions
- Edge Ti → Tj means Ti is waiting for Tj to release a lock
- If the graph contains a **cycle** → Deadlock detected

```
Wait-For Graph:
T1 → T2 → T3 → T1   ← Cycle detected! Deadlock!
```

**Detection Algorithm:**
1. Maintain the wait-for graph
2. Periodically run cycle-detection (DFS)
3. If cycle found → choose a victim transaction → rollback

#### 2. Timeout-Based Detection
- If a transaction waits longer than a threshold time → assume deadlock → rollback the transaction
- Simple but may rollback non-deadlocked transactions

---

### Deadlock Recovery

Once a deadlock is detected, one transaction must be rolled back (**victim selection**).

**Victim Selection Criteria:**
- Minimum rollback cost (transactions that did least work)
- Minimum number of locks held
- Oldest or newest transaction
- Transactions with lowest priority

**Recovery Steps:**
1. Detect the cycle in wait-for graph
2. Select victim transaction
3. Rollback the victim (using undo logs)
4. Release all locks held by victim
5. Restart the victim transaction later

---

### Starvation Prevention
A transaction repeatedly chosen as victim may never complete (**starvation**).

**Solution:** Include the number of times a transaction has been rolled back in victim selection criteria — give priority to frequently rolled-back transactions.

---

### Comparison Table

| Technique | Type | Approach | Overhead | Use Case |
|-----------|------|----------|----------|---------|
| Wait-Die | Prevention | Timestamp | Low | High contention |
| Wound-Wait | Prevention | Timestamp | Medium | High contention |
| Resource Ordering | Prevention | Ordering | Low | Predictable access |
| Wait-For Graph | Detection | Graph | Medium | General purpose |
| Timeout | Detection | Timer | Very Low | Simple systems |

---

### Conclusion
Deadlock is an inherent challenge in concurrent database systems. Prevention techniques like Wait-Die and Wound-Wait avoid deadlocks using timestamps, while detection-based approaches using wait-for graphs identify and resolve deadlocks after they occur. Modern RDBMS like MySQL, Oracle, and PostgreSQL use wait-for graph detection combined with victim rollback for efficient deadlock resolution.

---

---

## Q14. Log-Based Recovery Techniques in DBMS

### Introduction
**Recovery management** is a critical component of DBMS that restores the database to a consistent state after a system failure (crash, power failure, disk errors). **Log-based recovery** maintains a sequential record (log) of all database modifications, enabling recovery from failures.

---

### Types of Failures
1. **Transaction failure** – Logic error or deadlock
2. **System crash** – OS failure, power outage
3. **Disk failure** – Physical damage to storage

---

### The Log File
A **log** (also called journal) is an append-only file that records every database operation before it is applied to the database.

**Log Record Types:**
```
<T1, Start>                     -- Transaction T1 begins
<T1, A, 500, 300>               -- T1 changes A from 500 to 300
<T1, B, 200, 500>               -- T1 changes B from 200 to 500
<T1, Commit>                    -- T1 commits successfully
<T2, Start>
<T2, C, 1000, 800>
<T2, Abort>                     -- T2 aborted
```

Format: `<Transaction, Item, Old Value, New Value>`

---

### Write-Ahead Logging (WAL) Protocol

**Rule:** Before any data block is written to disk, its log record must be written to stable storage first.

This ensures that in case of a crash, the log always contains enough information to redo or undo changes.

---

### Recovery Techniques

#### 1. Deferred Update (No-Undo / Redo)
- Database is not updated until a transaction commits
- Log records are written first; updates applied only after commit
- On failure: Simply ignore uncommitted transactions (no undo needed)
- On recovery: Redo committed transactions from log

```
Log:
<T1, Start>
<T1, A, -, 300>    -- old value not stored (deferred)
<T1, Commit>       -- now apply A=300 to database

If crash before commit → A not changed → No undo needed
```

#### 2. Immediate Update (Undo / Redo)
- Database updated as operations execute (before commit)
- Log records include **old and new values**
- On failure: **Undo** uncommitted transactions, **Redo** committed ones

**Recovery Process:**
```
Log at crash:
<T1, Start>
<T1, A, 500, 300>  ← T1 changed A
<T1, Commit>       ← T1 committed ✓
<T2, Start>
<T2, B, 200, 500>  ← T2 changed B
*** CRASH ***       ← T2 not committed ✗

Recovery:
  REDO T1: Set A = 300
  UNDO T2: Set B = 200 (restore old value)
```

---

### Checkpoint-Based Recovery

**Problem:** Reading entire log from beginning is slow.

**Checkpoint:** Periodically write all dirty (modified) blocks to disk and record a checkpoint in the log.

```
Log with Checkpoint:
<T1, Start>
<T1, A, 500, 300>
<T1, Commit>
<CHECKPOINT {T2}>   ← At this point, T1 is already on disk
<T2, Start>
<T2, B, 200, 500>
*** CRASH ***

Recovery:
  Start from CHECKPOINT
  T2 was active at checkpoint → UNDO T2
  T1 already checkpointed → No redo needed
```

**Steps with Checkpoint:**
1. On crash, find the most recent checkpoint
2. Identify all active transactions at checkpoint time
3. Scan log forward from checkpoint: build REDO list (committed after CP) and UNDO list (not committed)
4. Apply REDO operations forward
5. Apply UNDO operations backward

---

### Recovery Algorithm (ARIES)

**ARIES (Algorithm for Recovery and Isolation Exploiting Semantics)** is used by most modern RDBMS (DB2, SQL Server, PostgreSQL):

**Phase 1 – Analysis:** Scan log from last checkpoint → determine dirty pages and active transactions at crash time.

**Phase 2 – Redo:** Redo all operations from log (even those that might be undone later) to bring database to crash state.

**Phase 3 – Undo:** Undo all operations of transactions that were active at crash (not committed).

---

### Summary

| Technique | When Updates Applied | Undo Needed | Redo Needed |
|-----------|---------------------|------------|------------|
| Deferred Update | After commit | No | Yes |
| Immediate Update | Before commit | Yes | Yes |
| Shadow Paging | After commit | No | No |
| ARIES | Before commit | Yes | Yes |

---

### Conclusion
Log-based recovery is the industry standard for ensuring database durability. By maintaining detailed logs with old and new values, and using checkpoints to reduce recovery time, DBMS can restore to a consistent state after any failure. The WAL protocol, combined with undo/redo operations, forms the backbone of transaction recovery in modern database systems.

---

---

## Q15. RAID Levels – Comparison Based on Redundancy, Performance, and Cost

### Introduction
**RAID (Redundant Array of Independent Disks)** is a storage technology that combines multiple physical disk drives into one logical unit to improve performance, reliability, or both. Different RAID levels offer different trade-offs between redundancy, performance, and storage cost.

---

### RAID 0 – Striping (No Redundancy)

**Method:** Data is split (striped) across multiple disks in blocks.

```
Data: [A1][A2][A3][A4]
Disk 1: [A1][A3]
Disk 2: [A2][A4]
```

- **Redundancy:** None — if one disk fails, all data is lost
- **Read Performance:** Excellent (parallel reads from all disks)
- **Write Performance:** Excellent (parallel writes)
- **Storage Efficiency:** 100% (no overhead)
- **Minimum Disks:** 2
- **Use Case:** Video editing, gaming (speed needed, no critical data)

---

### RAID 1 – Mirroring

**Method:** Data is duplicated (mirrored) across two disks.

```
Disk 1: [A1][A2][A3]  (original)
Disk 2: [A1][A2][A3]  (mirror)
```

- **Redundancy:** Excellent — can survive 1 disk failure
- **Read Performance:** Good (can read from either disk)
- **Write Performance:** Slower (must write to both disks)
- **Storage Efficiency:** 50% (half wasted on mirror)
- **Minimum Disks:** 2
- **Use Case:** OS drives, critical databases

---

### RAID 5 – Striping with Distributed Parity

**Method:** Data striped across disks; parity information distributed across all disks.

```
Disk 1: [A1][B1][C1][P_D]
Disk 2: [A2][B2][P_C][D2]
Disk 3: [A3][P_B][C3][D3]
Disk 4: [P_A][B4][C4][D4]
```

- **Redundancy:** Good — can survive 1 disk failure
- **Read Performance:** Excellent
- **Write Performance:** Moderate (parity calculation overhead)
- **Storage Efficiency:** (n-1)/n × 100%  e.g., 4 disks → 75%
- **Minimum Disks:** 3
- **Use Case:** File servers, email servers, NAS systems

---

### RAID 6 – Striping with Double Distributed Parity

**Method:** Like RAID 5 but with two parity blocks per stripe.

- **Redundancy:** Excellent — can survive **2 disk failures** simultaneously
- **Read Performance:** Good
- **Write Performance:** Slower (two parity calculations)
- **Storage Efficiency:** (n-2)/n × 100%
- **Minimum Disks:** 4
- **Use Case:** Large storage arrays, cloud storage, critical data

---

### RAID 10 (1+0) – Mirroring + Striping

**Method:** Combines RAID 1 (mirroring) and RAID 0 (striping).

```
RAID 0 stripe across →
  [Mirror Pair 1]     [Mirror Pair 2]
  Disk1 | Disk2       Disk3 | Disk4
   A1   |  A1          A2   |  A2
   B1   |  B1          B2   |  B2
```

- **Redundancy:** Excellent — can survive multiple failures (one per mirror pair)
- **Read Performance:** Excellent
- **Write Performance:** Excellent
- **Storage Efficiency:** 50%
- **Minimum Disks:** 4
- **Use Case:** High-performance databases, OLTP systems

---

### Comparison Table

| RAID Level | Redundancy | Read Speed | Write Speed | Storage Efficiency | Min Disks | Use Case |
|-----------|-----------|------------|-------------|-------------------|-----------|---------|
| RAID 0 | None | Excellent | Excellent | 100% | 2 | Temp data, gaming |
| RAID 1 | 1 failure | Good | Moderate | 50% | 2 | OS, critical files |
| RAID 5 | 1 failure | Excellent | Moderate | (n-1)/n | 3 | File servers |
| RAID 6 | 2 failures | Good | Slow | (n-2)/n | 4 | Archives, cloud |
| RAID 10 | Multiple | Excellent | Excellent | 50% | 4 | Databases, OLTP |

---

### Cost Analysis

```
RAID 0: Low cost – no extra disks for redundancy
RAID 1: High cost – 50% storage wasted
RAID 5: Medium cost – only 1 disk worth wasted on parity
RAID 6: Medium-High cost – 2 disks wasted on parity
RAID 10: High cost – 50% storage wasted (like RAID 1)
```

---

### Organizational Use Cases

| Organization | RAID Choice | Reason |
|-------------|------------|--------|
| Banking | RAID 10 | High performance + high reliability |
| Web server | RAID 5 | Balance of speed, space, redundancy |
| Video studio | RAID 0 | Maximum speed, temporary data |
| Hospital records | RAID 6 | Critical data, can't afford 2-disk failure |
| Small business | RAID 1 | Simple, reliable, easy recovery |

---

### Conclusion
RAID provides essential data redundancy and performance improvements for organizational storage systems. RAID 0 maximizes performance with no fault tolerance, RAID 1 and RAID 10 offer high reliability with speed, RAID 5 balances efficiency and redundancy for most use cases, and RAID 6 provides maximum fault tolerance for critical data. Choosing the right RAID level depends on the organization's specific requirements for speed, reliability, and budget.

---

*End of DBMS 16-Mark Answer Guide*
*All the best for your exam! 🎯*
