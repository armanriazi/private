# Commands

```bash
sudo -i -u postgres 
SHOW config_file;
SHOW shared_buffers;
SHOW work_mem;
SHOW max_connections;
SHOW log_destination;
SHOW hba_file; # authentication
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

# Host-based authentication format(pg_hba)

In PostgreSQL, host-based authentication is a mechanism that allows us to control access to our database based on the IP address of the connecting client host. The host-based authentication format in PostgreSQL is based on a set of rules that specify which hosts are allowed to connect to the database, and which users are allowed to connect from those hosts. These rules are defined in the pg_hba.conf file, which is typically located in the PostgreSQL data directory. The pg_hba.conf file contains a series of lines that define the authentication rules for each host. It has the following fields:

    TYPE: This refers to the host type of connection. The details about what they mean are given below:

        local: This refers to the connection from the local machine usually using a Unix socket.

        host: This refers to the connection from a remote machine over TCP/IP.

        hostssl: This refers to the connection from a remote machine using SSL protocol. In this case, we must provide a valid SSL certificate for SSL encryption. This adds an additional layer of encryption to the connection for security.

        hostnossl: This refers to the connection from a remote machine without SSL encryption.

        hostgssenc: This refers to the connection from a remote machine over GSSAPI encryption, such as MIT Kerberos.

        hostnogssenc: This refers to a connection from a remote machine without GSSAPI encryption. 

    DATABASE: This specifies which database the connection can be used for. Here, “all” specifies that the connection is allowed for all databases, while “replication” specifies that the connection is allowed for replication connections.

    USER: This specifies which PostgreSQL username can access this particular connection. For example, “postgres” will allow connections from users with the postgres username.

    ADDRESS: This column defines a list of IP addresses or hostnames that are allowed to connect to the database server.

    METHOD: This refers to the authentication method that will be used for this connection. The list of valid values is as follows:

        trust: This specifies that connections from users with matching IP addresses or hostnames will not require additional authentication.

        reject: This specifies that connections from users with matching IP addresses or hostnames will be rejected.

        password: This specifies that a password will be required each time the user connects. It sends the passwords in plaintext, which isn’t secure and should be avoided if possible.

        md5: This uses an MD5 hashing algorithm to encrypt and secure the passwords, which is better than the plaintext password authentication method.

        scram-sha-256: This uses a SCRAM-SHA-256 hashing algorithm to encrypt and secure the passwords.

        cert: This allows us to specify a valid SSL certificate so that all connections are encrypted.

        ident: This uses the ident authentication method, which is generally not recommended as it transmits user passwords in plaintext.

        ldap: This enables LDAP authentication.

        peer: This allows us to specify a hostname or IP address that can connect without authentication. This is an insecure setting, which should be avoided as far as possible.

        radius: This enables RADIUS authentication.

        sspi: This specifies connections from users using the SSPI authentication method.

        gss: This uses GSSAPI encryption to encrypt and secure the connections.

    OPTIONS: This column allows for additional settings to be defined for this connection. For example, we can specify that connections from a particular IP address should not have access to any databases except for the ones specifically whitelisted in the dbname field. We can also define password policies to require strong passwords and limit logins to certain times of day or days of the week. Overall, this column provides a lot of flexibility for customizing our database access settings.