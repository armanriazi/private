# Commands

```bash
sudo -i -u postgres 
SHOW config_file;
SHOW shared_buffers;
SHOW work_mem;
SHOW max_connections;
SHOW log_destination;
SHOW ALL;
```

```sql
--\x on 

SELECT *
FROM pg_settings WHERE name = 'shared_buffers';
```

```sql
ALTER SYSTEM SET max_connections = 120;
```

```sql
SELECT version();
```

```bash
psql -h localhost -U postgres -d mydatabase
```

```bash
ps ax | grep postgres:
```

> To start the PostgreSQL server, use the following command:

```bash
pg_ctl start -D </path/to/data/directory>
```

> Performing a vacuum on a database. Vacuuming removes these marked, deleted rows from our database, freeing up memory space and improving the overall performance. (VACUUM command won’t show any output) :

```bash
VACUUM Product;
VACUUM FULL;
```

> The REINDEX command:

```bash
REINDEX TABLE <table_name>;
```

`data_directory "/var/lib/postgresql/16/main"`


 # Executable files

    The clusterdb executable: Available in the bin directory, this is used to configure, start, stop, and monitor the database.

    The initdb executable: This is used to initialize new databases. We can use this tool to create a brand new PostgreSQL database or restore an existing one.

    The pg_dump command: This allows us to export data from our PostgreSQL database into a text file for backup purposes or to transfer to other systems.

    The pg_dumpall executable: This allows us to back up a PostgreSQL cluster and its databases.

    The pg_restore and pg_basebackup executables: These are used for backing up and restoring our PostgreSQL database and moving it to another server.

    The createdb and dropdb commands: These are used to create and delete databases, respectively.

    The psql executable: This is used for executing SQL statements in a terminal or inside the psql client application, allowing us to interactively query data stored in our PostgreSQL database.

    The reindexdb executable: This is used for rebuilding indices,

    The pg_upgrade executable: This allows us to migrate an existing database installation to a newer version of PostgreSQL.

    The pg_config executable: This provides information about our current PostgreSQL.