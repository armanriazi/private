This is useful for ensuring the integrity of the data and reducing the risk of errors in our database.
A SAVEPOINT can also label a specific transaction point like a bookmark, which can be used to partially roll back the transaction to this specific point later.

# Transaction isolation level

The transaction isolation level determines how much information is shared between different transactions.

A dirty read is a transaction that allows reading data that has been modified but not committed yet. This can lead to inconsistencies in data, so it’s not recommended for use in production environments.

In a nonrepeatable read, a transaction can read the same data multiple times but see different values each time. This can also lead to problems in the database, so it’s best to avoid this type of transaction if possible.

A phantom read occurs when data is read twice and different rows have been read in between. This can cause unexpected results, so it’s best to avoid this mode of transaction.

As per SQL standards, there are four different transaction isolation levels, as given below:

    READ UNCOMMITTED: This allows dirty reads. It can lead to data inconsistencies, so it’s usually not recommended. However, PostgreSQL ensures there are no dirty reads in a transaction, even in this mode. Having a more restrictive isolation mode is allowed as per SQL standards.

    READ COMMITTED: This prohibits reading data that has been modified but not yet committed. It provides a higher level of consistency for our data. This is also the default level of consistency in a PostgreSQL database.

    REPEATABLE READ: This allows reading data that has been modified but not yet committed. It guarantees that we see the same results if we run the same query multiple times. In PostgreSQL, this mode doesn’t allow phantom reads.

    SERIALIZABLE: This guarantees that we’ll see the same results if we run the same query multiple times, preventing other transactions from modifying our data. It’s the most restrictive of all the isolation levels.

The more restrictive the isolation level, the less information is shared. This can be useful for ensuring that data is not corrupted or changed by other transactions. In autocommit mode, PostgreSQL will automatically commit any changes made to the database when we issue a query. This can be helpful to quickly test out changes, but it’s recommended to use transactions instead of the autocommit mode. 

# Lock resources


Locks are a special type of mechanism that can control access to data between multiple processes. In PostgreSQL, locks can be applied at the table, row, or page level. When we acquire a lock on a resource within a single transaction, it will remain in place until the transaction is committed or rolled back. This ensures that only one process can modify the data at a time.

The syntax for table-level locking is given below:

```sql
LOCK TABLE <table_name> IN EXCLUSIVE MODE;
```

The syntax for the LOCK command

Here, <table_name> is the name of the table that we want to acquire a lock on and <lock_mode> is the type of lock we request. Various options for locking mode include ACCESS SHARE, ROW SHARE, ROW EXCLUSIVE, SHARE, SHARE ROW EXCLUSIVE, EXCLUSIVE, and ACCESS EXCLUSIVE.

PostgreSQL uses the concept of shared and exclusive locks. When we acquire an exclusive lock on a resource, no other process can acquire any locks on that resource until it’s released again. This means that only one process can modify the resource at a time.

We can acquire an exclusive lock on the table to prevent any other processes from modifying the table, allowing us to make your changes without interference. After our changes are done, we can release the lock so that other processes can access the table again.

However, when we acquire a shared lock on a resource, other processes can also acquire shared locks on that resource. This allows multiple processes to read the data simultaneously without locking each other out. Whether we need exclusive or shared locks will depend on our specific application requirements and how the data is used.

One common scenario where shared locks can be helpful is when we need to read data from a table, but we don’t want other processes to modify the data until we’re done. We can use a shared lock to prevent other processes from modifying the data until the current process has finished reading it. This allows working with the data concurrently without locking other processes out.

In general, it’s recommended that we use shared locks whenever possible, as they’re less restrictive than exclusive locks and provide greater concurrency. However, there may be times when we need to use exclusive locks to ensure data integrity or enforce other business rules.

    Note: There’s no UNLOCK statement in PostgreSQL, but we can release the lock by committing or rolling back our transaction. Once a transaction ends, all the locks obtained in the transaction are released automatically.

Table-level locking in PostgreSQL helps prevent data inconsistencies and ensures that all the processes can access up-to-date data. However, there can also be some drawbacks to using this type of locking. For example, it can sometimes cause performance issues, particularly if many processes attempt to modify the same data simultaneously. As such, it’s important to choose a lock mode carefully and minimize any potential negative impacts.


# Deadlocks

A deadlock is a situation where two or more processes are locked in an endless loop, unable to proceed until one of the processes terminates. This typically occurs when there’s a cyclical dependency between two or more processes that both need to access the same data. To avoid deadlocks, it’s important to understand the underlying causes and take steps to prevent them from occurring.

Some of the strategies for preventing deadlocks are as follows:

    Using transactions to lock data in smaller chunks

    Ensuring that processes don't hold locks for too long

    Using dedicated deadlock detection tools to identify and resolve deadlocks as they occur 

But ultimately, the best way to prevent deadlocks is to be aware of their potential causes and take steps to mitigate the associated risks.