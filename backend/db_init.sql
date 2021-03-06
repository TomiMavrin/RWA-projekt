CREATE DATABASE IF NOT EXISTS agencija;
USE agencija;

CREATE USER IF NOT EXISTS 'duser'@'localhost' IDENTIFIED BY 'duserpass';

CREATE TABLE IF NOT EXISTS user (
    id BINARY(36) NOT NULL UNIQUE DEFAULT uuid(),
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(60) NOT NULL,
    authority VARCHAR(10) DEFAULT 'user',
    PRIMARY KEY (id,username)
);

GRANT ALL PRIVILEGES ON user TO 'duser'@'localhost';

CREATE TABLE IF NOT EXISTS offer(
    id BINARY(36) NOT NULL UNIQUE DEFAULT uuid(),
    title VARCHAR(30) NOT NULL,
    description VARCHAR(512) NOT NULL,
    price FLOAT(10) NOT NULL,
    image VARCHAR(40) DEFAULT '',
    pdf VARCHAR(40) DEFAULT '',
    isTop BOOLEAN DEFAULT FALSE,
    polazak TIMESTAMP,
    povratak TIMESTAMP,
    PRIMARY KEY(id)
);

GRANT ALL PRIVILEGES ON offer TO 'duser'@'localhost';

GRANT ALL PRIVILEGES ON LoginInfo TO 'duser'@'localhost';

CREATE TABLE Reviews
(
	TourID TINYINT NOT NULL,
	Username CHAR(40) NOT NULL,
	ReviewText VARCHAR(512) NOT NULL,

	PRIMARY KEY (TourID, Username),
	FOREIGN KEY (Username) REFERENCES LoginInfo(Username)
);

GRANT ALL PRIVILEGES ON Reviews TO 'duser'@'localhost';

FLUSH PRIVILEGES;