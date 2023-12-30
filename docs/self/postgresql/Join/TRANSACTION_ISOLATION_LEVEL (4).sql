SELECT
  Product.product_id AS pid,
  Product.product_name AS name,
  Product.price,
  Sales.sales_id as sid,
  Sales.quantity AS qty,
  Sales.date
FROM
  Product LEFT JOIN Sales 
  ON Product.product_id = Sales.product_id;