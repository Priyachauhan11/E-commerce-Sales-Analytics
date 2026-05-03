CREATE TABLE orders (
    order_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
	region VARCHAR(50),
	quantity INT,
    sales FLOAT,
    profit FLOAT    
);

-- Total Sales & Profit
SELECT 
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM orders;

--Monthly Trend
SELECT 
EXTRACT(MONTH FROM order_date) AS month,
SUM(sales) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Region-wise Sales
SELECT region, SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

--Top 5 Products
SELECT product_name, SUM(sales) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

--Product Profit Ranking
SELECT product_name,
SUM(profit) AS total_profit,
RANK() OVER (ORDER BY SUM(profit) DESC) AS rank
FROM orders
GROUP BY product_name;
SELECT * FROM orders;