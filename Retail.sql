/* Step 1 : Database Setup*/

-- Create databse with name  retail
create database retail;
use retail;
-- Create a table name retail_sales with following structure and import record from csv file 
create table retail_sales
(
transactions_id INT PRIMARY KEY,
sale_date date,
sale_time time,
customer_id int,
gender varchar(10),
age int,
category varchar(35),
qunatity int,
price_per_unit float,
cogs float,
total_sale float
);
-- check retail_sales table 
select * from retail_sales;

/* Step 2 : Data Exploration & Cleaning */
-- Determine the total number of records
select count(*) from retail_sales;

--  Find the number of unique customers.
select count(distinct customer_id) from retail_sales;

-- Identify all unique product categories.

-- Check for and delete records with null values.
select * from retail_sales
where 
sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
gender IS NULL OR age IS NULL OR category IS NULL OR 
qunatity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
DELETE FROM retail_sales
WHERE 
sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
gender IS NULL OR age IS NULL OR category IS NULL OR 
qunatity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

/* Step 3 : Data Analysis & Findings */
-- Write a SQL query to retrieve all columns for sales made on '2022-11-05
Select * from retail_sales where sale_date = '2022-11-05';

-- Write a SQL Query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
select * from retail_sales 
where 
Category = "Clothing"
And 
extract(Year from Sale_date) = 2022
And
extract(Month from Sale_date) = 11
And
qunatity > 4 ;

-- Write a SQL query to calculate the total sales (total_sale) for each category.:
select sum(total_sale) as total_sales from retail_sales group by category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category;

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.:
Select * from retail_sales where total_sale > 1000;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select gender, category, count(transaction_id) from retail_sales group by gender,category;

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:


-- Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id, sum(total_sale) as total_sales from  retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
Limit 5;

-- Write a SQL query to find the number of unique customers who purchased items from each category.:
select distinct(customer_id) from retail_sales group by category ;

-- Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):







