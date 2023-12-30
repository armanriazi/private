/*
An INSTEAD OF trigger would be created on a view that’s not inherently updatable. 
*/

CREATE VIEW Product_view AS
    SELECT 
        id, name, price
    FROM
        Product;

CREATE FUNCTION update_price() RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$ 
BEGIN
    UPDATE
    product
    SET
    modification_date = NOW(), 
    prev_price = OLD.price, 
    price = NEW.price
    WHERE
    id = NEW.id;

    RETURN NEW;
END;
$$;

CREATE TRIGGER product_update_trg INSTEAD OF
UPDATE
  ON Product_view FOR EACH ROW EXECUTE PROCEDURE update_price();

UPDATE Product_view SET price = 999 WHERE id = 1;

SELECT '\n' AS " "; -- Adding Newline 

SELECT id, name, price, modification_date AS "modified", prev_price FROM Product; 