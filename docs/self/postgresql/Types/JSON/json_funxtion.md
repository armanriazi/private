```sql
SELECT
  json_array_length('["Jane", "John"]') AS "Number of fields";

SELECT '\n' AS " "; -- Adding new line
```

```sql
SELECT * FROM
  json_each(
    '{"street": "123 Main St", "city": "New York", "state": "NY"}'
  );
SELECT '\n' AS " "; -- Adding new line
```

```sql
SELECT * FROM
  json_each_text(
    '{"street": "123 Main St", "city": "New York", "state": "NY"}'
  );
SELECT '\n' AS " "; -- Adding new line
```

```sql
SELECT 
  json_object(
    '{"street", "city", "state"}', '{"123 Main St", "New York", "NY"}'
  ) AS "JSON object";

SELECT '\n' AS " "; -- Adding new line
```

```sql
SELECT 
  jsonb_object(
    '{"street", "city", "state"}', '{"123 Main St", "New York", "NY"}'
  ) AS "JSONB object";
```