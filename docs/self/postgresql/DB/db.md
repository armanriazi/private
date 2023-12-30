
SELECT '\n' AS " "; -- Adding new line

ALTER DATABASE customer_db RENAME TO client_db; 



CREATE DATABASE customer_db 

  WITH OWNER = postgres 
  LC_COLLATE = 'C.UTF-8' 
  LC_CTYPE = 'C.UTF-8' 
  TABLESPACE = pg_default 
  CONNECTION LIMIT = -1;

 


SELECT '\n' AS " "; -- Adding new line;
DROP DATABASE IF EXISTS customer_db;

DROP DATABASE customer_db; -- DROP DATABASE command


