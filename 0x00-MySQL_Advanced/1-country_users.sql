-- SQL script that creates a table (called users) following these requirements:
-- id, email, name, country(enumeration of US, CO and TN)
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	email varchar(255) NOT NULL UNIQUE,
	name varchar(255),
	country char(2) NOT NULL DEFAULT 'US' CHECK (country IN ('US', 'CO', 'TN'))
);
