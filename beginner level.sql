CREATE DATABASE Netflix;
use Netflix;
SELECT  * FROM netflix_userbase;

-- Beginner Level

-- Count the number of users:

SELECT COUNT(user_id)
FROM netflix_userbase;

-- List all the distinct subscription types:

SELECT DISTINCT subscription_type
FROM netflix_userbase;

-- Find the total revenue generated from users who have the "Basic" subscription:

SELECT SUM(monthly_revenue)
FROM netflix_userbase
WHERE subscription_type = 'Basic';

-- Find the average age of users:

SELECT AVG(Age)
FROM netflix_userbase;

-- List users who joined after a specific date (e.g., 01-Jan-2022):

SELECT * FROM netflix_userbase
WHERE join_date > '2022-01-01';







