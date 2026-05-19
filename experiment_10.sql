/*
==========================================================================
 Experiment 10 — Create and Execute PL/SQL Procedures, Functions, and Triggers
==========================================================================
*/

/* --- Aim --- */
-- To create and execute PL/SQL procedures, functions, and triggers in Oracle.

/* --- Algorithm --- */
-- 1. Enable server output using `SET SERVEROUTPUT ON`.
-- 2. Create a `Students` table and insert sample records.
-- 3. Create a PL/SQL **procedure** to display a message and execute it.
-- 4. Create a PL/SQL **function** to return the total number of students and execute it.
-- 5. Create a **trigger** that fires before each `INSERT` on the Students table.
-- 6. Insert a new record to activate the trigger.
-- 7. Observe and verify all outputs.

/* --- Program --- */

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

/* --- Output --- */
-- 
-- ```
-- Procedure executed successfully
-- Total Students: 2
-- Trigger executed before inserting a record
-- ```

/* --- Result --- */
-- Thus, PL/SQL procedures, functions, and triggers were successfully created and executed.
