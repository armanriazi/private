```sql
ALTER TABLE 
    MANAGER 
ADD 
    CONSTRAINT fk_emp_manager FOREIGN KEY (emp_id) REFERENCES Employee (id)
    ON DELETE CASCADE;
```

```sql
/*DELETE FROM
  Employee
WHERE
  id = 1;
  */
  /*
  DELETE FROM Employee;
  */
```  