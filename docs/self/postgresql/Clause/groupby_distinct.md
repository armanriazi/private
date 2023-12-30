SELECT
  department,
  COUNT(DISTINCT salary)
FROM
  Employee
GROUP BY
  department;