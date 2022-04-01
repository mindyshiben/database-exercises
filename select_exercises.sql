
USE albums_db;

SELECT 
    *
FROM
    albums;
    

-- Explore the structure of the albums table.
-- a. How many rows are in the albums table?
	-- answer: 31 rows

-- b. How many unique artist names are in the albums table?

SELECT COUNT(DISTINCT artist)
FROM
    albums;
    
-- answer: 23 artists

-- c. What is the primary key for the albums table?
	-- answer: id (column:id definiteion is int UN AL PK)

-- d. What is the oldest release date for any album in the albums table? 
	-- answer: 1967 (organize by release date column)

-- What is the most recent release date?
	-- answer: 2011

-- Write queries to find the following information:

-- a. The name of all albums by Pink Floyd

USE albums_db;

SELECT 
    name
FROM
    albums
WHERE
    artist = 'Pink Floyd';
    
-- answer: 
-- 'The Dark Side of the Moon'
-- 'The Wall'


-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released

USE albums_db;

SELECT 
    release_date
FROM
    albums
WHERE
    name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
    
-- answer: 1967


-- c. The genre for the album Nevermind

SELECT 
    genre
FROM
    albums
WHERE
    name = 'Nevermind';
    
-- answer: Grunge, Alternative rock

-- d. Which albums were released in the 1990s

SELECT 
    name 
FROM
    albums
WHERE
    release_date > 1989 and release_date < 2000;
    
-- answer:
-- 'The Bodyguard'
-- 'Jagged Little Pill'
-- 'Come On Over'
-- 'Falling into You'
-- 'Let\'s Talk About Love'
-- 'Dangerous'
-- 'The Immaculate Collection'
-- 'Titanic: Music from the Motion Picture'
-- 'Metallica'
-- 'Nevermind'
-- 'Supernatural'


-- e. Which albums had less than 20 million certified sales

SELECT 
    name
FROM
    albums
WHERE
    sales < 20.0;
    
-- answer:
-- 'Grease: The Original Soundtrack from the Motion Picture'
-- 'Bad'
-- 'Sgt. Pepper\'s Lonely Hearts Club Band'
-- 'Dirty Dancing'
-- 'Let\'s Talk About Love'
-- 'Dangerous'
-- 'The Immaculate Collection'
-- 'Abbey Road'
-- 'Born in the U.S.A.'
-- 'Brothers in Arms'
-- 'Titanic: Music from the Motion Picture'
-- 'Nevermind'
-- 'The Wall'

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

SELECT 
    name
FROM
    albums
WHERE
    genre = "Rock";

-- answer:
-- 'Sgt. Pepper\'s Lonely Hearts Club Band'
-- '1'
-- 'Abbey Road'
-- 'Born in the U.S.A.'
-- 'Supernatural'

-- 'Hard rock' and 'Progressive rock' are strings with a specific values and are seperate from 'rock' 


-- Be sure to add, commit, and push your work.