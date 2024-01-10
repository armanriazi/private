  --The ALL operator returns TRUE if all the values in the subquery meet the condition.

SELECT
  3 + 4 as Sum,
  5 - 2 as Diff,
  6 * 8 as Mul,
  10 / 2 as Div,
  8 % 3 as Mod;
    
SELECT
  *
FROM
  Customer
WHERE
  gender = 'M'
  AND age > ALL ('{22, 23}'); -- ALL operator
  
 /*
 SELECT
  *
FROM
  Customer
WHERE
  age >= ALL -- ALL Operator
  (
    SELECT
      AVG (age)
    FROM
      Customer
  );
 */


 SELECT
  *
FROM
  Customer
WHERE
 gender = 'M'
AND age > ANY ('{22}'); -- ANY operator

/*
SELECT
  *
FROM
  Customer
WHERE
  age > ANY -- ANY Operator
  ( 
    SELECT
      AVG (age)
    FROM
      Customer
  );
*/




SELECT
  *
FROM
  Customer
WHERE
  city IN ('New York', 'Boston', 'Los Angeles'); -- IN




  SELECT
  *
FROM
  Customer
WHERE
  age BETWEEN 22 AND 24; -- BETWEEN




  SELECT
  *
FROM
  Customer
WHERE
  city LIKE '%ton'; -- LIKE


Select EmployeeName,
 CASE
WHEN Salary >=80000 AND Salary <=100000 THEN 'Director'
WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
Else 'Director'
END AS Designation
from Employee
