CREATE PROCEDURE update_employee(employee_id int, job_title text)
LANGUAGE plpgsql
AS $$
BEGIN 
   UPDATE Employee 
   SET title = $2
   WHERE id = $1;
END; $$;

CALL update_employee(1, 'Marketing Manager');

/*
\df
\echo '\n Print source code of stored procedure'
\sf update_employee
*/