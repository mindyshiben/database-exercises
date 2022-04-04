
-- Create a file named join_exercises.sql to do your work in.

-- Join Example Database
-- Use the join_example_db. Select all the records from both the users and roles tables.

USE join_example_db;

SELECT 
    *
FROM
    users;

SELECT 
    *
FROM
    roles;

SELECT 
    users.name, roles.name AS 'role'
FROM
    users
        LEFT JOIN
    roles ON roles.id = users.role_id;

SELECT 
    users.name, roles.name AS 'role'
FROM
    users
        RIGHT JOIN
    roles ON roles.id = users.role_id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query

SELECT DISTINCT
    roles.name AS role_name,
    COUNT(users.role_id) AS number_of_employees
FROM
    users
        JOIN
    roles ON users.role_id = roles.id
GROUP BY users.role_id;

-- answer:
	-- 'admin','1'
	-- 'author','1'
	-- 'reviewer','2'


-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.

Use employees; 

SELECT DISTINCT
    dept_name AS department,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS current_manager
FROM
    employees.dept_manager
        LEFT JOIN
    employees.departments ON departments.dept_no = dept_manager.dept_no
        LEFT JOIN
    employees.employees USING (emp_no)
WHERE
    dept_manager.to_date = '9999-01-01'; 


-- Find the name of all departments currently managed by women

SELECT DISTINCT
    dept_name AS department,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name),
    gender
FROM
    employees.dept_manager
        LEFT JOIN
    employees.departments ON departments.dept_no = dept_manager.dept_no
        LEFT JOIN
    employees.employees ON employees.emp_no = dept_manager.emp_no
WHERE
    dept_manager.to_date = '9999-01-01'
        AND employees.gender NOT LIKE '%m%';
    

-- Find the current titles of employees currently working in the Customer Service department

SELECT DISTINCT
    departments.dept_name, titles.title, COUNT(titles.title)
FROM
    employees.dept_emp
        JOIN
    employees.employees ON employees.emp_no = dept_emp.emp_no
        JOIN
    employees.titles ON titles.emp_no = dept_emp.emp_no
        JOIN
    employees.departments ON departments.dept_no = dept_emp.dept_no
WHERE
    departments.dept_name = 'Customer Service'
        AND titles.to_date = '9999-01-01'
        AND dept_emp.to_date = '9999-01-01'
GROUP BY titles.title;
       

-- Find the current salary of all current managers

SELECT 
    departments.dept_name,
    salaries.salary,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name)
FROM
    dept_manager
        JOIN
    employees.employees ON employees.emp_no = dept_manager.emp_no
        JOIN
    employees.departments ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees.salaries ON salaries.emp_no = dept_manager.emp_no
WHERE
    dept_manager.to_date = '9999-01-01'
        AND salaries.to_date = '9999-01-01';


-- Find the number of current employees in each department.

SELECT 
    departments.dept_name, COUNT(dept_emp.emp_no)
FROM
    employees.dept_emp
        LEFT JOIN
    employees.employees ON employees.emp_no = dept_emp.emp_no
        LEFT JOIN
    employees.departments ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_emp.to_date = '9999-01-01'
GROUP BY dept_name;


-- Which department has the highest average salary? Hint: Use current not historic information.

SELECT 
    employees.departments.dept_name, AVG(salaries.salary)
FROM
    employees.dept_emp
        JOIN
    employees.salaries ON salaries.emp_no = dept_emp.emp_no
        JOIN
    employees.departments ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_emp.to_date = '9999-01-01'
        AND salaries.to_date = '9999-01-01'
GROUP BY dept_name
ORDER BY AVG(salaries.salary) DESC;


-- Who is the highest paid employee in the Marketing department?

SELECT 
    departments.dept_name,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name),
    MAX(salaries.salary)
FROM
    employees.dept_emp
        JOIN
    employees.employees ON employees.emp_no = dept_emp.emp_no
        JOIN
    employees.salaries ON salaries.emp_no = dept_emp.emp_no
        JOIN
    employees.departments ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_name = 'marketing'
        AND salaries.to_date = '9999-01-01'
GROUP BY CONCAT(employees.first_name,
        ' ',
        employees.last_name)
ORDER BY MAX(salaries.salary) DESC; 

-- Which current department manager has the highest salary?

SELECT 
    departments.dept_name,
    CONCAT(employees.first_name,
            ' ',
            employees.last_name),
    MAX(salaries.salary)
FROM
    employees.dept_manager
        JOIN
    employees.departments ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees.salaries ON salaries.emp_no = dept_manager.emp_no
        JOIN
    employees.employees ON employees.emp_no = dept_manager.emp_no
WHERE
    dept_manager.to_date = '9999-01-01'
        AND salaries.to_date = '9999-01-01'
GROUP BY departments.dept_name , CONCAT(employees.first_name,
        ' ',
        employees.last_name)
ORDER BY MAX(salaries.salary) DESC;


 
-- Determine the average salary for each department. Use all salary information and round your results.

SELECT 
    departments.dept_name,
    departments.dept_no,
    AVG(salaries.salary)
FROM
    employees.dept_emp
        JOIN
    employees.departments ON departments.dept_no = dept_emp.dept_no
        JOIN
    employees.salaries ON salaries.emp_no = dept_emp.emp_no
GROUP BY departments.dept_name , departments.dept_no;


-- Find the names of all current employees, their department name, and their current manager's name


USE employees;

SELECT 
    departments.dept_name,
    CONCAT(emp.first_name, ' ', emp.last_name) AS E_name,
    CONCAT(man.first_name, ' ', man.last_name) AS M_name
FROM
    employees emp
        LEFT JOIN
    employees.dept_emp ON emp.emp_no = dept_emp.emp_no
        LEFT JOIN
    employees.departments ON dept_emp.dept_no = departments.dept_no
        LEFT JOIN
    employees.dept_manager ON departments.dept_no = dept_manager.dept_no
        LEFT JOIN
    employees man ON dept_manager.emp_no = man.emp_no
WHERE
    dept_emp.to_date = '9999-01-01'
        AND dept_manager.to_date = '9999-01-01'
ORDER BY E_name;


-- Who is the highest paid employee within each department

 -- employees- emp_no, first_name, last_name
 -- dept_emp- emp_no, dept_no, from_date, to_date
-- salaries- emp_no, salary, from_date, to_date
-- departments- dept_no, dept_name

-- SELECT Department.Name AS Department, e1.Name AS Employee, e1.Salary AS Salary
-- FROM Department JOIN Employee e1 ON Department.Id = e1.DepartmentId
-- WHERE e1.Salary = (SELECT Max(Salary) FROM Employee e2 WHERE e2.DepartmentId = e1.DepartmentId)

-- SELECT L1.Department, L1.Employee, L1.Salary
-- FROM
-- (SELECT Department.Name AS Department, Employee.Name AS Employee, Salary
-- FROM Employee JOIN Department ON Employee.DepartmentId = Department.Id) AS L1,
-- (SELECT Department.Name AS Department, Employee.Name AS Employee, Salary
-- FROM Employee JOIN Department ON Employee.DepartmentId = Department.Id) AS L2
-- WHERE L1.Salary > L2.Salary 
-- AND L1.Department = L2.Department

SELECT L1.dept_name, CONCAT(L1.first_name, ' ', L1.last_name) as employee_name, L1.salary
FROM (SELECT dept_name as dep, CONCAT(first_name, ' ', last_name) as employee_name, salary
from employees join depart


SELECT dep.dept_name AS dep, CONCAT(emp1.first_name, ' ', emp1.last_name) AS E_name, emp1.salary as salary
FROM departments dep
JOIN employees.dept_emp on dep.dept_no = dept_emp.dept_no
JOIN employees emp1 on dept_emp.emp_no = emp1.emp_no
WHERE emp1.salary = (SELECT MAX(salary) from employees emp2 WHERE emp2.emp_no = emp1.emp_no)
GROUP BY dep.dept_name;



JOIN employees.departments on dept_emp.dept_no = departments.dept_no