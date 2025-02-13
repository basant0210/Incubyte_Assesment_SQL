
 -- Citywise Total Sales:
 SELECT city,SUM(Transaction_amount) AS total_sales FROM assesment
 Group by city
 order by total_sales desc;
 
 -- Best-selling products by transaction amount and quantity:
 SELECT Product_Name,SUM(Transaction_amount) AS total_sales,
 SUM(Quantity) AS total_quantity_sold
 FROM assesment
 Group by Product_Name
 order by total_sales desc;
 
 -- Monthly sales trends (Revenue and Quantity sold)
 SELECT 
    EXTRACT(YEAR FROM transaction_Date) AS year,
    EXTRACT(MONTH FROM transaction_Date) AS month,
    SUM(transaction_amount) AS total_revenue,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
GROUP BY year, month
ORDER BY year, month;

-- Total returns and average feedback score:
SELECT Customer_Id,
    SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END) AS total_returns,
    AVG(Feedback_Score) AS avg_feedback_score
FROM assesment
Group by Customer_Id;

-- Average shipping cost and average delivery time
SELECT 
    AVG(shipping_Cost) AS avg_shipping_cost,
    AVG(Delivery_time_days) AS avg_delivery_time
FROM assesment;

-- Total sales for promotional vs non-promotional transactions
SELECT 
    is_promotional,
    SUM(transaction_amount) AS total_sales_value,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
GROUP BY is_promotional;

-- Sales by region
SELECT 
    region,
    SUM(transaction_amount) AS total_sales_value,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
GROUP BY region;

-- Sales by store type
SELECT 
    store_type,
    SUM(transaction_amount) AS total_sales_value,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
GROUP BY Store_type;

-- Breakdown of total sales by customer age group
SELECT 
    CASE
        WHEN Customer_age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Customer_age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Customer_age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Customer_age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+' 
    END AS age_group,
    SUM(Transaction_amount) AS total_sales_value,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
GROUP BY age_group;

-- Breakdown of sales by payment method
SELECT 
    Payment_Method,
    SUM(transaction_amount) AS total_sales_value,
    COUNT(DISTINCT transaction_id) AS total_transactions
FROM assesment
GROUP BY payment_method;

-- Breakdown of sales by customer gender and store type
SELECT 
    Customer_Gender,
    Store_type,
    SUM(transaction_amount) AS total_sales_value,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
GROUP BY customer_gender, Store_type;

-- Sales Breakdown by Product and Region
SELECT 
    Product_Name,
    region,
    SUM(transaction_amount) AS total_sales_value,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
GROUP BY product_name, region
ORDER BY total_sales_value DESC;

-- where product name= laptop and total sales more than 144000
SELECT 
    Product_Name,
    region,
    SUM(transaction_amount) AS total_sales_value,
    SUM(Quantity) AS total_quantity_sold
FROM assesment
where product_name='Laptop'
GROUP BY product_name, region
Having total_sales_value > 144000
ORDER BY total_sales_value DESC;

-- Max Transaction amount & Minimum transaction amount
select Max(Transaction_amount) as max_trans ,Min(Transaction_amount) as Minimum
 from assesment;
 
 -- Count Number of Customer
 select count(distinct Customer_id) from assesment;
 
 -- Cumulatiive Sum of transactions
 select Customer_id ,city,Transaction_amount,
 Sum(Transaction_amount) over (order by city)
 as Cumulative_transaction_amount from assesment;
 
 










