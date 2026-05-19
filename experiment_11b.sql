/*
==========================================================================
 Experiment 11(B) — Case Study: Hospital Database Schema
==========================================================================
*/

/* --- Aim --- */
-- To create a hospital database to manage patients, doctors, and appointments.

/* --- Algorithm --- */
-- 1. Create `Patients`, `Doctors`, and `Appointment` tables with appropriate attributes.
-- 2. Define primary keys and foreign keys.
-- 3. Insert sample patient, doctor, and appointment records.
-- 4. Use `TO_DATE()` for proper date formatting.
-- 5. Display all records using `SELECT` queries.

/* --- Program --- */

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

/* --- Output --- */
-- 
-- **PatientsTbl:**
-- 
-- | Patient\_ID | Name | Disease |
-- |-------------|------|---------|
-- | 1           | Ravi | Fever   |
-- 
-- **DoctorsTbl:**
-- 
-- | Doctor\_ID | Name      | Specialization |
-- |------------|-----------|----------------|
-- | 101        | Dr. Kumar | General        |
-- 
-- **AppointmentTbl:**
-- 
-- | App\_ID | Patient\_ID | Doctor\_ID | App\_Date |
-- |---------|-------------|------------|-----------|
-- | 1001    | 1           | 101        | 11-APR-26 |

/* --- Result --- */
-- Thus, the Hospital Database was successfully created and records were inserted and displayed correctly.
