SELECT
  department,
  COUNT(*) as "Number of Employees"
FROM
  Employee
GROUP BY
  department
HAVING
  COUNT(*) > 1;