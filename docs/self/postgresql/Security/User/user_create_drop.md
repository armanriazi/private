```sql
CREATE OR ALTER USER developer WITH PASSWORD '<password>';
SELECT rolname, rolpassword FROM pg_authid;
--\du
DROP USER <username>;
```