# tables practice

SHOW DATABASES;

USE farmers_market;

SHOW TABLES;

DESCRIBE customer;

SHOW CREATE TABLE customer;

/* basic statements practice

Use the albums_db database.

Explore the structure of the albums table.

a. How many rows are in the albums table?

b. How many unique artist names are in the albums table?

c. What is the primary key for the albums table?

d. What is the oldest release date for any album in the albums table? What is the most recent release date?

Write queries to find the following information:

a. The name of all albums by Pink Floyd

b. The year Sgt. Pepper's Lonely Hearts Club Band was released

c. The genre for the album Nevermind

d. Which albums were released in the 1990s

e. Which albums had less than 20 million certified sales

f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? */

USE albums_db;

SHOW TABLES;

DESCRIBE albums;

SELECT 
    *
FROM
    albums;

SELECT DISTINCT
    artist
FROM
    albums;

SELECT 
    *
FROM
    albums
ORDER BY release_date ASC;
#all records w/earliest on top

SELECT 
    MIN(release_date)
FROM
    albums;
# shows just the date

SELECT 
    *
FROM
    albums
WHERE
    release_date = (SELECT 
            MIN(release_date)
        FROM
            albums);
# subquery to show the record 

SELECT 
    *
FROM
    albums
WHERE
    release_date = (SELECT 
            MAX(release_date)
        FROM
            albums);
            
SELECT 
    name
FROM
    albums
WHERE
    artist = 'Pink Floyd';
    
SELECT 
    release_date
FROM
    albums
WHERE
    name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

SELECT 
    genre
FROM
    albums
WHERE
    name = 'Nevermind';
    
SELECT 
    *
FROM
    albums
WHERE
    release_date BETWEEN 1990 AND 2000;
    
SELECT 
    *
FROM
    albums
WHERE
    sales < 20;
    
SELECT 
    *
FROM
    albums
WHERE
    genre = 'Rock';
# for rock genre only 

SELECT 
    *
FROM
    albums
WHERE
    genre LIKE '%Rock%'; 
# includes anything with rock

### Exercises using WHERE clasue
/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? */

USE employees; 

SHOW TABLES;

SELECT 
    *
FROM
    employees;

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya');
#709 employees

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya';
#also returns 709

SELECT 
    *
FROM
    employees
WHERE
    (first_name IN ('Irena' , 'Vidya', 'Maya'))
        AND gender = 'M';
#441 records

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%';
# 7330 records

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%e';
#899 employees

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name NOT LIKE 'E%';
#23393 employees

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%';
#135214 employees

SELECT 
    *
FROM
    employees
WHERE
    birth_date LIKE '%12-25';
#842 employees

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'Q%'
        OR last_name LIKE '%q%'
        OR last_name LIKE '%q';
#1873 employees

SELECT 
    *
FROM
    employees
WHERE
    (last_name LIKE 'Q%'
        OR last_name LIKE '%q%'
        OR last_name LIKE '%q')
	AND last_name NOT LIKE 'Qu%' AND last_name NOT LIKE '%qu' AND last_name NOT LIKE '%qu%';
#547 employees

# Order By exercises
/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.

Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.*/

