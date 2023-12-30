CREATE TABLE Person (
    id SERIAL PRIMARY KEY,
    address JSON
);

INSERT INTO 
  Person (address) 
VALUES 
  (
    '{"street": "123 Main St", "city": "New York", "state": "NY", "zipcode": "A2N9ZJ"}'
  ); 

SELECT address -> 'city' AS "City" FROM Person;

SELECT '\n' AS " "; -- Adding new line

SELECT JSON(address) AS "Address" FROM Person;

SELECT '\n' AS " "; -- Adding new line

SELECT address ->> 'city' AS "City" FROM Person;

SELECT '\n' AS " "; -- Adding new line


