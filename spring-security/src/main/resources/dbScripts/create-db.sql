DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS ROLES;
DROP TABLE IF EXISTS USER_ROLES;

CREATE TABLE USERS (
	ID INT NOT NULL AUTO_INCREMENT,
	LOGIN VARCHAR(50) NOT NULL,
	PASSWORD VARCHAR(50) NOT NULL,
	DATE_OF_REGISTRATION DATE NOT NULL,
	DESCRIPTION VARCHAR(2000),
	UNIQUE UQ_USER_1 (LOGIN, PASSWORD),
    PRIMARY KEY (ID)
);

CREATE TABLE ROLES (
	ID INT NOT NULL AUTO_INCREMENT,
	CODE INT NOT NULL,
	DESCRIPTION VARCHAR(2000),
	UNIQUE UQ_USER_ROLE_1 (CODE),
	PRIMARY KEY (ID)
);

CREATE TABLE USERS_ROLES (
	USERS_ID INT NOT NULL,
	ROLES_ID INT NOT NULL,
	FOREIGN KEY (USERS_ID) REFERENCES USERS (ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (ROLES_ID) REFERENCES ROLES (ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);