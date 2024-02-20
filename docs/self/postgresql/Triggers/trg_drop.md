```bash
\echo 'Before executing DROP TRIGGER statement'
```

```sql
SELECT '\n' AS " "; -- Adding new line
```

```bash
\dS Product
```

```sql
SELECT '\n' AS " "; -- Adding new line
```

```sql
DROP TRIGGER product_insert_trg ON Product;
```

```bash
\echo 'After executing DROP TRIGGER statement'
```

```sql
SELECT '\n' AS " "; -- Adding new line
```

```bash
\dS Product
```