# mysql

#creating database
CREATE DATABASE  db3_final_project;
USE db3_final_project;

#creating tables
CREATE TABLE category(
	category_id INT auto_increment,
    category_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(category_id)
) ENGINE=INNODB;

CREATE TABLE roles(
	role_id INT auto_increment,
    role_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(role_id)
) ENGINE=INNODB;

CREATE TABLE users(
	user_id INT auto_increment,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    role_id INT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (role_id) 
		REFERENCES roles (role_id)
) ENGINE=INNODB;

CREATE TABLE discounts(
	discount_code VARCHAR(255),
    dicount_percent INT,
    discount_createdAt Date,
    PRIMARY KEY (discount_code)
) ENGINE=INNODB;

CREATE TABLE ORDERS(
	order_id INT auto_increment,
    user_id INT,
    total_price FLOAT,
    order_date DATE,
    discount_code VARCHAR(255),
    PRIMARY KEY (order_id),
    FOREIGN KEY (discount_code)
		REFERENCES discounts (discount_code)
) ENGINE=INNODB;

CREATE TABLE products(
	product_id INT auto_increment,
    isbn VARCHAR(255),
    publ_date DATE,
    euro_price FLOAT,
    book_type VARCHAR(255),
    category_id INT,
    name VARCHAR(255),
    subtitle VARCHAR(255),
    edition VARCHAR(255),
    author VARCHAR(255),
    published_country VARCHAR(255),
    language VARCHAR(255),
    no_of_pages INT,
    height FLOAT,
    width FLOAT,
    spine FLOAT,
    weight FLOAT,
    sales_rank INT,
    short_blurb VARCHAR(999),
    long_blurb VARCHAR(999),
    blurb_review VARCHAR(999),
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id)
		REFERENCES category (category_id)
) ENGINE=INNODB;

CREATE TABLE orderdetails(
	detail_id INT auto_increment,
    order_id INT,
    product_id INT,
    price FLOAT,
    quantity INT,
    PRIMARY KEY (detail_id),
    FOREIGN KEY (order_id)
		REFERENCES orders (order_id),
	FOREIGN KEY (product_id)
		REFERENCES products (product_id)
) ENGINE=INNODB;