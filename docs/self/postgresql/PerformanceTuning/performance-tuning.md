# Query planning
We can use the EXPLAIN command to see the execution plan for a query, which can help us identify any bottlenecks or areas for improvement.

## Execution 
 tools like the pg_stat_activity view to monitor the performance of queries and identify any slow-running queries that need to be optimize

## Indexing
 including B-tree, Hash, GiST, and GIN, each with different strengths and weaknesses.

## SQL techniques
 using the right data types, avoiding subqueries and complex joins, and using appropriate aggregate functions can make a big difference in the performance of our queries.

# Change Configuration
Here’s a sample postgresql.conf configuration file for a PostgreSQL database:
 For example, setting the maintenance_work_mem parameter allows PostgreSQL to use more memory for sorting operations which can improve performance significantly.
 
# Identifying bottlenecks
In a PostgreSQL database is an important step in improving performance and ensuring efficient and reliable operation. There are several areas where bottlenecks can occur, including disk I/O, CPU utilization, memory usage, and network activity.

## Disk I/O
When we execute the query below, it will return a list of user tables in the current database along with the corresponding number of disk blocks read from each table. Here, we first fetch all the rows of the Orders table with 100,000 records using the SELECT query. 

```sql
-- Set pg_stat_statements.track to 'all'
SET pg_stat_statements.track = 'all';

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT relname AS table, heap_blks_read
FROM pg_statio_user_tables;
```

## CPU
The following query provides information about the activity of current sessions on the database server, including details about running queries and their related attributes. 
The query_start represents the timestamp when the current query was started and backend_start represents the timestamp when the back-end process for the session was started.
We subtract backend_start from query_start to get the duration of the query execution.

```sql
SELECT 
    pid,
    datname,
    usename,
    backend_start,
    query_start,
    (query_start - backend_start) AS duration
FROM 
    pg_stat_activity
ORDER BY 
    duration DESC;
```

## Memory usage

The pg_stat_bgwriter view provides information about the background writer process, which is responsible for flushing dirty buffers to disk. It includes statistics related to the buffers and can give us an idea of how memory is utilized for caching data.
The buffers_alloc column from the pg_stat_bgwriter system view represents the total number of buffers allocated in the shared buffer cache to PostgreSQL back-end processes. This value provides insight into current memory usage for caching data.

```sql
SELECT buffers_alloc FROM pg_stat_bgwriter;
SELECT '\n' AS " ";
```

## Network activity
We can use tools like tcpdump or Wireshark to monitor network activity and identify any issues causing performance problems.


# Tunning DB

there are two main categories of parameters: those that affect the entire cluster and those that affect only individual sessions or transactions.

## Cluster-level configuration parameters

Let‘s start with a few of the most important parameters that affect the entire cluster:

    shared_buffers: This parameter specifies the amount of memory used for shared buffer cache. Increasing the value of this parameter can result in a faster database, as more data can be cached in memory. However, it’s important to remember that setting this value too high can cause the system to swap, slowing down the database.

    effective_cache_size: This parameter specifies the amount of memory the system expects to be available for disk caching. The query planner uses it to estimate the cost of using an index. Setting this parameter too low can result in the query planner making suboptimal choices, while setting it too high can result in the system using more memory than is available.

    max_connections: This parameter specifies the maximum number of concurrent connections to the database. Setting this value too high can result in the system running out of memory or becoming unresponsive, while setting it too low can limit the number of users who can access the database simultaneously.

    work_mem: This parameter specifies the amount of memory to be used by internal sort operations and hash tables before writing to temporary disk files. Setting this value too low can result in slow query performance, while setting it too high can result in the system running out of memory.

    ## Session/transaction-level configuration parameters

        random_page_cost: This parameter affects the cost calculation for accessing a randomly chosen page, as opposed to a sequentially fetched page. Setting this value higher can cause the query planner to choose a sequential scan instead of an index scan, while setting it lower can cause the query planner to choose an index scan even if a sequential scan would be faster.

    maintenance_work_mem: This parameter specifies the memory used for maintenance operations, such as vacuum and analysis. Setting this value too high can result in the system running out of memory, while setting it too low can result in slower performance for maintenance operations.


# Query Tuning

We can use several techniques to tune queries in PostgreSQL:

    Use of indexes: Indexes can significantly improve the performance of queries by reducing the data the database needs to scan. Using indexes can substantially speed up queries, especially when dealing with large datasets.

    Use of EXPLAIN ANALYZE: We can use the EXPLAIN ANALYZE command to analyze the performance of a query. This command provides detailed information on the query execution plan, including the time to execute each step and the number of rows processed. We can use this information to identify areas to optimize the query.

    Use of EXPLAIN plans: We can use the EXPLAIN (ANALYZE, VERBOSE, COSTS, BUFFERS, TIMING) command to provide detailed information on the query execution plan, including the amount of memory used by the query and the number of disk I/O operations required. This information can be used to identify areas where the query can be optimized.

    Use of partitioning: We can use partitioning to improve the performance of queries by reducing the amount of data the database needs to scan. We can also use partitioning to improve the scalability of the database by distributing the data across multiple disk drives.

    Use of materialized views: We can use materialized views to improve the performance of queries by pre-computing and storing the results of frequently used queries. Materialized views can also speed up the execution of complex queries and reduce the load on the database server.

For example, the code below explains the execution plan for a query that retrieves data from a table named Customer:

```sql
EXPLAIN (ANALYZE, VERBOSE, COSTS, BUFFERS, TIMING)
SELECT
  first_name,
  last_name
FROM
  Customer
WHERE
  state = 'TX';
```

```md
output 3.03s
QUERY PLAN
Seq Scan on customer (cost=0.00..13.12 rows=1 width=86)
 Filter: ((state)::text = 'TX'::text)
```

The output of the EXPLAIN command in PostgreSQL provides detailed information about the query execution plan, including the following information:

    Query plan: This tree-like structure shows the steps involved in executing the query from start to finish. Each node in the tree represents a different step in the query, such as a table scan or an index lookup.

    Seq scan: This indicates that the query is scanning the entire table, row by row, to find the desired data.

    Index scan: This indicates that the query uses an index to quickly find the desired data without scanning the entire table.

    Bitmap heap scan: This indicates that the query uses a bitmap index scan to find the desired data quickly.

    Hash join: This indicates that the query uses a hash join to combine data from two or more tables.

    Nested loop: This indicates that the query uses a nested loop join to combine data from two or more tables.

    Filter: This shows the expression used to filter the data and provides information about how many rows are expected to be returned after the filter has been applied.

    Rows: This indicates the number of rows processed by each step in the query.

    Planning time: This refers to the amount of time spent by the database engine in preparing the execution plan for a query. This includes the time spent analyzing the query, generating the execution plan, and optimizing the plan for efficient execution.

    Execution time: This indicates the amount of time taken to execute each step in the query.

    Buffers: This indicates the number of disk I/O operations required to execute each step in the query.

    Cost: This refers to an estimate of the processing time required to execute a query based on various factors, such as the complexity of the query, the size of the data being processed, and the available resources on the database server. It’s expressed in arbitrary units and is used by the database engine to determine the most efficient execution plan for a query. The cost is not a measure of actual processing time but rather a rough estimate of the processing effort required. It’s displayed as a range, with the minimum cost first and the maximum cost second, separated by .... For example, the cost is 0.15..8.17, which means that the minimum estimated cost of executing this query is 0.15 and the maximum estimated cost is 8.17. The cost can help us understand how the database engine is processing our query and can be useful for identifying performance bottlenecks and fine-tuning our database configuration for optimal performance.


"EXPLAIN" to analyze the query execution plan id the best way to tune the performance of a query in PostgreSQL.

```sql
CREATE INDEX customer_idx_state_dob ON Customer (state, date_of_birth);-- At the first exec remove this line
EXPLAIN ANALYZE
SELECT
  *
FROM
  Customer
WHERE
  state = 'TX'
  AND date_of_birth BETWEEN '1980-01-01'
  AND '1990-01-01';
```

```md
output 2.81s
QUERY PLAN
Seq Scan on customer (cost=0.00..14.38 rows=1 width=291) (actual time=0.007..0.013 rows=5 loops=1)
 Filter: ((date_of_birth >= '1980-01-01'::date) AND (date_of_birth <= '1990-01-01'::date) AND ((state)::text = 'TX'::text))
 Rows Removed by Filter: 39
Planning time: 0.110 ms
Execution time: 0.023 ms
```

  In a production environment, it’s usually better to use the EXPLAIN command without the ANALYZE option, which provides similar information without actually executing the query.

  # Performance monitoring

  PostgreSQL provides several built-in tools for monitoring performance, including:

    The pgAdmin interface: This is a popular graphical user interface for managing PostgreSQL databases. It provides a wealth of information about the performance of the database, including real-time monitoring of queries, resource utilization, and more.

    pg_stat_activity: This view provides real-time information about the current activities of database sessions, including the performance of individual SQL statements, such as the number of times the database has executed the statement, the average time it takes to complete it, and the total time it has been running.

    pg_stat_statements: This extension provides detailed statistics about the performance of individual SQL statements, including the number of times a statement has been executed, the average time it takes to complete, and the total time it has been running.

    PostgreSQL logs: This provides detailed information about the events within the database, including query execution times, resource utilization, and error messages. 

## pg_stat_activity

To use pg_stat_activity, we can simply run a SELECT statement against the view, as shown below:

```sql
 SELECT
  pid, 
  current_user as username,
  state,
  waiting,
  query_start
FROM
  pg_stat_activity;
```

To monitor the blocked queries in the database, we can use the following query:

```sql
  SELECT
  pid, 
  current_user as user,
  state,
  waiting,
  query_start
FROM pg_stat_activity
WHERE waiting = 'true';
```

## pg_stat_statements extension
We can use this information to identify the slowest queries, understand the impact of different queries on the database.
To use pg_stat_statements, we must first install the extension. We can do this by running the following SQL command as a superuser:

CREATE EXTENSION pg_stat_statements;

we can enable the statement statistics by setting the shared_preload_libraries parameter in the postgresql.conf file
shared_preload_libraries = 'pg_stat_statements'

Analyze data
We can run a query against the pg_stat_statements view to analyze the collected data. For example, the following query returns the top 5 slowest queries in the database:

```sql
SELECT
  query,
  calls,
  total_time
FROM
  pg_stat_statements
ORDER BY
  total_time DESC
LIMIT
  5;
```

It returns a list of the top 5 slowest queries, along with the number of times the database executes each query and the total time it took to run.