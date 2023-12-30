CREATE FUNCTION employee_title_upper(employee) RETURNS text 
AS $$ 
   SELECT UPPER ($1.job_title) FROM Employee; 
$$ LANGUAGE SQL;

\sf+ employee_title_upper
SELECT '\n' AS " ";  -- Adding new line

SELECT
  employee_id AS "id",
  employee_title_upper(employee.*) AS "title (upper case)"
FROM
  employee;