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

\d Customer 

SELECT '\n' AS " "; -- Adding new line

\d Users