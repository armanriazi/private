

# become the postgres user
sudo -i -u postgres

# open the postgres shell
psql

# create a void database with the name I want
create database "postgres-local";

# give privileges to the already-existing user postgres to access that database
grant all privileges on database "postgres-local" to postgres;

# set the password 'postgres' to user  'postgres'
ALTER USER postgres WITH PASSWORD 'postgres';