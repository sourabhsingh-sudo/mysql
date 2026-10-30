DROP DATABASE IF EXISTS company_training;
CREATE DATABASE company_training;
USE company_training;

CREATE TABLE departments (
   department_id INT NOT NULL,
   dept_name VARCHAR(80) NOT NULL,
   city VARCHAR(60)
)
ENGINE = InnoDB
CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO departments
(department_id,dept_name,city)
VALUES
(101, 'IT', 'Bengaluru'),
(102, 'Finance', 'Mumbai'),
(103, 'Sales', 'Delhi'),
(104, 'Training', 'Noida');

CREATE TABLE employees (
   employee_id INT NOT NULL,
   employee_name VARCHAR(100) NOT NULL,
   email VARCHAR(120),
   department_id INT NOT NULL,
   salary DECIMAL(10,2),
   status VARCHAR(20)
   );
 
INSERT INTO employees
(employee_id, employee_name, department_id, email, salary, status)
VALUES
(101, 'Rahul Sharma', 101, 'rahul@gmail,com',  35000, 'Active'),
(102, 'Amit Kumar', 102, 'amit@gmail.com', 45000, 'Active' ),
(103, 'Priya singh', 103, 'priya@gmail.com',  40000, 'Active'),
(104, 'Neha Verma', 104, 'neha@gmail.com',  30000, 'Inactive');
  
ALTER TABLE departments ADD PRIMARY KEY (department_id);
ALTER TABLE employees ADD PRIMARY KEY (employee_id);
ALTER TABLE departments ADD COLUMN location VARCHAR(100);
ALTER TABLE departments CHANGE COLUMN dept_name department_name VARCHAR(80) NOT NULL;
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;
ALTER TABLE employees MODIFY COLUMN status VARCHAR(20) DEFAULT 'Active';
ALTER TABLE employees ADD UNIQUE (email);
ALTER TABLE employees RENAME TO staff;
ALTER TABLE staff ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE staff DROP INDEX email;
ALTER TABLE staff DROP FOREIGN KEY fk_department;
ALTER TABLE staff DROP PRIMARY KEY;
ALTER TABLE staff ADD PRIMARY KEY (employee_id);
ALTER TABLE departments DROP COLUMN location;

DROP TABLE IF EXISTS company_management.departments;
DROP TABLE IF EXISTS company_management.staff;

RENAME TABLE
company_training.departments TO company_management.departments,
company_training.staff TO company_management.staff;

USE company_management;
SHOW TABLES;

DESCRIBE departments;
SELECT * FROM departments;

SHOW INDEX FROM staff;
SELECT * FROM staff;
  
  



