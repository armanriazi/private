CREATE DATABASE retail_store
  WITH OWNER = myuser
       ENCODING = 'SQL_ASCII'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;

--\d

CREATE SCHEMA catalog;
CREATE SCHEMA customer_management;
CREATE SCHEMA order_management;

--\dn

CREATE TABLE customer_management.Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE catalog.Product(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0),
    category VARCHAR(50)
);

CREATE TABLE order_management.Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customer_management.Customer(customer_id),
    order_date TIMESTAMP DEFAULT NOW(),
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    total_price NUMERIC(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    shipping_address VARCHAR(100)
);

CREATE TABLE order_management.Item (
    order_id INTEGER REFERENCES order_management.Orders(order_id),
    product_id INTEGER REFERENCES catalog.Product(product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    item_price NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
);

-- Print table structure of Customer table
--\d+ customer_management.Customer
SELECT '\n' AS " "; -- new line

-- Print table structure of Product table
--\d+ order_management.Product
SELECT '\n' AS " "; -- new line

-- Print table structure of Item table
--\d+ catalog.Item
SELECT '\n' AS " "; -- new line

-- Print table structure of Orders table
--\d+ order_management.Orders
SELECT '\n' AS " "; -- new line


INSERT INTO customer_management.Customer (first_name, last_name, email, phone)
VALUES ('John', 'Doe', 'johndoe@example.com', '555-1234'),
       ('Jane', 'Doe', 'janedoe@example.com', '555-6789'),
       ('Bob', 'Smith', 'bobsmith@example.com', '555-9012');

INSERT INTO catalog.Product (name, description, price, stock_quantity, category)
VALUES ('T-Shirt', 'cotton T-shirt', 19.99, 100, 'Clothing'),
       ('Sneakers', 'blue sneakers', 59.99, 50, 'Footwear'),
       ('Backpack', 'school backpack', 39.99, 25, 'Accessories');     

INSERT INTO order_management.Orders (customer_id, total_price, payment_method, shipping_address)
VALUES (1, 59.99, 'Credit Card', '123 Main St, Anytown USA'),
       (2, 19.99, 'PayPal', '456 Oak Ave, Anytown USA'),
       (3, 79.99, 'Credit Card', '789 Elm St, Anytown USA');         

INSERT INTO
  order_management.Item (order_id, product_id, quantity, item_price)
VALUES
  (1, 1, 2, 19.99),
  (1, 2, 1, 59.99),
  (2, 1, 1, 19.99),
  (3, 1, 3, 19.99),
  (3, 2, 1, 59.99);

  -- Retrieve all rows from the Customer table
SELECT * FROM customer_management.Customer;
SELECT '\n' AS " "; -- new line

-- Retrieve all rows from the Product table
SELECT * FROM catalog.Product;
SELECT '\n' AS " "; -- new line

-- Retrieve all rows from the Orders table
SELECT * FROM order_management.Orders;
SELECT '\n' AS " "; -- new line

-- Retrieve all rows from the Item table
SELECT * FROM order_management.Item;
SELECT '\n' AS " "; -- new line       


CREATE TABLE order_management.Shopping_cart (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customer_management.Customer(customer_id),
    product_id INTEGER REFERENCES catalog.Product(product_id),
    quantity INTEGER CHECK (quantity >= 0),
    price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE
 order_management.Shopping_cart
ADD CONSTRAINT
 unique_user_item UNIQUE (customer_id, product_id);

ALTER TABLE
 order_management.Shopping_cart
ADD CONSTRAINT
 positive_quantity CHECK (quantity > 0);

ALTER TABLE
 order_management.Shopping_cart
ADD CONSTRAINT
 non_negative_price CHECK (price >= 0);

 --\d+ order_management.Shopping_cart 




 -- Defining a function
CREATE OR REPLACE FUNCTION add_to_cart(
    p_customer_id INTEGER,
    p_product_id INTEGER,
    p_quantity INTEGER
)
RETURNS VOID AS $$
DECLARE
    cart_id INTEGER;
BEGIN
    -- Check if the customer has an existing shopping cart
    SELECT id INTO cart_id
    FROM order_management.shopping_cart
    WHERE customer_id = p_customer_id;

    IF NOT FOUND THEN
        -- Create a new shopping cart for the customer if they don't have one
        INSERT INTO order_management.shopping_cart (customer_id, product_id, quantity)
        VALUES (p_customer_id, p_product_id, p_quantity)
        RETURNING cart_id INTO cart_id;
    END IF;

END;
$$ LANGUAGE plpgsql;

-- Executing the function
SELECT add_to_cart(1, 1, 1);

SELECT * FROM order_management.shopping_cart;