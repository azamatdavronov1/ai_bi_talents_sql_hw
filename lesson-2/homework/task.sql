-- Task 1: Testing DELETE, TRUNCATE, DROP
/*
CREATE TABLE test_identity (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO test_identity (name) VALUES ('Ali'), ('Bob'), ('Aziz'), ('Dovud'), ('Ysuf');

SELECT * FROM test_identity;
DELETE FROM test_identity;
SELECT * FROM test_identity;
INSERT INTO test_identity (name) VALUES ('Frank');
SELECT * FROM test_identity;

TRUNCATE TABLE test_identity;
SELECT * FROM test_identity;
INSERT INTO test_identity (name) VALUES ('Grace');
SELECT * FROM test_identity;

DROP TABLE test_identity;
*/

-- Task 2: Data types table
/*
CREATE TABLE data_types_demo (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age TINYINT,
    salary DECIMAL(10,2),
    hire_date DATE,
    is_active BIT,
    notes NVARCHAR(MAX),
    email VARCHAR(100)
);

INSERT INTO data_types_demo VALUES 
    (1, 'John', 30, 75000.50, '2023-01-15', 1, 'Good worker', 'john@example.com'),
    (2, 'Sarah', 25, 62000.00, '2024-03-10', 0, 'On leave', 'sarah@example.com');

SELECT * FROM data_types_demo;
*/

-- Task 3: Image storage
/*
CREATE TABLE photos (
    id INT PRIMARY KEY,
    image_data VARBINARY(MAX)
);

INSERT INTO photos (id, image_data)
SELECT 1, BulkColumn
FROM OPENROWSET(BULK 'C:\Images\sample.jpg', SINGLE_BLOB) AS img;

SELECT id, DATALENGTH(image_data) AS size FROM photos;
*/

-- Task 4: Computed column
/*
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    classes INT,
    tuition_per_class DECIMAL(10,2),
    total_tuition AS (classes * tuition_per_class)
);

INSERT INTO student (id, name, classes, tuition_per_class) VALUES 
    (1, 'Mike', 4, 500.00),
    (2, 'Lisa', 3, 450.00),
    (3, 'Tom', 5, 600.00);

SELECT * FROM student;
*/

-- Task 5: CSV import (final task, uncommented)
CREATE TABLE worker (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

BULK INSERT worker
FROM 'C:\Data\workers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM worker;
