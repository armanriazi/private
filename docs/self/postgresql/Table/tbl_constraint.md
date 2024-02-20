```sql
ALTER TABLE
  Customer
ADD
  CONSTRAINT customer_pk PRIMARY KEY (id); -- Adding PRIMARY KEY

ALTER TABLE
  Customer
ADD
  CONSTRAINT unique_email UNIQUE (email); -- Adding UNIQUE constraint

ALTER TABLE
  Customer
ALTER COLUMN
  id
SET
  NOT NULL; -- Adding NOT NULL constraint

ALTER TABLE 
  Customer 
ALTER COLUMN 
  dob 
SET 
  DEFAULT '2000-01-01'; -- Adding DEFAULT contstraint

ALTER TABLE
  Customer
ADD
  CONSTRAINT check_customer_id CHECK (id > 0); -- Adding CHECK constraint

ALTER TABLE
  Users
ADD
  CONSTRAINT user_customer_fk FOREIGN KEY (id) REFERENCES Customer (id); 
--- Adding FOREIGN KEY constraint
```

```bash
\d Customer 
```

```sql
SELECT '\n' AS " "; -- Adding new line
```

```bash
\d Users
```

```sql
CREATE TABLE Customer (
    id INTEGER, --PRIMARY KEY 
    name VARCHAR(255), 
    dob DATE CHECK (dob > '1900-01-01'), --DEFAULT '2000-01-01'
	PRIMARY KEY (id, name)
);
```