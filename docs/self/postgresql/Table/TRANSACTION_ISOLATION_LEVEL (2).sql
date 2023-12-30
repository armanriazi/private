--CREATE TYPE status_type AS ENUM ('active', 'inactive');

CREATE TABLE Users (
    id serial PRIMARY KEY,
    name VARCHAR(255),
    status status_type
);

INSERT INTO Users (name, status)
VALUES ('John', 'active');

SELECT * FROM Users;
