```sql
CREATE VIEW OrderHistory AS 
SELECT 
    Customer.name, 
    Customer_order.order_date 
FROM 
    Customer INNER JOIN Customer_order 
    ON Customer.order_id = Customer_order.id;

SELECT * FROM OrderHistory;
```

```sql
DROP VIEW OrderHistory;
--\d+ OrderHistory
```
