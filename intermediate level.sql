-- Intermediate Level

-- 1. Find the total revenue from users grouped by country:

SELECT  Country, sum(monthly_revenue)
FROM netflix_userbase
group by Country;

-- 2. Find the average revenue per subscription type:

select subscription_type, avg(monthly_revenue)
from netflix_userbase
group by subscription_type;

-- 3. Get the number of users who have a subscription plan lasting more than 1 year:

select  count(user_id)
from netflix_userbase
where plan_duration > '12';

-- 4. Identify the most popular device used by users:

select max(Device) from netflix_userbase;

-- 5. Identify the most popular device (by count) used by users:

SELECT Device, COUNT(*) AS Device_Count
FROM netflix_userbase
GROUP BY Device
ORDER BY Device_Count DESC
LIMIT 1;


-- 6. Calculate the percentage of male and female users:

SELECT Gender, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_userbase)) AS Gender_Percentage
FROM netflix_userbase
GROUP BY Gender;








