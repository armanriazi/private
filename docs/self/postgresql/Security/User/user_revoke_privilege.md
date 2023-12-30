

GRANT INSERT, UPDATE ON Product TO team;
REVOKE INSERT ON Product FROM team; 

SELECT * FROM information_schema.table_privileges WHERE grantee='team';