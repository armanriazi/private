```sql
GRANT INSERT ON TABLE Product TO developer;
GRANT DELETE ON TABLE Product TO developer;
SELECT * FROM information_schema.table_privileges WHERE grantee='developer';
```