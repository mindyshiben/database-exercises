
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- Enter a comment with the number of records returned.

USE employees;

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya');

-- returns table of all employee data for employees with these 3 first names

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya');

-- Returns the number of records/rows
-- answer- Records returned: 709


-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
-- but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
    
    
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
    
-- answer- Results: 709 rows returned. This is the same result as the IN query, but the IN query is more efficent in this case
    

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
-- Enter a comment with the number of records returned.

SELECT 
    *
FROM
    employees
WHERE
    gender = 'M'
        AND (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya');
        

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    gender = 'M'
        AND (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya');

-- answer- Records returned: 441



-- Find all current or previous employees whose last name starts with 'E'. 
-- Enter a comment with the number of employees whose last name starts with E.

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%';


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE 'E%';

-- answer- number of employees whose lase name starts with E: 7330

-- Find all current or previous employees whose last name starts or ends with 'E'. 
-- Enter a comment with the number of employees whose last name starts or ends with E. 

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        OR last_name LIKE '%e';

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE 'E%'
        OR last_name LIKE '%e';

-- answer- number of employees whose last name starts or ends with E: 30,723


-- How many employees have a last name that ends with E, but does not start with E?

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name NOT LIKE 'E%';

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name NOT LIKE 'E%';

-- answer: 23,393 employees

-- Find all current or previous employees employees whose last name starts and ends with 'E'. 
-- Enter a comment with the number of employees whose last name starts and ends with E. 

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e';

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e';

-- answer- number of employees whose last name starts and ends with E: 899


-- How many employees' last names end with E, regardless of whether they start with E?

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%e';


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%e';
    
-- answer- 24,292 employees



-- Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

DESCRIBE employees;

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%';
    
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    hire_date LIKE '199%';
    
-- Answer- 135,214 employees



-- Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

SELECT 
    *
FROM
    employees
WHERE
    birth_date LIKE '____-12-25';
    
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    birth_date LIKE '____-12-25';

-- answer- 842 employees



-- Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with the number of employees returned.

SELECT 
    *
FROM
    employees
WHERE
    birth_date LIKE '____-12-25' AND hire_date LIKE '199%';
    
    
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    birth_date LIKE '____-12-25'
        AND hire_date LIKE '199%';

-- answer- 362 employees



-- Find all current or previous employees with a 'q' in their last name.
-- Enter a comment with the number of records returned.

SELECT 
    *
FROM
    employees
WHERE
	last_name LIKE 'Q%' OR last_name LIKE '%q%' OR last_name LIKE '%q';


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE 'Q%'
        OR last_name LIKE '%q%'
        OR last_name LIKE '%q';
        
-- answer: 1,873 records



-- Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

SELECT 
    *
FROM
    employees
WHERE
    (last_name LIKE 'Q%'
        OR last_name LIKE '%q%'
        OR last_name LIKE '%q')
        AND last_name NOT LIKE 'Qu%'
        AND last_name NOT LIKE '%qu%'
        AND last_name NOT LIKE '%qu';
    
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    (last_name LIKE 'Q%'
        OR last_name LIKE '%q%'
        OR last_name LIKE '%q')
        AND last_name NOT LIKE 'Qu%'
        AND last_name NOT LIKE '%qu%'
        AND last_name NOT LIKE '%qu';
        
-- answer: 547 employees