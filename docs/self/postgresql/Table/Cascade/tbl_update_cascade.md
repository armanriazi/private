```sql
ALTER TABLE Manager 
  ADD CONSTRAINT emp_mgr_fk FOREIGN KEY (emp_id) REFERENCES Employee (id)
  ON UPDATE CASCADE;
```

```sql
UPDATE
  Employee
SET
  salary = 15000 * 1.2
WHERE
  name = 'John' RETURNING salary;
```

```sql
/*
SELECT 'Before updation \n' AS " ";

SELECT * FROM MANAGER;
SELECT '\n' AS " ";

SELECT * FROM EMPLOYEE;
SELECT '\n' AS " ";

UPDATE
  Employee
SET
  id = 4
WHERE
  id = 1;

SELECT 'After updation \n' AS " ";

SELECT * FROM MANAGER;
SELECT '\n' AS " ";

SELECT * FROM EMPLOYEE;
*/
```