# Netflix Platform SQL Project

This project involves building and querying an SQL database for a Netflix-like platform. It includes tracking user subscriptions, monthly revenue, user demographics (age, gender, country), device usage, and more. The goal is to build insightful queries to analyze platform data for decision-making.



This project simulates the backend database of a Netflix-like platform, where users subscribe to different plans, pay monthly fees, and watch content using various devices. This project’s objective is to develop SQL queries for:

- Analyzing monthly revenue and user behavior
- Understanding user demographics (age, gender, country)
- Tracking device usage patterns
- Payment history and subscription durations

## Database Schema

### Users Table

The **Users** table contains essential information about users who subscribe to the platform.

| Column Name        | Data Type     | Description                                      |
|--------------------|---------------|--------------------------------------------------|
| User_ID            | INT           | Unique identifier for each user                 |
| Serial_Number      | VARCHAR(50)   | Serial number of the user's subscription        |
| Subscription_Type  | VARCHAR(50)   | Type of subscription (e.g., Basic, Standard)    |
| Monthly_Revenue    | DECIMAL(10,2) | Monthly revenue generated by the user           |
| Join_Date          | DATE          | Date when the user joined the platform          |
| Last_Payment_Date  | DATE          | Last payment made by the user                   |
| Country            | VARCHAR(50)   | Country of the user                             |
| Age                | INT           | Age of the user                                 |
| Gender             | VARCHAR(10)   | Gender of the user                              |
| Device             | VARCHAR(50)   | Device used by the user (Laptop, Tablet, etc.)  |
| Plan_Duration      | INT           | Duration of the subscription plan (in months)   |

## SQL Queries

This project includes a variety of SQL queries that provide insights into the data. Below are the types of queries:

### Beginner Queries
- **Count total users**:
   ```sql
   SELECT COUNT(*) FROM users;
   ```

- **List all distinct subscription types**:
   ```sql
   SELECT DISTINCT Subscription_Type FROM users;
   ```

- **Find total revenue for "Basic" subscription**:
   ```sql
   SELECT SUM(Monthly_Revenue) FROM users WHERE Subscription_Type = 'Basic';
   ```

- **Find the average age of users**:
   ```sql
   SELECT AVG(Age) FROM users;
   ```

- **List users who joined after 01-Jan-2022**:
   ```sql
   SELECT * FROM users WHERE Join_Date > '2022-01-01';
   ```

### Intermediate Queries
- **Total revenue by country**:
   ```sql
   SELECT Country, SUM(Monthly_Revenue) AS Total_Revenue
   FROM users
   GROUP BY Country;
   ```

- **Average revenue per subscription type**:
   ```sql
   SELECT Subscription_Type, AVG(Monthly_Revenue) AS Average_Revenue
   FROM users
   GROUP BY Subscription_Type;
   ```

- **Number of users with subscription plans longer than 12 months**:
   ```sql
   SELECT COUNT(*) FROM users WHERE Plan_Duration > 12;
   ```

- **Most popular device used by users**:
   ```sql
   SELECT Device, COUNT(*) AS Device_Count
   FROM users
   GROUP BY Device
   ORDER BY Device_Count DESC
   LIMIT 1;
   ```

- **Percentage distribution of male and female users**:
   ```sql
   SELECT Gender,
          (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM users)) AS Gender_Percentage
   FROM users
   GROUP BY Gender;
   ```

### Advanced Queries
- **Find users who haven’t made a payment in the last 6 months**:
   ```sql
   SELECT * FROM users
   WHERE Last_Payment_Date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
   ```

- **Users with "Standard" subscription and age greater than 30**:
   ```sql
   SELECT * FROM users
   WHERE Subscription_Type = 'Standard'
     AND Age > 30;
   ```

- **Rank users by monthly revenue within each subscription type**:
   ```sql
   SELECT User_ID, Subscription_Type, Monthly_Revenue,
          RANK() OVER (PARTITION BY Subscription_Type ORDER BY Monthly_Revenue DESC) AS Revenue_Rank
   FROM users;
   ```

- **Average revenue of users per country who joined in 2023**:
   ```sql
   SELECT Country, AVG(Monthly_Revenue) AS Average_Revenue
   FROM users
   WHERE YEAR(Join_Date) = 2023
   GROUP BY Country;
   ```

- **Number of users in each revenue range**:
   ```sql
   SELECT
      CASE
          WHEN Monthly_Revenue BETWEEN 0 AND 250 THEN '0 - 250'
          WHEN Monthly_Revenue BETWEEN 250 AND 500 THEN '250 - 500'
          WHEN Monthly_Revenue BETWEEN 500 AND 750 THEN '500 - 750'
          -- Add more ranges as needed
          ELSE 'Other'
      END AS Revenue_Range,
      COUNT(*) AS User_Count
   FROM users
   GROUP BY Revenue_Range;
   ```

## How to Use

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/netflix-sql-project.git
   ```

2. **Setup your SQL database**:
   - Import the provided schema into your SQL environment (MySQL, PostgreSQL, etc.).
   - Insert sample data into the `users` table.

3. **Run Queries**:
   - Use an SQL management tool (like MySQL Workbench or pgAdmin) to run the queries and explore the data.

## Prerequisites

- A working SQL database setup (MySQL, PostgreSQL, etc.)
- Basic knowledge of SQL syntax (SELECT, JOIN, GROUP BY, etc.)
- A database management tool (e.g., MySQL Workbench, pgAdmin, etc.)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

