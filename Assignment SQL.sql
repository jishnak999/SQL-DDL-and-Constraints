-- =========================================
-- Question 1: Database and Table Creation
-- =========================================

CREATE DATABASE employee;
USE employee;
SELECT DATABASE();
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
SHOW TABLES;
CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES location(location_id)
);
SHOW TABLES;
select * from employees;

-- =========================================
-- Question 2: Table Alteration
-- =========================================

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
DESC employees;


ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(150);
DESC employees;

ALTER TABLE employees
DROP COLUMN age;
DESC employees;

ALTER TABLE employees
RENAME COLUMN hire_date TO date_of_joining;
DESC employees;

-- =========================================
-- Question 3: Table Renaming
-- =========================================

RENAME TABLE departments TO departments_info;
SHOW TABLES;

RENAME TABLE location TO locations;
SHOW TABLES;

-- =========================================
-- Question 4: Table Truncation (TRUNCATE)
-- =========================================

TRUNCATE TABLE employees;
SELECT * FROM employees;
SHOW TABLES;

-- =========================================
-- Question 5: Database & Table Dropping (DROP)
-- =========================================

DROP TABLE employees;
SHOW TABLES;
DROP DATABASE employee;
SHOW TABLES;

-- =========================================
-- Constraints: Database Recreation
-- =========================================


DROP DATABASE IF EXISTS employee;

CREATE DATABASE employee;
USE employee;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
SHOW TABLES;

DESC departments;

CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);
SHOW TABLES;
DESC location;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES location(location_id)
);
SHOW TABLES;