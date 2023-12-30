CREATE TABLE Customer (
    id INTEGER, --PRIMARY KEY 
    name VARCHAR(255), 
    dob DATE CHECK (dob > '1900-01-01'), --DEFAULT '2000-01-01'
	PRIMARY KEY (id, name)
);