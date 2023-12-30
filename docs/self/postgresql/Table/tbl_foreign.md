DROP TABLE IF EXISTS "Order";

CREATE TABLE "Order"(
    id INTEGER PRIMARY KEY,
    customer_id INTEGER, 
    product_id INTEGER, 
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customer(id,name)
)