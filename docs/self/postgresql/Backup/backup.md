    
# Importance of backup and recovery
    
- [x] Data protection: Backups serve as a safety net against data loss. Accidental deletion, hardware failures, software bugs, and natural disasters can all lead to data corruption or loss. Regular backups help protect our valuable data by providing a means to restore it to a previous state.

- [x] Business continuity: Databases play a crucial role in the operation of many businesses. In case of database failures, having reliable backups enables us to recover the system and minimize downtime quickly. This ensures business continuity and reduces the impact on productivity, customer satisfaction, and revenue.

- [x] Disaster recovery: Natural disasters, system failures, or cybersecurity incidents can cause significant disruptions to our database infrastructure. Having well-planned backup and recovery strategies allows us to recover our databases and resume operations efficiently in such situations.

- [x] Compliance and regulations: Many industries have specific compliance and legal requirements regarding data retention and protection. By implementing regular backups, we can meet these obligations and ensure the integrity and availability of the data.

- [x] Development and testing: Backups provide a way to create copies of the production database for testing new software versions, performing data analysis, or simulating scenarios without affecting the live environment.

- [x] Database upgrades and migrations: Backups play a crucial role when moving to a new version of a database system or changing to a different platform. They enable us to revert to a previous state in case of any issues during the upgrade or migration process.

- [x] Data integrity: Backups help maintain data integrity by providing restore points that allow us to revert to a known good state in case of data corruption or erroneous changes.

## Types based on data capture    

- [x] Full backup: A full backup is a complete copy of the database, including all the data and metadata. Full backups are typically the largest and take a long time to complete. However, they’re the most comprehensive form of backup and provide the most straightforward method for restoring data.

- [x] Incremental backup: An incremental backup includes only the changes made to the database since the last backup. Incremental backups are smaller and take less time to complete than full backups. However, restoring an incremental backup requires the restoration of the full backup and all subsequent incremental backups.

- [x] Differential backup: A differential backup includes only the changes made to the database since the last full backup. Differential backups are smaller than full backups but larger than incremental backups. Restoring a differential backup requires the restoration of the full backup and the differential backup.

- [x] Log backup: A log backup captures the transaction logs of the database, which contain information about the changes made to the database since the last log backup. Log backups, typically performed frequently, such as every few minutes or hours, are used for disaster recovery and supporting point-in-time recovery.

- [x] Snapshot backup: A snapshot backup is a copy of the database at a specific time, created by capturing the state of the database and the storage system. Snapshot backups are typically performed quickly and with minimal impact on the performance of the database and are used for disaster recovery and for supporting point-in-time recovery.

## Types based on frequency    
Regular backup: We perform regular backups on a regular schedule, such as daily or weekly.
Ad hoc backup: We conduct an ad hoc backup on a need basis.

# Create a physical backup

sudo cp -R /path/to/postgresql/data /path/to/backup

# Creating backups/Res with pg_dump
The pg_dump utility is a command-line utility that creates a logical backup of a PostgreSQL database. 

```bash
sudo -i -u postgres
```
```bash
pg_dump database_name > backup_file.sql -- Run out of psql

--pg_dump <database_name> < <backup_file.sql> --Restore by pg_dump you can use also pg_restore

pg_dump -U postgres -F t -f backupfile.tar database_name -- Run out of psql 

pg_restore -U postgres -F t -C -d newdatabase backupfile.backup

\! pg_dump -U postgres -t Employee -- Run in psql
```

## Creating backups with pg_dumpall
creates a backup of all PostgreSQL databases.

```bash
pg_dumpall > backup_file.sql
```

```bash
-- Execute the pg_dump command
\! pg_dumpall -U postgres
```

# Sample

```bash
\! pg_dump -U postgres -Fc mydb > db.dump
```

Create database newdb;

```bash
\! pg_restore -U postgres -l db.dump > db.list
\! pg_restore -U postgres -L db.list db.dump
```

- Line 1: This creates a backup of a database, redirecting the output of the pg_dump command to a file named db.dump. This file contains the backup of the mydb database. The -U postgres statement specifies the username as postgres, the default user in PostgreSQL. The -Fc statement specifies the format of the backup file as a custom format. This format is more flexible and allows for selective restores. The name of the database that we want to back up is mydb and > db.dump redirects the output of the pg_dump command to a file named db.dump, which will contain the backup of the mydb database.

- Line 3: This creates a new PostgreSQL database named newdb.

- Line 5: The -U postgres statement specifies the username as postgres while -l db.dump lists the contents of the backup file db.dump without actually performing the restore operation. It also redirects the output of the pg_restore command to a file named db.list. This file contains the list of objects (tables, indexes, etc.) included in the backup.

- Line 6: The -L db.list statement instructs pg_restore to use the db.list file as a reference to determine which objects to restore. The backup file is db.dump, from which the restore operation will be performed.

# Resetting the WAL log
In some cases, we might need to reset the WAL log, for example:

When we want to perform a point-in-time recovery of the database to a specific time in the past

When we want to remove WAL files that are no longer needed—to free up disk space

When we want to reduce the size of the WAL archive and control the amount of disk space used by WAL logs

`pg_resetwal` to reflect the purpose of logging better. This command is typically used as part of a PITR process, where we restore a database to a specific point in time.

```bash
cd ~
# Then we initialize a new PostgreSQL database cluster, as shown below
# The -D option specifies the location of the data directory for the cluster.
initdb -D data
pg_ctl -D data -l logfile start
pg_ctl stop -D data
pg_resetwal -D data
# This command starts the server again after the WAL has been reset.
pg_ctl -D data -l logfile start
```

## Point-in-time recovery (PITR) 
Is a method of data recovery that allows us to restore a database to a specific point in time. In PostgreSQL, PITR is accomplished using WAL files and archive logs.To perform PITR in PostgreSQL, we’ll need to configure our database to use WAL and archive logs and then use the pg_resetxlog and pg_restore commands to restore our database to a specific point in time.

