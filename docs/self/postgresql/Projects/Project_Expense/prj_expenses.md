```sql
CREATE DATABASE expense_db
  WITH OWNER = postgres 
  LC_COLLATE = 'C.UTF-8' 
  LC_CTYPE = 'C.UTF-8' 
  TABLESPACE = pg_default 
  CONNECTION LIMIT = -1;

  CREATE TABLE Expense (
  expense_id SERIAL PRIMARY KEY,
  expense_date DATE, 
  amount MONEY, 
  category_id INTEGER, 
  description TEXT);

  CREATE TABLE Category (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(20), 
  budget MONEY
);

```

```sql
ALTER TABLE Expense 
ADD CONSTRAINT fk_expense_category 
FOREIGN KEY (category_id) REFERENCES Category (category_id);
```

```sql
INSERT INTO Category (category_name, budget) VALUES 
('groceries', 200), 
('restaurants', 150), 
('gas', 100), 
('entertainment', 50);

INSERT INTO Expense (expense_date, amount, category_id, description) 
VALUES 
    ('2022-11-01', 50.25, 1, 'monthly grocery refill'), 
    ('2022-11-05', 20.75, 2, 'birthday party'), 
    ('2022-11-15', 50, 3, 'gas for car');


SELECT '\n' AS " ";
SELECT * FROM Category ;
SELECT '\n' AS " ";
SELECT * FROM Expense;
```

```sql
CREATE INDEX idx_expense_amount ON Expense (amount);
```

```sql
SELECT
  SUM(amount)
FROM
  Expense
WHERE
  category_id = (
    SELECT
      category_id
    FROM
      Category
    WHERE
      category_name = 'restaurants'
  )
  AND expense_date BETWEEN '2022-11-01' AND '2022-11-30';
```

```sql
SELECT
  SUM(amount)
FROM
  Expense e
  JOIN Category c ON e.category_id = c.category_id
WHERE
  expense_date BETWEEN '2022-11-01'
  AND '2022-11-30'
GROUP BY
  category_name
HAVING
  category_name = 'restaurants';
```  