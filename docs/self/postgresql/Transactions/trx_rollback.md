```sql
\echo '>> Initial value'

SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line

BEGIN; 

UPDATE Account SET balance = balance + 100::money;

\echo '>> Updating the row'
SELECT '\n' AS " "; -- Adding new line

SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line

\echo '>> Rolling back the update transaction'
SELECT '\n' AS " "; -- Adding new line

ROLLBACK;
```

```sql
SELECT * FROM Account;
SELECT '\n' AS " "; -- Adding new line
```