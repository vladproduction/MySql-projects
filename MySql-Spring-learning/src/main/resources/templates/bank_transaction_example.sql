/*CREATE TABLE accounts:*/
CREATE TABLE accounts(
    account_number INT PRIMARY KEY,
    customer_name  VARCHAR(255)   NOT NULL,
    balance        DECIMAL(10, 2) NOT NULL DEFAULT 0
);

/*insert accounts data: */
insert into accounts (account_number, customer_name, balance) VALUES (505, 'John Doe', 1000);
insert into accounts (account_number, customer_name, balance) VALUES (506, 'Jane Doe', 2000);
insert into accounts (account_number, customer_name, balance) VALUES (101, 'Bob Stone', 100);


/*CREATE TABLE transactions:*/
CREATE TABLE transactions(
    id                       INT AUTO_INCREMENT PRIMARY KEY,
    sender_account_number    INT            NOT NULL,
    recipient_account_number INT            NOT NULL,
    amount                   DECIMAL(10, 2) NOT NULL,
    date                     DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_account_number) REFERENCES accounts (account_number),
    FOREIGN KEY (recipient_account_number) REFERENCES accounts (account_number)
);

/*insert transactions data: */
/*by transactions writing records automatically to the table*/



BEGIN WORK;

-- 1. Check sender account balance (assuming 'balance' column)
SELECT balance FROM accounts WHERE account_number = 505;

-- 2. Check if sender has sufficient funds (replace 100 with actual transfer amount)
IF balance >= 100 THEN

  -- 3. Debit sender account
UPDATE accounts
SET balance = balance - 100
WHERE account_number = 505;

-- 4. Credit recipient account
UPDATE accounts
SET balance = balance + 100
WHERE account_number = 506;

-- 5. Insert transaction record (assuming a 'transactions' table)
INSERT INTO transactions (sender_account_number, recipient_account_number, amount, date)
VALUES (505, 506, 100, NOW());

COMMIT;