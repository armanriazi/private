CREATE INDEX idx_customer_name ON Customer ((first_name || ' ' || last_name));
--\d+ idx_customer_name