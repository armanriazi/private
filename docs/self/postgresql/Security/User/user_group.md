
This allows us to easily grant the same privileges to multiple users at once.

```sql
CREATE GROUP team WITH USER developer, tester;
GRANT INSERT ON Product TO team;
SELECT * FROM information_schema.table_privileges WHERE grantee='team';
--\du
```