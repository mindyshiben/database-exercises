
-- In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? Answer that in a comment in your SQL file.

USE employees;

SELECT DISTINCT
    title
FROM
    titles;

-- answer- 7 unique titles


-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e'
GROUP BY last_name
ORDER BY last_name ASC;

-- answer- 
-- 	'Eldridge'
-- 	'Erbe'
-- 	'Erde'
-- 	'Erie'
-- 	'Etalle'


-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e'
GROUP BY first_name, last_name
ORDER BY last_name ASC;

-- answer- 846 results

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- answer: 3 results returned


-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT 
    last_name, COUNT(last_name)
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- answer-
-- 'Chleq' - 189
-- 'Lindqvist' - 190
-- 'Qiwen' - 168


-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
-- Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

-- Option 1-

SELECT 
    first_name, gender, COUNT(*)
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
GROUP BY first_name , gender;

-- answer- This shows 6 values, the 3 names listed twice (once for male, once for female)

-- Option 2-

SELECT 
    gender, COUNT(*)
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
GROUP BY gender;

-- answer- This shows 2 values, the count of unique female names and count of unique male names with first name being one of 3 mentioned


-- Using your query that generates a username for all of the employees, generate a count employees for each unique username. 
-- Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT 
    first_name, last_name, COUNT(LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2)))) AS user_name
FROM
    employees
GROUP BY first_name, last_name; 

-- Answer- 279,408 unique usernames


SELECT 
    first_name, last_name, COUNT(LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2)))) AS user_name
FROM
    employees
GROUP BY emp_no; 

SELECT 300024 - 279408;

-- Answer- There are 20,616 duplicate usernames.

                    
-- More practice with aggregate functions:


-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, 
-- you'll probably be grouping by that exact column.

SELECT 
    emp_no, first_name, last_name, AVG(salary)
FROM
    employees
        JOIN
    salaries USING (emp_no)
GROUP BY emp_no;


-- Using the dept_emp table, count how many current employees work in each department. 
-- The query result should show 9 rows, one for each department and the employee count.

SELECT 
    *
FROM
    dept_emp;

SELECT DISTINCT
    (dept_no), COUNT(*)
FROM
    dept_emp
WHERE
    to_date = '9999-01-01'
GROUP BY (dept_no);


-- Determine how many different salaries each employee has had. This includes both historic and current.

SELECT * FROM employees.salaries;

SELECT 
    emp_no, COUNT(salary)
FROM
    employees.salaries
GROUP BY (emp_no);


-- Find the maximum salary for each employee.

SELECT 
    emp_no, MAX(salary), first_name, last_name
FROM
    employees.salaries
        JOIN
    employees USING (emp_no)
GROUP BY (emp_no);
    
    
-- Find the minimum salary for each employee.

SELECT 
    emp_no, MIN(salary), first_name, last_name
FROM
    employees.salaries
        JOIN
    employees USING (emp_no)
GROUP BY (emp_no);
    
-- Find the standard deviation of salaries for each employee.
SELECT 
    emp_no, STDDEV(salary), first_name, last_name
FROM
    employees.salaries
        JOIN
    employees USING (emp_no)
GROUP BY (emp_no);

-- Now find the max salary for each employee where that max salary is greater than $150,000.
-- Find the average salary for each employee where that average salary is between $80k and $90k.