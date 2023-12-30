SELECT '\n' AS " "; -- Adding new line

ALTER TABLE
  Customer
ADD COLUMN IF NOT EXISTS -- DROP COLUMN phone_number; -- DROP COLUMN IF EXISTS phone_number;
  phone_number VARCHAR(10);

/*
ALTER TABLE
  Orders
ALTER COLUMN
  status
SET 
  DEFAULT 'pending';
*/

/*
ALTER TABLE
  Orders
ALTER COLUMN
  status 
 DROP DEFAULT;
*/

/*
ALTER TABLE
  Customer RENAME COLUMN phone_number TO contact_number;
*/  