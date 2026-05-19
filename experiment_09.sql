/*
==========================================================================
 Experiment 9 — Demonstrate Concurrency Using Lock-Based Mechanisms
==========================================================================
*/

/* --- Aim --- */
-- To demonstrate concurrency control using lock-based mechanisms in SQL by applying row-level locking with `SELECT ... FOR UPDATE`.

/* --- Algorithm --- */
-- 1. Create a `bank_lock` table and insert a record.
-- 2. Start Transaction 1 and acquire a row-level lock using `SELECT ... FOR UPDATE`.
-- 3. Update the balance within Transaction 1.
-- 4. Start Transaction 2 and attempt to access the same locked row — it waits.
-- 5. Commit Transaction 1 to release the lock.
-- 6. Transaction 2 proceeds, updates the balance, and commits.
-- 7. Display the final state.

/* --- Program --- */

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

/* --- Output --- */
-- 
-- | State              | id | Name | Balance |
-- |--------------------|----|------|---------|
-- | Initial            | 1  | Ram  | 5000    |
-- | After T1 Update    | 1  | Ram  | 4500    |
-- | After T2 Update    | 1  | Ram  | 5500    |

/* --- Result --- */
-- Thus, concurrency using lock-based mechanisms was successfully demonstrated using `SELECT ... FOR UPDATE`, where Transaction 2 waits until the locked row is released by Transaction 1 before proceeding.
