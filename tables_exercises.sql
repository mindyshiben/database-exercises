SHOW databases;
USE employees;
SELECT database();
SHOW tables;

-- Results from SHOW tables;
-- 'departments'
-- 'dept_emp'
-- 'dept_manager'
-- 'employees'
-- 'salaries'
-- 'titles'

-- What different data types are present on this table?
-- answer: numeric (unassigned, float), CHAR, VARCHAR

-- Which table(s) do you think contain a numeric type column? 
-- answer: salaries

-- Which table(s) do you think contain a string type column? 
-- answer: departments, dept_emp, dept_manager, employees, titles

-- Which table(s) do you think contain a date type column? 
-- answer: employees, salaries

-- What is the relationship between the employees and the departments tables? 

DESCRIBE employees;

-- 'emp_no','int','NO','PRI',NULL,''
-- 'birth_date','date','NO','',NULL,''
-- 'first_name','varchar(14)','NO','',NULL,''
-- 'last_name','varchar(16)','NO','',NULL,''
-- 'gender','enum(\'M\',\'F\')','NO','',NULL,''
-- 'hire_date','date','NO','',NULL,''

DESCRIBE departments; 
-- 'dept_no','char(4)','NO','PRI',NULL,''
-- 'dept_name','varchar(40)','NO','UNI',NULL,''


SHOW CREATE DATABASE employees;
DESCRIBE dept_manager;
SHOW CREATE TABLE dept_manager;

-- 'dept_manager','CREATE TABLE `dept_manager` 
-- (\n  `emp_no` int NOT NULL,\n  `dept_no` char(4) NOT NULL,\n  `from_date` date NOT NULL,\n  `to_date` date NOT NULL,\n  
-- PRIMARY KEY (`emp_no`,`dept_no`),\n  KEY `dept_no` (`dept_no`),\n  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) 
-- REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,\n  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) 
-- REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT\n) ENGINE=InnoDB DEFAULT CHARSET=latin1'
