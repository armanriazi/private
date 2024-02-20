Date Time functions

```sql
SELECT now() AS "Now"; 
SELECT '\n' AS " "; -- Adding new line

SELECT date_part('hour', now()) AS "Hour";
SELECT '\n' AS " "; -- Adding new line

SELECT date_trunc('hour', now()) AS "Hour";
```

Output:

```text
Now
2023-12-29 18:27:54.727255+00 
 Hour
18 
 Hour
2023-12-29 18:00:00+00
```