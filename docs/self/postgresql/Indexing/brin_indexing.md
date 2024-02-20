`NOTE:` where a specific condition is frequently used in queries. BRIN indexes can also improve query performance on very large tables. 

```sql
CREATE INDEX idx_customer_brin ON Customer (id) WHERE id > 10; 
--\d+ idx_customer_brin
```
