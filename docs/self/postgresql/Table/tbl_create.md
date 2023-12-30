CREATE TABLE Product (
    id SERIAL,
    name VARCHAR(255),
    description TEXT,
    price MONEY,
    discount DECIMAL(5,2),
    in_stock BOOLEAN,
    inventory INTEGER,
    m_date DATE, -- manufacturing date     
    colors VARCHAR(20)[], -- Array of strings, each having max. length of 20 chars.
    spec JSON,
    status status_type
);



INSERT INTO Product (name, description, price, discount, in_stock, inventory,  m_date, colors, spec, status)
VALUES ('iPhone', 'A smartphone', 999.90, 10, TRUE, 10, '01-01-2022', ARRAY['red','blue'], '{"display": "retina", "camera": "48MP", "memory":"128GB"}', 'active');

SELECT '\n\nA sample record\n\n';
SELECT * FROM Product;