Temporary views only exist during the current session and aren‘t accessible to other users or sessions. Once the session ends, the temporary view is automatically dropped. Also, any changes made to the temporary view don’t affect the underlying tables. 

```sql
CREATE TEMP VIEW TempOrderHistory AS 
SELECT 
  Customer.name, Customer_order.order_date 
FROM 
  Customer INNER JOIN Customer_order 
  ON Customer.order_id = Customer_order.id;
```

```bash
\d+ TempOrderHistory
```