NEW.id refers to the new value of ID for each updated row. The NEW is referred to as a reference variable because it refers to the data that’s being updated. 

```sql
CREATE OR REPLACE FUNCTION update_creation_date() RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE Product SET creation_date = current_timestamp WHERE id = NEW.id;
  RETURN NEW;
END;$$;

CREATE TRIGGER product_insert_trg
AFTER INSERT ON Product
  FOR EACH ROW EXECUTE PROCEDURE update_creation_date();

```

```sql
INSERT INTO
  Product (name, price)
VALUES
  ('iPhone', 799.99),
  ('S7 Edge', 849.99),
  ('Mate 9', 599.99),
  ('Moto Z', 599.99),
  ('Lumia', 499.99);

SELECT * FROM Product;
```