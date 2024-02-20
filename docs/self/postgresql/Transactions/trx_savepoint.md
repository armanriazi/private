```sql
BEGIN; 
INSERT INTO Account
VALUES ('100-0000-0001', 'Timothy Wright', 1000);

SAVEPOINT trans_point1;

\echo '>> Updating the row'
SELECT '\n' AS " "; -- Adding new line

UPDATE Account SET balance = balance + 100::money;

SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line

SAVEPOINT trans_point2;

\echo '>> Deleting the row'
SELECT '\n' AS " "; -- Adding new line

DELETE FROM Account WHERE account_number='100-0000-0001'; 

SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line

\echo '>> Rolling back to trans_point2'
SELECT '\n' AS " "; -- Adding new line

ROLLBACK TO SAVEPOINT trans_point2;

SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line

\echo '>> Rolling back to trans_point1'
SELECT '\n' AS " "; -- Adding new line

ROLLBACK TO SAVEPOINT trans_point1;
```

```sql
SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line
```