# Configure the primary server

```sql
CREATE USER replicator REPLICATION LOGIN ENCRYPTED PASSWORD 'password';
```

On the primary server, open the postgresql.conf file and add the following settings:

```bash
wal_level = replica
max_wal_senders = 2
wal_keep_segments = 3
max_replication_slots = 2
```
Setting in the postgres.conf file of the primary database server

wal_level = replica: This setting determines the level of information written to the WAL during transactions. The replica setting ensures that enough information is logged to support replication.

In PostgreSQL, the following three wal_level settings determine the amount of information written to the WAL:

- [x] minimal: Only the information necessary to recover from a crash is written to the WAL. This setting is appropriate for single-node configurations that don’t use replication.

- [x] replica: This setting provides enough information for replication to work but doesn’t provide all the information necessary for logical decoding. This is the default wal_level for replication configurations.

- [x] logical: This setting allows for more advanced features like logical replication and decoding of the WAL.

- [x] max_wal_senders = <number of replica servers>: This setting determines the maximum number of concurrent connections from replica servers to the primary server. The number of replica servers should match the number specified in this setting.

- [x] wal_keep_segments = <number of segments to retain in WAL>: This setting determines the number of WAL segments kept on the primary server for the replica servers to catch up. A higher value of this setting means that more segments are kept, which can increase the amount of disk space used, but it also allows for longer replication delays. A lower value of this setting means less disk space is used, but there’s less time for the replica servers to catch up in case of a failure.

- [x] max_replication_slots = <number of replication slots>: This setting specifies the maximum number of replication slots available on the server. Replication slots are used to track the changes in the WAL of the server and ensure that the replication data is consistent between the primary and secondary servers. The max_replication_slots value should be set according to the number of replica servers expected to connect to the primary server. A higher value of max_replication_slots increases the number of concurrent connections that the primary server can handle but also increases the memory usage of the server. The default value max_replication_slots in PostgreSQL is 0. This means that replication slots are not created by default, and the replication process is not enabled. To use replication slots, the value max_replication_slots must be set to a positive integer in the postgresql.conf file and the server must be restarted for the changes.

```sql
# Replication connection:
host    replication     replicator  <slave_ip_address>/32   md5
```

Also, add the following entry to the pg_hba.conf file to allow the replica server to connect:
The pg_hba.conf configuration file settings for replication
Restart the primary server

After making the changes, restart the primary server to apply the new settings.
Create a replication slot

A replication slot is a mechanism in PostgreSQL that allows the replica server to receive WAL data from the primary server. It’s a named, persisted data structure in a PostgreSQL database cluster that tracks the progress of a replica in reading WAL data. To create a replication slot, use the following SQL command:

`Initiate replication:`
: This will start the replication process, and the data on the primary server will be replicated to the replica server.

SELECT pg_start_backup('label');


`Configure the replica server`

: On the replica server, open the postgresql.conf file and add the following settings:

```bash
hot_standby = on
wal_level = replica
max_wal_senders = 2 --The value of 2 for max_wal_senders means that up to two standby servers can receive WAL data simultaneously.
--\du replicator
```

On the replica server, create a recovery file called recovery.conf in the data directory with the following contents:
The purpose of the recovery.conf file is used to configure the replica server.

```bash
standby_mode = 'on'
primary_conninfo = 'host=primary-server-ip port=5432 user=replicator password=P@ssw0rd'
recovery_target_timeline = 'latest'
trigger_file = '/tmp/postgresql.trigger'
```

After creating the recovery file, restart the replica server(s) to apply the new settings. Next, log in to the secondary server and run the following command to start the replication process:

```bash
pg_basebackup -h <master_server_ip> -U replicator -D /var/lib/postgresql/data -P --xlog-method
```

Finally, monitor the replication status by checking the pg_stat_replication view on the primary server:

```sql
SELECT
  *
FROM
  pg_stat_replication; --
```

## Uses of database replication

- [x] High availability: By having multiple database replicas, we can ensure that the system remains available even if one replica fails. In case of a failure, a replica can take over, ensuring that the system remains available to serve users.

- [x] Load balancing: Replication can balance read loads across multiple replicas. This can help improve the performance of read-intensive applications and reduce the load on the primary database.

- [x] Disaster recovery: Replication can be used to ensure that a backup replica is available in case of a disaster. In the event of a disaster, the replica can take over and ensure that the system remains available.

- [x] Data analysis and reporting: Replicas can be used for data analysis and reporting. This can help reduce the load on the primary database and ensure that reporting and analysis operations don’t impact the performance of the primary database.

- [x] Backup and recovery: Replication can be part of a backup and recovery strategy. Having a replica available can ensure that data is safe and can be recovered during a disaster.

- [x] Compliance and auditing: Replication can be used to ensure that a replica of the data is available for compliance and auditing purposes. This can also help reduce the risk of data loss.

## Replication solutions in PostgreSQL

There are several ways to classify different types of database replication, including:

- [x] Consistency: Replication can be classified based on its consistency level. Consistency refers to the degree to which the data on the replica databases is up-to-date and accurate with respect to the data on the primary database. There are several levels of consistency, including strong consistency, eventual consistency, and weak consistency.

- [x] Direction of data transfer: Replication can also be classified based on the replication direction. Replication can be one-way or bidirectional. In one-way replication, data changes are replicated from a primary database to one or more replica databases. In bidirectional replication, data changes can be replicated in both directions between two or more databases.

- [x] Timing: Replication can be classified based on the timing of replication. Replication can be real-time or batch. In real-time replication, changes are replicated as soon as they occur. Changes are periodically collected and then replicated in a batch in batch replication.

- [x] Method: Replication can also be classified based on the method used for replication. Some common methods include log-based replication, trigger-based replication, file-based replication, and API-based replication.

## PostgreSQL supports several types of database replication, including:

- [x] Streaming replication: This is the standard method of replication in PostgreSQL, and it involves continuously sending WAL records from the primary to the replica. The replica then applies the WAL records to keep its data in sync with the primary.

- [x] Logical replication: This method involves replicating individual changes to the data, such as inserts, updates, and deletes, instead of replicating the entire database. Logical replication can be useful for replicating specific data between databases or for creating reporting replicas.

- [x] File-based replication: This method involves copying the entire database files from the primary to the replica. It can be useful for disaster recovery or for creating read-only replicas for reporting purposes.

- [x] Synchronous replication: This type of replication involves having the primary wait for the replicas to confirm that they have received and applied the changes before committing the transaction. Synchronous replication can provide a higher level of data consistency, but can also impact performance due to the wait time for the replicas to confirm receipt.

- [x] Asynchronous replication: This type of replication involves the primary sending of changes to the replicas without waiting for confirmation. This can help improve performance, but can also result in data inconsistencies if the replicas are temporarily unavailable.

- [x] Trigger-based replication: Trigger-based replication is a method of database replication that uses triggers to replicate data changes from one database to another automatically. It can be useful for replicating data between databases or creating reporting replicas. It can also be used for data migration, where data from an old system is replicated to a new system. Triggers are special functions in a database that are automatically executed when a specified event occurs, such as an insert, update, or delete. The main advantage of trigger-based replication is that it’s easy to set up and can be done without modifying the application code. However, trigger-based replication can also have some disadvantages, such as increased latency and load on the source database and the possibility of circular replication, where changes are continuously replicated between two databases, leading to an infinite loop.

## The following are the different levels of consistency in database replication:

- [x] Strong consistency: This type of replication ensures that all replica databases have the same data and are always up-to-date with the primary database. This is the highest level of consistency and provides the greatest data accuracy.

- [x] Eventual consistency: This type of replication allows for a brief period during which the replica databases may be out-of-date with the primary database. However, after a period of time, all replica databases will eventually be brought up-to-date with the primary database. This type of replication provides a lower level of consistency than strong consistency but can provide better performance and scalability.

- [x] Weak consistency: This type of replication provides the lowest level of consistency and may result in data inconsistencies between the primary and replica databases. This replication type is typically used when data consistency is not a high priority and performance is more important.

The term “streaming replication” is used to emphasize that changes to the primary database are streamed in real time to the secondary servers, while the term “primary-secondary replication” is used to describe the traditional client-server relationship between the primary and secondary servers.


# The direction of data transfer

Replication can also be classified based on the direction of data transfer. The following are the different types of replication based on the direction of data transfer:

One-way replication: In this type of replication, data changes are replicated from a primary database to one or more replica databases. The primary database is the source of truth, and all changes to the data are made on the primary database.

Bidirectional replication: In this type of replication, data changes can be replicated in both directions between two or more databases. This is useful when data needs to be updated on multiple databases and data changes need to be synchronized between all databases.

Multi-master replication: This type of replication is bidirectional replication in which changes can be made to any database, and the changes are automatically replicated to all other databases. This type of replication is useful when multiple databases need to be updated simultaneously, and data changes need to be synchronized between all databases.


# Trigger-based replication

CREATE TABLE Employee_replica
(
  id serial primary key,
  name text NOT NULL,
  salary numeric(10,2) NOT NULL
);
--\dt
CREATE OR REPLACE FUNCTION replicate_employee_changes()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO Employee_replica
    SELECT * FROM Employee
    WHERE Employee.id = NEW.id;
  ELSIF (TG_OP = 'UPDATE') THEN
    UPDATE Employee_replica
    SET name = NEW.name,
        salary = NEW.salary
    WHERE Employee_replica.id = NEW.id;
  ELSE
    DELETE FROM Employee_replica
    WHERE Employee_replica.id = OLD.id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

--\df

CREATE TRIGGER replicate_employee_changes_trigger
AFTER INSERT OR UPDATE OR DELETE ON Employee
FOR EACH ROW EXECUTE PROCEDURE replicate_employee_changes();

--\dS Employee

INSERT INTO Employee (id, name, salary)
VALUES (1, 'John Doe', 5000);
UPDATE Employee SET salary = 6000 WHERE id = 1;
DELETE FROM Employee WHERE id = 1;

SELECT * FROM Employee_replica;

# Bidirectional Replication

Primary-secondary replication only has one primary server and multiple secondary servers, while bidirectional replication has multiple primary servers.

This is done through the following steps:

    We install PostgreSQL on both servers by following the installation instructions for our operating system.

    After installation, we open the configuration file on both servers, postgresql.conf.

    We add the following configuration parameters on both servers:

```bash
listen_addresses = '*'
wal_level = replica
max_wal_senders = <number_of_replication_connections>
```

```sql
CREATE USER replication_user REPLICATION LOGIN ENCRYPTED PASSWORD 'password';
```
---\du replication_user

Open the pg_hba.conf access control configuration file and add the following line to the file:

```sql
host replication replication_user <ip_address_of_other_server>/32 md5
```

Setting up replication on both nodes#

On the first server, create a base backup of the database by running the following command:

```bash
pg_basebackup -h <ip_address_of_other_server> -D <backup_directory> -U replication_user -P
```

We replace <ip_address_of_other_server> and <backup_directory> with the appropriate values for our system.

On the second server, repeat the process by creating a base backup of the first server. On both servers, open the recovery configuration file, and add the following parameters to the recovery.conf file on both servers:

```bash
standby_mode = 'on'
```