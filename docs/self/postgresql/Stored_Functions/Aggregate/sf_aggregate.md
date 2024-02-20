```sql
CREATE TABLE Product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  creation_date DATE,
  price MONEY
);

INSERT INTO
  Product (name, price)
VALUES
  ('iPhone', 799.99),
  ('S7 Edge', 849.99),
  ('Mate 9', 599.99),
  ('Moto Z', 599.99),
  ('Lumia', 499.99);
```

```sql
SELECT count(*) AS "Number of Records" FROM Product;  
SELECT '\n' AS " "; -- Adding new line

SELECT sum(price) AS "Total Value" FROM Product;
SELECT '\n' AS " "; -- Adding new line

SELECT min(price) AS "Lowest Price" FROM Product;
SELECT '\n' AS " "; -- Adding new line

SELECT max(price) AS "Highest Price" FROM Product;
```