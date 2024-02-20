```sql
CREATE SEQUENCE product_id_seq
    START WITH 100
    INCREMENT BY 1
    MAXVALUE 999
    MINVALUE 100
    NO CYCLE;
-- list all sequences in the database.
--\ds
```

```sql
INSERT INTO
  Product (id, name)
VALUES
  (NEXTVAL('product_id_seq'), 'Laptop');

SELECT
  *
FROM
  Product
WHERE
  id = CURRVAL('product_id_seq');
```  