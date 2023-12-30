CREATE FUNCTION get_employee_title(int) RETURNS text 
LANGUAGE plpgsql 
AS $$ 
BEGIN 
   RETURN (SELECT job_title FROM Employee WHERE employee_id = $1); 
END; $$;



SELECT '\n' AS " "; -- Adding new line

SELECT get_employee_title(2); 

/*
\df
The \sf+ <function_name> can be used to view the definition of the function named <function_name>. 
\sf get_employee_title
*/