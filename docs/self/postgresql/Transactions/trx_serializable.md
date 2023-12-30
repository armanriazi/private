SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line

\echo 'Autocommit mode ->' :AUTOCOMMIT
SELECT '\n' AS " "; -- Adding new line

SHOW default_transaction_isolation;
SELECT '\n' AS " "; -- Adding new line

\echo 'Timothy transfers $100 to Mary'
SELECT '\n' AS " "; -- Adding new line 

\echo 'Begin transaction with isolation level - serializable'
SELECT '\n' AS " "; -- Adding new line 
BEGIN ISOLATION LEVEL SERIALIZABLE;

SHOW TRANSACTION ISOLATION LEVEL;
SELECT '\n' AS " "; -- Adding new line

\echo 'Debit $100 from the account of Timothy'
SELECT '\n' AS " "; -- Adding new line 
UPDATE
  Account
SET
  balance = balance - 100::money
WHERE
  account_number = '100-0000-0001';

\echo 'Credit $100 to the account of Mary'
SELECT '\n' AS " "; -- Adding new line 
UPDATE
  Account
SET
  balance = balance + 100::money
WHERE
  account_number = '200-0000-0002'; 

\echo 'Transaction completed'
SELECT '\n' AS " "; -- Adding new line 
COMMIT;

SELECT * FROM Account;

/* output
 account_number	customer_name	balance
100-0000-0001	Timothy Wright	$1,000.00
200-0000-0002	Mary Baker	$500.00 

 Autocommit mode -> on 

 default_transaction_isolation
read committed 

 Timothy transfers $100 to Mary 

 Begin transaction with isolation level - serializable 

 transaction_isolation
serializable 

 Debit $100 from the account of Timothy 

 Credit $100 to the account of Mary 

 Transaction completed 

 account_number	customer_name	balance
100-0000-0001	Timothy Wright	$900.00
200-0000-0002	Mary Baker	$600.00
*/