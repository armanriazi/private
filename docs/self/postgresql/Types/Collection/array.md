CREATE TABLE Person (
   id SERIAL PRIMARY KEY,
   hobbies TEXT[]
);

INSERT INTO
  Person (hobbies)
VALUES
  (ARRAY ['reading', 'hiking', 'cooking']);

SELECT hobbies[1] FROM Person;

/*
output:
hobbies
reading
*/

/*
Array Operators and Functions

Operators/Functions
	

Description

ARRAY[] 
	

Creates an array with the given elements 

|| 
	

Concatenates two arrays 

&& 
	

Intersects two arrays 

= 
	

Checks if two arrays are equal

array_append(anyarray, anyelement): 



	

Adds a new element to the end of an array

array_prepend(anyarray, anyelement)
	

Adds a new element to the beginning of an array 




array_remove(anyarray, anyelement)
	

Removes all occurrences of a specific element from an array 


array_length(anyarray)
	

Returns the number of elements in an array 

*/