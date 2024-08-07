-- SQL script that creates a table (called users) with following fields
-- id, email, name
CREATE TABLE IFNOT EXISTS users (
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	email varchar(255) NOT NELL UNIQUE,
	name varchar(255)
)
