
-- Below is pulled from 'order_by_exercises' followed by 'fuction_exercises'
-- ***JUMP TO ROW 103 for FUCTIONS EXERCISES ONLY***

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?

USE employees;

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY first_name ASC;

-- Answer: first row of results - Irena Reutenauer
-- 		last row of results - Vidya Simmen


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY (first_name) , last_name;

-- Answer: first row- Irena Acton, last row- Vidya Zweizig


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY (last_name) , first_name;

-- Answer: first row- Irena Acton, last row- Maya Zyda


-- Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their employee number. Enter a comment with the number of employees returned, 
-- the first employee number and their first and last name, and the last employee number with their first and last name.

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e'
        ORDER BY emp_no;
        
-- Answer: 899 employees, first employee number/name- 10021/Ramzi Erde,  last employee number/name- 499648/Tadahiro Erde


-- Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their hire date, so that the newest employees are listed first. 
-- Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e'
ORDER BY hire_date DESC;
        
-- Answer- 899 employees, newest employee- Teiji Eldridge, oldest employee- Sergi Erde


-- Find all employees hired in the 90s and born on Christmas. 
-- Sort the results so that the oldest employee who was hired last is the first result. 
-- Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, 
-- and the name of the youngest employee who was hired first.

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '____-12-25'
ORDER BY birth_date ASC , hire_date DESC;

-- Answer: number of employees- 362, oldest/hired last- Khun Bernini, youngest/first- Douadi Pettis



-- FUNCTIONS EXERCISES

-- Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name.

USE employees; 

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name 
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e'; 

-- Convert the names produced in your last query to all uppercase.

SELECT 
    UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e'; 

-- Find all employees hired in the 90s and born on Christmas. 
-- Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

SELECT 
    first_name, last_name, DATEDIFF(hire_date, CURDATE())
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '____-12-25';

-- Checking work-

SELECT 
    first_name, last_name, hire_date
FROM
    employees;
    
-- Looks good!


-- Find the smallest and largest current salary from the salaries table.

SELECT 
    MIN(salary),MAX(salary)
FROM
    salaries;

-- Answer: smallest salary- 38,623 , largest salary- 158,220

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees first name, 
-- the first 4 characters of the employees last name, an underscore, the month the employee was born, 
-- and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

SELECT 
    first_name, last_name, LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) AS user_name
FROM
    employees; 

-- Answer- this code works to generate usernames with specifications asked for in exercise








