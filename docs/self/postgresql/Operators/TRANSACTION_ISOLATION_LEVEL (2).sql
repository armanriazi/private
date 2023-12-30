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