
SELECT 
    CONCAT('My dad has been alive for ',
            NOW() - UNIX_TIMESTAMP('1958-03-21'),
            ' seconds');
	
    SELECT NOW();
    
    
    -- 2022-04-01 15:04:32
    
USE employees;

SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';



SELECT first_name , COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name
ORDER BY first_name ASC;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT last_name, count(*) AS n_same_last_name
FROM employees
GROUP BY last_name
HAVING n_same_last_name < 300;

SELECT concat(first_name, " ", last_name) AS full_name, count(*) AS n_same_full_name
FROM employees
GROUP BY full_name
HAVING n_same_full_name > 2;

SELECT gender, avg(salary)
FROM employees
join salaries using (emp_no)
group by gender;

-- USE your employees database.
-- DESCRIBE each table and inspect the keys and see which columns have indexes and keys.

DESCRIBE employees;
SHOW CREATE TABLE employees;

-- CREATE TABLE `employees` (
--   `emp_no` int NOT NULL,
--   `birth_date` date NOT NULL,
--   `first_name` varchar(14) NOT NULL,
--   `last_name` varchar(16) NOT NULL,
--   `gender` enum('M','F') NOT NULL,
--   `hire_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1

USE join_example_db;
show tables;

SELECT *
FROM roles;

SELECT *
from users;

SELECT u.name, u.email, r.name as 'role_name'
FROM users as u
RIGHT JOIN roles as r on u.role_id = r.id;

USE employees;

SELECT *
from employees
limit 10;

SELECT *
from dept_emp;

SELECT CONCAT(e.first_name, ' ', e.last_name) as full_name,
d.dept_name
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on d.dept_no = de.dept_no;
