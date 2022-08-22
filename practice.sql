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




