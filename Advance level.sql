-- Advance Level

-- 1. Find users who haven't made a payment in the last 6 months:

SELECT * FROM netflix_userbase 
WHERE LastPaymentDate < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 2. Find users who have a "Standard" subscription and are older than 30 years:

SELECT * FROM netflix_userbase 
WHERE subscription_Type = 'Standard' 
AND Age > 30;

-- 3. Rank users by Monthly Revenue within each subscription type:

SELECT user_id, subscription_type, monthly_revenue, 
       RANK() OVER (PARTITION BY subscription_type ORDER BY monthly_revenue DESC) AS Revenue_Rank
FROM netflix_userbase;

-- 4. Find the average revenue of users per country who joined in 2023:
  
SELECT Country, AVG(monthly_revenue) AS Average_Revenue
FROM netflix_userbase
WHERE YEAR(join_date) = 2023
GROUP BY Country;

-- 5. Find the number of users in each revenue range (e.g., 0-250, 250-500, etc.):

SELECT 
   CASE 
       WHEN monthly_revenue BETWEEN 0 AND 250 THEN '0 - 250'
       WHEN monthly_revenue BETWEEN 250 AND 500 THEN '250 - 500'
       WHEN monthly_revenue BETWEEN 500 AND 750 THEN '500 - 750'
       -- Add more ranges as needed
       ELSE 'Other'
   END AS Revenue_Range, 
   COUNT(*) AS User_Count
FROM netflix_userbase
GROUP BY Revenue_Range;


