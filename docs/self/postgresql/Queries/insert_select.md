```sql
INSERT INTO
  Alumni
SELECT
  *
FROM
  Employee
WHERE
  salary > 50000 :: money;
```