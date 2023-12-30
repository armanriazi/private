/*
Any changes made through the view will also be reflected in the underlying tables. 
The update view can be a useful tool for managing and organizing our data. Just be sure to follow the requirements and use caution when making updates. As always, keep backing up the data before making any updates to prevent any data loss.
*/

CREATE OR REPLACE VIEW Update_OrderHistory AS
SELECT
  Customer.name,
  Customer_order.order_date
FROM
  Customer INNER JOIN Customer_order 
  ON Customer.order_id = Customer_order.id;

\d+ Update_OrderHistory