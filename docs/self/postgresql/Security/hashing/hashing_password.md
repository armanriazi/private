
CREATE TABLE Users (
	username VARCHAR(20) NOT NULL PRIMARY KEY, 
	password VARCHAR(50)
);

INSERT INTO Users VALUES ('developer', md5('p@ssw0rd'));

SELECT
  *
FROM
  Users
WHERE
  username = 'developer' AND password = md5('p@ssw0rd');