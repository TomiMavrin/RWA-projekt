CREATE DATABASE IF NOT EXISTS User;
USE User;

CREATE TABLE LoginInfo
(
	Username CHAR(40) NOT NULL,
	Password CHAR(40) NOT NULL,

	PRIMARY KEY (Username)
);

CREATE TABLE Reviews
(
	TourID TINYINT NOT NULL,
	Username CHAR(40) NOT NULL,
	ReviewText VARCHAR(512) NOT NULL,

	PRIMARY KEY (TourID, Username),
	FOREIGN KEY (Username) REFERENCES LoginInfo(Username)
);
