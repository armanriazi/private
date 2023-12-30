/*
Having a materialized view can be beneficial in cases where the underlying tables and data used in the view can change frequently because the materialized view will only need to be refreshed periodically rather than after every change to the base tables. It can also be helpful in cases where the view involves complex queries, because having the results pre-computed and stored can improve performance. However, it’s important to keep in mind that materialized views don’t update automatically and must be refreshed manually. They also can’t be used for the modification of data. Therefore, it’s important to carefully consider if a materialized view is the best solution for a particular query before implementing it.

The queries above create a materializable view of customer names and their corresponding order dates, which can then be refreshed to update the view with new data. The WITH NO DATA option is important because it prevents any actual data from being inserted into the view. This can improve query performance as the data is already stored in the materializable view rather than having to constantly re-query the underlying tables. 
*/

CREATE MATERIALIZED VIEW Mat_OrderHistory AS
SELECT
  Customer.name,
  Customer_order.order_date
FROM
  Customer INNER JOIN Customer_order 
  ON Customer.order_id = Customer_order.id WITH NO DATA;

\d+ Mat_OrderHistory 

REFRESH MATERIALIZED VIEW Mat_OrderHistory;