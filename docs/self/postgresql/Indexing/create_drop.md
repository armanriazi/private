DROP INDEX idx_customer_name;
--\d+ idx_customer_name




CREATE INDEX idx_customer_fname_lname ON Customer (last_name, first_name);