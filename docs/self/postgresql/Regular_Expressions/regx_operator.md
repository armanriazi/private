```sql
SELECT
  *
FROM
  Customer
WHERE
  email ~ '.com$';
```

```sql
SELECT * FROM Customer;

DELETE FROM
  Customer
WHERE
  fname ~ '^J.*';

SELECT '\n' AS " ";

SELECT * FROM Customer;
SELECT '\n' AS " ";
```


```sql
SELECT
  *
FROM
  Customer
WHERE
  phone_number ~ '[0-9]{3}-[0-9]{3}-[0-9]{4}';
```


```sql
--The ~* operator is similar to ~ but performs a case-insensitive match. 
SELECT
  *
FROM
  Customer
WHERE
  fname ~* 'john';
```

