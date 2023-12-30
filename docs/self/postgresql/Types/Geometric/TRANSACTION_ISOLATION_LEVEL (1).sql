/*

Explanation

The point data type is used to store a point in geometric space in PostgreSQL. This is commonly used for storing geospatial data.

*/
CREATE TABLE  parks (
   id SERIAL PRIMARY KEY, 
   name TEXT, 
   boundary POLYGON
 ); 

INSERT INTO
  parks (name, boundary)
VALUES
  (
    'Central Park',
    '((-73.9677, 40.7936),  (-73.9668, 40.7911), (-73.9612, 40.7923), 
     (-73.9606, 40.7941), (-73.9645, 40.7954), (-73.9677, 40.7936))'
  );

SELECT * FROM parks;