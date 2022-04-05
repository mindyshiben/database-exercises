
-- temporary_tables 

USE employees;

CREATE TEMPORARY TABLE jemison_1748.employees_with_departments 
AS SELECT first_name, last_name, dept_name 
FROM employees
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE to_date > CURDATE();

SELECT 
    *
FROM
    jemison_1748.employees_with_departments;
    
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the 
	-- first name and last name columns
-- Update the table so that full name column contains the correct data
-- Remove the first_name and last_name columns from the table.
-- What is another way you could have ended up with this same table?

ALTER TABLE jemison_1748.employees_with_departments ADD full_name VARCHAR (50);

UPDATE jemison_1748.employees_with_departments 
SET full_name = CONCAT(first_name, ' ', last_name); 

SELECT 
    *
FROM
    jemison_1748.employees_with_departments;
    
ALTER TABLE jemison_1748.employees_with_departments 
DROP COLUMN first_name, 
DROP COLUMN last_name;

-- answer: you could get this same table by joining employees and departments tables 
-- and selecting dept_name and use concat for full_name


-- Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the 
-- number of cents of the payment. For example, 1.99 should become 199.

USE sakila;

SELECT *
FROM payment;

DESCRIBE payment;

CREATE TEMPORARY TABLE jemison_1748.payment_data(payment_id smallint unsigned, customer_id smallint unsigned, 
	staff_id tinyint unsigned, rental_ID INT, amount decimal(5,2), payment_date datetime, last_update timestamp);
    
SELECT *
FROM jemison_1748.payment_data;

ALTER TABLE jemison_1748.payment_data
MODIFY COLUMN amount int;

DESCRIBE jemison_1748.payment_data;

-- Find out how the current average pay in each department compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries. 
-- In terms of salary, what is the best department right now to work for? The worst?

USE employees;

CREATE TEMPORARY TABLE jemison_1748.salary_data AS SELECT AVG(salary), dept_name
FROM salaries s
join dept_emp using(emp_no)
join departments using(dept_no)
where s.to_date > curdate()
group by dept_name;

SELECT *
FROM jemison_1748.salary_data;

-- answer: sales is best department, HR is worst in terms of current salary data 


