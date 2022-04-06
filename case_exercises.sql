##CASE STATEMENTS


-- Write a query that returns all employees, their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

USE employees;

SELECT 
    CONCAT(first_name, ' ', last_name),
    dept_no,
    from_date,
    to_date
FROM
    employees
        JOIN
    dept_emp USING (emp_no);
    
SELECT 
    CONCAT(first_name, ' ', last_name),
    dept_no,
    from_date,
    to_date, IF (to_date > curdate(), true, false) AS is_current_employee
FROM
    employees
        JOIN
    dept_emp USING (emp_no);
    

-- Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name
FROM employees;

SELECT 
    first_name,
    last_name,
    CASE
        WHEN
            last_name LIKE 'A%'
                OR last_name LIKE 'B%'
                OR last_name LIKE 'C%'
                OR last_name LIKE 'D%'
                OR last_name LIKE 'E%'
                OR last_name LIKE 'F%'
                OR last_name LIKE 'G%'
                OR last_name LIKE 'H%'
        THEN
            'GROUP_1_A-H'
        WHEN
            last_name LIKE 'I%'
                OR last_name LIKE 'J%'
                OR last_name LIKE 'K%'
                OR last_name LIKE 'L%'
                OR last_name LIKE 'M%'
                OR last_name LIKE 'N%'
                OR last_name LIKE 'O%'
                OR last_name LIKE 'P%'
                OR last_name LIKE 'Q%'
        THEN
            'GROUP_2_I-Q'
        WHEN
            last_name LIKE 'R%'
                OR last_name LIKE 'S%'
                OR last_name LIKE 'T%'
                OR last_name LIKE 'U%'
                OR last_name LIKE 'V%'
                OR last_name LIKE 'W%'
                OR last_name LIKE 'Z%'
                OR last_name LIKE 'Y%'
                OR last_name LIKE 'Z%'
        THEN
            'GROUP_3_R-Z'
        ELSE NULL
    END AS 'alpha_group'
FROM
    employees
ORDER BY last_name;


-- How many employees (current or previous) were born in each decade?

SELECT 
    COUNT(CASE
        WHEN birth_date LIKE '195%' THEN 'D_1950'
        ELSE NULL
    END) AS '1950s',
    COUNT(CASE
        WHEN birth_date LIKE '196%' THEN 'D_1960'
        ELSE NULL
    END) AS '1960s'
FROM
    employees;

-- answer: 1950s- 182,886 employees, 1960s- 117,138 employees


-- What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT 
    CASE
        WHEN dept_name IN ('research' , 'development') THEN 'R&D'
        WHEN dept_name IN ('sales' , 'marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Quality Management' , 'Production') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance' , 'Human resources') THEN 'Finance & HR'
        WHEN dept_name IN ('Customer Service') THEN 'Customer Service'
        ELSE NULL
    END AS department_group,
    AVG(salary) AS avg_salary
FROM
    departments
        JOIN
    dept_emp USING (dept_no)
        JOIN
    salaries USING (emp_no)
WHERE
    dept_emp.to_date > CURDATE()
        AND salaries.to_date > CURDATE()
GROUP BY department_group;

-- Answer: 'Customer Service','67285.2302'
		-- 'Finance & HR','71107.7403'
		-- 'Prod & QM','67328.4982'
		-- 'R&D','67709.2620'
		-- 'Sales & Marketing','86368.8643'



