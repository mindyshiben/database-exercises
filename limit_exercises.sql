
-- MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:
-- SELECT DISTINCT title FROM titles;
-- List the first 10 distinct last name sorted in descending order.

SELECT DISTINCT
    last_name
FROM
    employees
ORDER BY last_name DESC
LIMIT 10;

-- Answer-
	-- 'Zykh'
	-- 'Zyda'
	-- 'Zwicker'
	-- 'Zweizig'
	-- 'Zumaque'
	-- 'Zultner'
	-- 'Zucker'
	-- 'Zuberek'
	-- 'Zschoche'
	-- 'Zongker'
    

-- Find all previous or current employees hired in the 90s and born on Christmas. 
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
-- Write a comment in your code that lists the five names of the employees returned.

USE employees;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '____-12-25'
ORDER BY hire_date ASC
LIMIT 5;

-- Answer: Employee names:
	-- 'Alselm','Cappello'
	-- 'Utz','Mandell'
	-- 'Bouchung','Schreiter'
	-- 'Baocai','Kushner'
	-- 'Petter','Stroustrup'
    

-- Try to think of your results as batches, sets, or pages. The first five results are your first page. 
-- The five after that would be your second page, etc. Update the query to find the tenth page of results.

USE employees;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '____-12-25'
ORDER BY hire_date ASC
LIMIT 5 OFFSET 45;

-- answer: 10th page of results if 5 results per page with above query
-- employee names-
	-- 'Pranay','Narwekar'
	-- 'Marjo','Farrow'
	-- 'Ennio','Karcich'
	-- 'Dines','Lubachevsky'
	-- 'Ipke','Fontan'


-- LIMIT and OFFSET can be used to create multiple pages of data. 
-- What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?

-- Answer: LIMIT and OFFSET can be used to create clean and organizated pages by having a specific number of results (limit) per page. 
		-- OFFSET can grab data from specific page, that page number is caluculated using the LIMIT
        
        
