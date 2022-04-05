-- subqueries_exercises

-- Find all the current employees with the same hire date as employee 101010 using a sub-query

USE employees;

SELECT 
    *
FROM
    employees;

SELECT 
    hire_date
FROM
    employees
WHERE
    emp_no = 101010;

SELECT 
    first_name, last_name, emp_no
FROM
    employees
        JOIN
    dept_emp USING (emp_no)
WHERE
    hire_date = (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no = 101010)
        AND to_date > CURDATE();

-- answer: 55 reuslts


-- Find all the titles ever held by all current employees with the first name Aamod.

SELECT *
FROM employees where first_name = 'Aamod';

SELECT 
    emp_no, title, first_name, last_name
FROM
    employees
        JOIN
    titles USING (emp_no)
        JOIN
    dept_emp USING (emp_no)
WHERE
    first_name IN (SELECT 
            first_name
        FROM
            employees
        WHERE
            first_name = 'Aamod')
        AND dept_emp.to_date > CURDATE();

-- answer: 251 results


-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT 
    emp_no
FROM
    dept_emp
GROUP BY emp_no
HAVING MAX(to_date) < CURDATE();


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            dept_emp
        GROUP BY emp_no
        HAVING MAX(to_date) < CURDATE());

-- answer: 59,900 employees


-- Find all the current department managers that are female. List their names in a comment in your code

SELECT emp_no from dept_manager;

SELECT 
    first_name, last_name, gender
FROM
    employees
        JOIN
    dept_manager USING (emp_no)
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager)
        AND gender = 'F'
        AND dept_manager.to_date > CURDATE();
        
-- answer: current department managers that are female-
	-- 'Isamu','Legleitner','F'
	-- 'Karsten','Sigstam','F'
	-- 'Leon','DasSarma','F'
	-- 'Hilary','Kambil','F'


-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT 
    AVG(salary)
FROM
    salaries;
    
SELECT 
    first_name, last_name, salary
FROM
    employees
        JOIN
    salaries USING (emp_no)
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            salaries)
        AND to_date > CURDATE()
ORDER BY salary;

-- answer: 154,543 employees

-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

-- Hint Number 1 You will likely use a combination of different kinds of subqueries.
-- Hint Number 2 Consider that the following code will produce the z score for current salaries.


SELECT 
    MAX(salary) - STDDEV(salary)
FROM
    salaries;


SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    to_date > CURDATE();


SELECT 
    COUNT(*),
    COUNT(*) / (SELECT 
            COUNT(*)
        FROM
            salaries
        WHERE
            to_date > CURDATE()) * 100
FROM
    salaries
WHERE
    to_date > CURDATE()
        AND salary > (SELECT 
            MAX(salary) - STDDEV(salary)
        FROM
            salaries
        WHERE
            salaries.to_date > CURDATE());

-- answer: 83 current salaries, 3.5% of current salaries


-- Find all the department names that currently have female managers


SELECT 
    emp_no
FROM
    dept_manager
WHERE
    to_date > CURDATE();

SELECT 
    dept_name, CONCAT(first_name, ' ', last_name), gender
FROM
    departments
        JOIN
    dept_manager USING (dept_no)
        JOIN
    employees ON dept_manager.emp_no = employees.emp_no
WHERE
    gender = 'F' AND to_date > CURDATE();

-- answer: 'Development', 'Finance', 'Human Resources', 'Research'


-- Find the first and last name of the employee with the highest salary.

SELECT 
    first_name, last_name, salary
FROM
    salaries
        JOIN
    employees USING (emp_no)
WHERE
    to_date > CURDATE()
        AND salary IN (SELECT 
            MAX(salary)
        FROM
            salaries);

-- Answer: 'Tokuyasu Pesch'


-- Find the department name that the employee with the highest salary works in.

SELECT 
    dept_name, CONCAT(first_name, ' ', last_name), salary
FROM
    departments
        LEFT JOIN
    dept_emp USING (dept_no)
        LEFT JOIN
    employees USING (emp_no)
        LEFT JOIN
    salaries USING (emp_no)
WHERE
    salary IN (SELECT 
            MAX(salary)
        FROM
            salaries);

-- answer: sales
