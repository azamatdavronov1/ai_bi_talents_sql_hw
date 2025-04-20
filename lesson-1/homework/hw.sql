USE class1 


----1st
--CREATE TABLE student1
--(
--	id INT,
--	name VARCHAR(50),
--	age INT
--);

--ALTER TABLE student1
--ALTER COLUMN id INT NOT NULL;


----2nd
--CREATE TABLE productt 
--(
--	product_id INT CONSTRAINT uq UNIQUE,
--	product_name VARCHAR(50),
--	price DECIMAL
--);

--ALTER TABLE productt
--DROP CONSTRAINT uq;
--ALTER TABLE productt
--ADD CONSTRAINT uq UNIQUE(product_id)
--ALTER TABLE productt
--ADD CONSTRAINT uq UNIQUE(product_id, product_name)


----3rd
--CREATE TABLE orders 
--(
--	order_id INT CONSTRAINT pk PRIMARY KEY,
--	customer_name VARCHAR(50),
--	order_date DATE
--);

--ALTER TABLE orders
--DROP CONSTRAINT pk;

--ALTER TABLE orders
--ADD CONSTRAINT pk PRIMARY KEY (order_id)


----4th
--CREATE TABLE category
--(
--	cat_id INT PRIMARY KEY,
--	cat_name VARCHAR(50)
--);

--CREATE TABLE item
--(
--	item_id INT PRIMARY KEY,
--	item_name VARCHAR(50),
--	cat_id INT CONSTRAINT fk FOREIGN KEY REFERENCES category(cat_id)
--);
--ALTER TABLE item
--DROP CONSTRAINT fk;
--ALTER TABLE item
--ADD CONSTRAINT fk FOREIGN KEY (cat_id)


----5th
--CREATE TABLE account
--(
--	account_id INT PRIMARY KEY,
--	balance DECIMAL CONSTRAINT chk CHECK (balance >= 0),
--	account_type VARCHAR CONSTRAINT chk1 CHECK (account_type IN ('Saving', 'Checking'))
--);

--ALTER TABLE account
--DROP CONSTRAINT chk;
--ALTER TABLE account
--DROP CONSTRAINT chk1;

--ALTER TABLE account
--ADD CONSTRAINT chk_balance CHECK (balance >= 0);

--ALTER TABLE account
--ADD CONSTRAINT chk_account_type CHECK (account_type IN ('Saving', 'Checking'));


----6th
--CREATE TABLE customer
--(
--	cust_id INT PRIMARY KEY,
--	name VARCHAR(50),
--	city VARCHAR(50) CONSTRAINT df DEFAULT 'Unknown'
--);

--ALTER TABLE customer
--DROP CONSTRAINT df;
--ALTER TABLE customer 
--ADD CONSTRAINT df DEFAULT 'Unknown' FOR city;



----7th
--CREATE TABLE invoice
--(
--	in_id INT PRIMARY KEY IDENTITY,
--	amount DECIMAL
--);

--INSERT INTO invoice(amount)
--VALUES (1.0) --  5 TIMES

--SET IDENTITY_INSERT invoice ON
--INSERT INTO invoice
--VALUES (100, 1.0)


----8th
--CREATE TABLE books
--(
--	book_id INT PRIMARY KEY IDENTITY,
--	title VARCHAR(50) NOT NULL,
--	price DECIMAL CHECK (price > 0),
--	genre VARCHAR(50) DEFAULT 'Unknown'
--);

--INSERT INTO books(title, price)
--VALUES 
--	('Animal Farm', 11)

--SELECT * FROM books


CREATE TABLE books1
(
	book_id INT PRIMARY KEY,
	title VARCHAR(100),
	author VARCHAR(100), 
	published_year INT
);

CREATE TABLE members
(
	member_id INT PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100), 
	phone_number VARCHAR(100),
);

CREATE TABLE loan
(
	loan_id INT PRIMARY KEY,
	book_id INT FOREIGN KEY REFERENCES books1(book_id),
	member_id INT FOREIGN KEY REFERENCES members(member_id),
	loan_date DATE,
	return_date DATE
);


INSERT INTO books1(book_id, title, author, published_year) VALUES
(1, '1984', 'George Orwell', 1949),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925);

INSERT INTO members (member_id, name, email, phone_number) VALUES
(1, 'Azamat Davronov', 'azamat@example.com', '998901234567'),
(2, 'Laylo Karimova', 'laylo@example.com', '998935432100');

INSERT INTO loan (loan_id, book_id, member_id, loan_date, return_date) VALUES
(1, 1, 1, '2025-04-10', NULL),  -- Azamat borrowed 1984, not returned yet
(2, 2, 1, '2025-04-01', '2025-04-15'),  -- Azamat returned To Kill a Mockingbird
(3, 3, 2, '2025-04-05', NULL);  -- Laylo borrowed The Great Gatsby

SELECT * FROM loan

