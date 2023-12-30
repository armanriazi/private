CREATE INDEX name_idx ON Product(name);

--\d+ Product

INSERT INTO Product (name, quantity, price, in_stock, description, expiry_date) 
VALUES 
    ('Widget', 10, 50.00, true, 'This is a widget', current_date), 
    ('Doodad', 20, 75.00, true, 'This is a doodad', null),  
    ('NerdDangle', 10, 150.00, true, 'This is a nerd dangle', null), 
    ('Thingamabob', 5, 85.00, false, 'This is a thingamabob', null),  
    ('Whatsit', 25, 90.00, true, 'This is a whatsit', null);

DELETE FROM Product WHERE expiry_date = NULL;
REINDEX TABLE Product;
REINDEX INDEX name_idx;


VACUUM INDEX

/*
Note: Rebuilding an index can take a while, and will temporarily lock the table it’s associated with. So it should be done during off-peak times or when there won’t be heavy usage of the table. Additionally, if we’re rebuilding, it might be worth considering dropping and recreating the index, as this can sometimes be more efficient. This can be done with the DROP INDEX and CREATE INDEX commands. 
*/