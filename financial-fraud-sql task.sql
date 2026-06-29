CREATE SCHEMA Finance;
USE Finance;
Select * from cc_data;
Select * from location_data;
--------------------------------------------------------------------------------------------------------
-- Calculate the total number of transactions in the cc_data table
Select Count(*) as Total_transaction
From cc_data;
---------------------------------------------------------------------------------------------------------------
-- Identify the top 10 most frequent merchants in the cc_data table
Select merchant,count(*) as count_transaction
From cc_data
Group by merchant
Order by count_transaction DESC
Limit 10;
----------------------------------------------------------------------------------------------------------------------------
-- Find the average transaction amount for each category of transactions in the cc_data table
Select category,avg(amt) avg_transaction_amount
From cc_data
Group by category;
-------------------------------------------------------------------------------------------------------------------------------
-- Determine the number of fraudulent transactions and the percentage of total transactions that they represent
SELECT 
    SUM(is_fraud) AS fraud_transactions,
    COUNT(*) AS total_transactions,
    CONCAT(
        ROUND((SUM(is_fraud) * 100.0 / COUNT(*)), 2),
        '%'
    ) AS fraud_percentage
FROM cc_data;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Join the cc_data and location_data tables to identify the latitude and longitude of each transaction
Select 
c.index,
c.trans_date_trans_time,
c.cc_num,
l.cc_num,
l.lat,
l.long
From cc_data c
Join Location_data l
On c.cc_num=l.cc_num;
----------------------------------------------------------------------------------------------------------------------------
-- Identify the city with the highest population in the cc_data table
Select city,state,city_pop
From cc_data
Order By city_pop DESC
Limit 1;
------------------------------------------------------------------------------------------------------------------------------------------------
-- Find the earliest and latest transaction dates in the cc_data table
Select Min(trans_date_trans_time) as earliest_transaction_date,
Max(trans_date_trans_time) as earliest_transaction_date
From cc_data;
-------------------------------------------------------------------------------------------------------------------------------------
-- What is the total amount spent across all transactions in the cc_data table?
Select Round(sum(amt),2) as total_spent
From cc_data;
------------------------------------------------------------------------------------------------------------------------------------------------
-- How many transactions occurred in each category in the cc_data table?
Select Category,count(*) as total_transaction
From cc_data
Group by category
Order by total_transaction DESC;
------------------------------------------------------------------------------------------------------------------------------------------
-- What is the average transaction amount for each gender in the cc_data table?
Select gender,Round(avg(amt),2) as transacion_amt
From cc_data
Group by gender;
------------------------------------------------------------------------------------------------------------------------------------
-- Which day of the week has the highest average transaction amount in the cc_data table?
Select
DAYNAME(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) as day_of_week,
Round(Avg(amt),2) as Avg_transaction
From cc_data
Group by day_of_week
Order by Avg_transaction DESC
LIMIT 1;































