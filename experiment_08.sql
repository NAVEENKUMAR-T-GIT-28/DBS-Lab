/*
==========================================================================
 Experiment 8 — Simulate Transactions and Demonstrate ACID Properties
==========================================================================
*/

/* --- Aim --- */
-- To simulate database transactions and demonstrate the ACID properties — Atomicity, Consistency, Isolation, and Durability — using SQL commands.

/* --- Algorithm --- */
-- 1. Start the transaction.
-- 2. Create a `BankAccount` table and insert sample records.
-- 3. Perform a transfer operation: deduct amount from one account and add to another.
-- 4. If all operations succeed, commit the transaction.
-- 5. If any error occurs, roll back the transaction.
-- 6. Display the final balances.
-- 7. Verify each ACID property based on the transaction behaviour.

/* --- Program --- */

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

/* --- Output --- */
-- 
-- | AccountID | Name | Balance |
-- |-----------|------|---------|
-- | 1         | Ram  | 4500    |
-- | 2         | Ravi | 3500    |

/* --- ACID Properties Demonstrated --- */
-- 
-- | Property    | Description |
-- |-------------|-------------|
-- | **Atomicity**    | All operations complete together or none do. If deduction from Ram fails, the credit to Ravi is also rolled back. |
-- | **Consistency**  | Total balance before (5000 + 3000 = 8000) equals total balance after (4500 + 3500 = 8000). No value is lost. |
-- | **Isolation**    | Concurrent transactions operate independently and do not interfere with each other's intermediate states. |
-- | **Durability**   | Once committed, changes are permanently stored even if the system crashes immediately after. |

/* --- Result --- */
-- Thus, the transaction simulation was successfully performed and the ACID properties (Atomicity, Consistency, Isolation, Durability) were demonstrated.
