`Note:` PostgreSQL does not support nested procedures, meaning a procedure can’t be called within itself or another already executed procedure.

- stored procedures and functions improve database performance by allowing for pre-compiled (like materialized views) and optimized execution of frequently used queries.

```sql
CREATE PROCEDURE update_employee(employee_id int, job_title text)
LANGUAGE plpgsql
AS $$
BEGIN 
   UPDATE Employee 
   SET title = $2
   WHERE id = $1;
END; $$;

CALL update_employee(1, 'Marketing Manager');
```

```bash
\df
\echo '\n Print source code of stored procedure'
\sf update_employee
```