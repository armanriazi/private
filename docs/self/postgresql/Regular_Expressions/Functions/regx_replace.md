SELECT * FROM Customer;

UPDATE
  Customer
SET
  email = REGEXP_REPLACE(email, '.com$', '.biz');

SELECT '\n' AS " "; -- Adding new line

SELECT * FROM Customer;
SELECT '\n' AS " "; -- Adding new line