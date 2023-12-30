-- String functions 
SELECT length('Hello world!') AS "Number of Characters";
SELECT '\n' AS " "; -- Adding new line

SELECT substring('Hello world!', 1, 3) AS "Substring";
SELECT '\n' AS " "; -- Adding new line

SELECT lower('HELLO WORLD!') AS "Lowercase string";
SELECT '\n' AS " "; -- Adding new line

SELECT upper('hello world!') AS "Uppercase string";
SELECT '\n' AS " "; -- Adding new line

SELECT concat('hello', 'world!') AS "Concatenated string";
SELECT '\n' AS " "; -- Adding new line
 
SELECT repeat('Hello world!', 3) AS "Repeated string"; 

/* output
Number of Characters
12 

 Substring
Hel 

 Lowercase string
hello world! 

 Uppercase string
HELLO WORLD! 

 Concatenated string
helloworld! 

 Repeated string
Hello world!Hello world!Hello world!
*/