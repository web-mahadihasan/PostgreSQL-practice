-- Active: 1750173643369@@127.0.0.1@5432@office_management@public
-- SQL Join Practice Task

-- 1. **Inner Join to Retrieve Employee and Department Information**
-- 2. **Group By Department with Average Salary**
-- 3. **Count Employees in Each Department**
-- 4. **Find the Department name with the Highest Average Salary**
-- 5. **Count Employees Hired Each Year**

-- Creating the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

DROP TABLE employees

SELECT * FROM employees


-- Creating the departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);


SELECT * FROM departments

-- Inserting sample data into the departments table
INSERT INTO departments (department_name) VALUES 
    ('HR'), 
    ('Marketing'), 
    ('Finance'), 
    ('IT'), 
    ('Sales'), 
    ('Engineering'), 
    ('Customer Support'), 
    ('Administration'), 
    ('Research'), 
    ('Quality Assurance');


-- Inserting sample data into the employees table with a foreign key constraint
INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES 
    ('John Doe', 1, 60000.00, '2022-01-10'),
    ('Jane Smith', 2, 75000.50, '2021-05-22'),
    ('Bob Johnson', 3, 80000.75, '2020-11-15'),
    ('Alice Williams', 4, 90000.25, '2019-08-03'),
    ('David Lee', 5, 65000.50, '2020-03-18'),
    ('Sara Brown', 6, 70000.00, '2021-09-28'),
    ('Mike Miller', 7, 55000.75, '2022-02-05'),
    ('Emily Davis', 8, 95000.00, '2018-12-12'),
    ('Chris Wilson', 9, 72000.50, '2020-06-30'),
    ('Amy White', 10, 68000.25, '2021-11-09'),
    ('John Johnson', 1, 62000.00, '2022-01-15'),
    ('Jessica Thompson', 2, 78000.50, '2021-06-05'),
    ('Michael Harris', 3, 85000.75, '2020-11-25'),
    ('Emma Martinez', 4, 92000.25, '2019-09-15'),
    ('James Taylor', 5, 67000.50, '2020-04-08'),
    ('Sophia Anderson', 6, 72000.00, '2021-10-10'),
    ('William Jackson', 7, 56000.75, '2022-02-10'),
    ('Olivia Nelson', 8, 97000.00, '2018-12-20'),
    ('Daniel White', 9, 73000.50, '2020-07-05'),
    ('Ava Wilson', 10, 69000.25, '2021-11-15'),
    ('Matthew Brown', 1, 63000.00, '2022-01-20'),
    ('Emily Garcia', 2, 76000.50, '2021-06-15'),
    ('Christopher Allen', 3, 86000.75, '2020-12-05'),
    ('Madison Hall', 4, 93000.25, '2019-09-25'),
    ('Andrew Cook', 5, 68000.50, '2020-04-18'),
    ('Abigail Torres', 6, 73000.00, '2021-10-20'),
    ('Ethan Murphy', 7, 57000.75, '2022-02-15'),
    ('Ella King', 8, 98000.00, '2018-12-28'),
    ('Nathan Rivera', 9, 74000.50, '2020-07-15'),
    ('Mia Roberts', 10, 70000.25, '2021-11-20');


-- Inner Join to Retrieve Employee and Department Information
SELECT 
    e.employee_id,
    e.employee_name,
    e.department_id,
    e.salary,
    e.hire_date,
    d.department_name
    FROM employees e 
    INNER JOIN departments d 
    ON e.department_id = d.department_id


-- Group By Department with Average Salary
SELECT
    d.department_name,
    ROUND(AVG(e.salary), 2) as average_salary
    FROM departments d 
    INNER JOIN employees e
    ON d.department_id = e.department_id
    GROUP BY d.department_name

-- Count Employees in Each Department
SELECT
    d.department_name,
    COUNT(employee_id) as total_employee
    FROM
        departments d
    INNER JOIN
        employees e 
    ON
        d.department_id = e.department_id
    GROUP BY
        d.department_name

UPDATE employees 
    SET hire_date = '2022-01-10'
    WHERE employee_id = 4

-- Find the Department name with the Highest Average Salary
SELECT 
    d.department_name,
    ROUND(AVG(e.salary), 2) as average_salary
    FROM
        departments d
    INNER JOIN 
        employees e 
    ON 
        d.department_id = e.department_id
    GROUP BY
        d.department_name
    ORDER BY
        average_salary DESC
    LIMIT 1

-- Count Employees Hired Each Year
SELECT 
    hire_date,
    COUNT(employee_id) as average_salary
    FROM
        employees
    GROUP BY
        hire_date

-- Inserting sample data into the orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting sample data into the orders table
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
    (1, '2022-01-05', 100.50),
    (2, '2022-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2022-01-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2022-02-01', 250.50),
    (1, '2022-02-05', 180.25);

SELECT * FROM orders

SELECT 
    customer_id,
    COUNT(order_id) as total_order,
    SUM(total_amount) as total_spent

    FROM
        orders
    GROUP BY
        customer_id
    HAVING
        COUNT(order_id) > 2

SELECT 
    date_trunc('month', order_date)::DATE as order_month,
    COUNT(order_id) as total_order,
    SUM(total_amount) as total_order_amount
    FROM
        orders
    WHERE
        EXTRACT(YEAR FROM order_date) = 2022
    GROUP BY
        order_month
    ORDER BY
        order_month
     
