CREATE FUNCTION get_cheap_product_count(low MONEY, high MONEY)
RETURNS VARCHAR(50)
LANGUAGE plpgsql
AS 
$$
DECLARE  
    product_count integer; 
BEGIN
    SELECT count(id) INTO product_count  
    FROM 
        Product
    WHERE 
        price between low and high; 

    RETURN product_count;  
END; $$;

SELECT * FROM get_cheap_product_count(100::MONEY, 500::MONEY);