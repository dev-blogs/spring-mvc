CREATE TABLE USERS (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    LOGIN VARCHAR(255) NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    USER_NAME VARCHAR(50),
    EMAIL VARCHAR(100) NOT NULL,
    DATE_OF_REGISTRATION DATE NOT NULL,
    DESCRIPTION VARCHAR(2000),    
    UNIQUE UQ_LOGIN_1 (LOGIN),
    PRIMARY KEY (ID)
);
 
CREATE TABLE ROLES (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    USER_ROLE VARCHAR(50) NOT NULL,
    DESCRIPTION VARCHAR(255),
    UNIQUE UQ_USER_ROLE_1 (USER_ROLE),
    PRIMARY KEY (id)
);
 
CREATE TABLE USERS_ROLES (
    USERS_ID INT UNSIGNED NOT NULL,
    ROLES_ID INT UNSIGNED NOT NULL,
    UNIQUE UQ_USERS_ROLES_1 (USERS_ID, ROLES_ID)
);


CREATE TABLE warehouses (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    UNIQUE UQ_ADDRESS_1 (address),
    PRIMARY KEY (id)
);

CREATE TABLE CATEGORIES (
	ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID)
);
 
CREATE TABLE items (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    warehouse_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
 
CREATE TABLE providers (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
 
CREATE TABLE items_providers (
    item_id INT UNSIGNED NOT NULL,
    provider_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (provider_id) REFERENCES providers (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ORDERS (
	ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	USER_ID INT NOT NULL,
	ITEM_ID INT NOT NULL,
	IS_PURCHASED BOOLEAN NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (USER_ID) REFERENCES USERS (ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (ITEM_ID) REFERENCES ITEMS (ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);