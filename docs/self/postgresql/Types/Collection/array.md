```sql
CREATE TABLE Person (
   id SERIAL PRIMARY KEY,
   hobbies TEXT[]
);

INSERT INTO
  Person (hobbies)
VALUES
  (ARRAY ['reading', 'hiking', 'cooking']);

SELECT hobbies[1] FROM Person;
```

Output:

```text
hobbies
reading
```

### Array Operators and Functions

```text
Operators/Functions
Description
ARRAY[] 
Creates an array with the given elements 
|| 
```

```text
Concatenates two arrays 
&& 

Intersects two arrays 
= 

Checks if two arrays are equal
array_append(anyarray, anyelement): 

Adds a new element to the end of an array
```

Adds a new element to the beginning of an array 
```text
array_prepend(anyarray, anyelement)
```

Removes all occurrences of a specific element from an array 

```text
array_remove(anyarray, anyelement)
array_length(anyarray)
```

> Returns the number of elements in an array.

