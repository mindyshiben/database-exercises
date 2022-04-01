
SELECT 
    CONCAT('My dad has been alive for ',
            NOW() - UNIX_TIMESTAMP('1958-03-21'),
            ' seconds');



