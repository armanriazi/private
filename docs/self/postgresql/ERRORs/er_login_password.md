# Become the postgres user

```bash
sudo -i -u postgres
```

# Open the postgres shell

```bash
psql
```

# Create a void database with the name I want

```sql
create database "postgres-local";
```

# Give privileges to the already-existing user postgres to access that database

```sql
grant all privileges on database "postgres-local" to postgres;
```

# Set the password 'postgres' to user  'postgres'

```sql
ALTER USER postgres WITH PASSWORD 'postgres';
```
