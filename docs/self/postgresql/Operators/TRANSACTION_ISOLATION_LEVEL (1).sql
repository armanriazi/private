  --The ALL operator returns TRUE if all the values in the subquery meet the condition.
  
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