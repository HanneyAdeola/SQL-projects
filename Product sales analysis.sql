create table sales
(sales_id int primary key auto_increment,
product_id int,
customer_name text,
location text,
sales_person text,
customer_type text,
Dates datetime,
Quantity int,
values_in_Rupiah int);

insert into sales(product_id,customer_name,location,sales_person,customer_type,Dates,Quantity,values_in_Rupiah)
values(100,'Holiday Inn','Bandung','Gates','Hotel','2019-10-01 00:00:00',25,50000000),
(200,'McKinsey','Jakarta','Kristi','Corporate','2019-11-01 00:00:00',300,35000000),
(300,'Ritz Carlton', 'Jakarta', 'Oprah','Hotel','2019-12-01 00:00:00',40,65000000),
(100,'McD','Makassar','Mark','Restaurant','2018-10-01 00:00:00',60,85000000),
(200,'Sate Senayan','Bali','Mercy','Restaurant','2018-11-01 00:00:00',220,29000000),
(300,'Hypermart','Medan','Frans','Retail','2018-12-01 00:00:00',20,22000000),
(100,'Holiday Inn','Jakarta','Gates','Hotel','2016-10-01 00:00:00',29,58000000),
(200,'McD','Jakarta','Mark','Restaurant','2016-11-01 00:00:00',100,200000000),
(300,'Sate Senayan','Jakarta','Mercy','Restaurant','2016-12-01 00:00:00',150,19000000),
(100,'Grand Hayat','Jakarta','Merry','Hotel','2017-10-01 00:00:00',33,58000000),
(200,'Microsoft','Jakarta','Kristi','Corporate','2017-11-01 00:00:00',22,40000000),
(300,'Google','Jakarta','William','Corporate','2017-12-01 00:00:00',150,18000000);

create table products(
product_id int,
product_name varchar(225),
brand varchar(225),
U_o_M varchar(225));
INSERT INTO products(product_ID,product_name,brand,U_o_M)
values(100, 'Illy Ground 250 Gr', 'illy', 'Kg'),
(200, 'Viktory Ground 500 Gr', 'Viktory', 'Kg'),
(300, 'San Pellegrino Sparkling 500 MI', 'Water', 'Bottle'),
(400, 'Mango Puree Sorbetto', 'Ice Cream','Kg');

The SQL queries provided allow you to extract several key insights from the sales and products tables. Here are some significant insights:

1. High-Value Sales:
   select * from sales where values_in_rupiah > 30000000 order by values_in_rupiah desc;
    - This query shows sales transactions where the value exceeds 30,000,000 Rupiah, sorted by the highest value. Insight: Identifies the most significant sales transactions.

2. Customer Sales Trends:
   select customer_name, customer_type, dates, values_in_rupiah from sales order by dates;
   - This query shows sales data organized by date, providing insights into sales trends over time for different customers.

3. Sales Channel Analysis:
   select customer_name, customer_type as channel, dates, values_in_rupiah from sales order by dates;
   - Similar to the previous query but with customer_type labeled as channel, giving insights into sales distribution across different customer channels.

4. Sales by Customer Type:
   select customer_type, sum(values_in_rupiah) from sales group by customer_type order by sum(values_in_rupiah) desc;
    - This query summarizes total sales by customer type, sorted by highest to lowest total sales. Insight: Highlights which customer types generate the most revenue.

5. Sales Details with Product Information:
   select a.product_id, b.product_id, a.dates, a.sales_person, a.customer_type, b.product_name, b.brand, a.values_in_rupiah
   from sales a inner join products b on a.product_id=b.product_id;
   - This join query combines sales and product information, providing detailed insights into sales performance per product.

6. Sales by Specific Salesperson:
   select a.product_id, b.product_id, a.dates, a.sales_person, a.customer_type, b.product_name, b.brand, a.values_in_rupiah
   from sales a inner join products b on a.product_id=b.product_id
   where sales_person = 'kristi' and YEAR(dates) between 2017 and 2019 order by values_in_rupiah;
     - This query focuses on sales by a specific salesperson (Kristi) within a date range. Insight: Assesses individual salesperson performance over time.


7. Total and Average Sales by Product:
   select b.product_name, sum(a.values_in_rupiah), sum(a.quantity)
   from sales a inner join products b on a.product_id=b.product_id group by product_name;
   - This query sums up total sales and quantities per product. Insight: Identifies top-selling products by revenue and volume.
    
   select b.product_name, avg(a.values_in_rupiah), avg(quantity)
   from sales a inner join products b on a.product_id=b.product_id group by product_name;
    - This query calculates average sales and quantities per product. Insight: Provides an average performance metric for each product.

8. Maximum and Minimum Sales per Product:
   select b.product_name, max(a.values_in_rupiah) as maximum, max(quantity)
   from sales a inner join products b on a.product_id=b.product_id group by product_name;
   - This query retrieves the maximum sales value and quantity for each product. Insight: Identifies peak sales performances for products.
   
   select b.product_name, min(a.values_in_rupiah), min(quantity)
   from sales a inner join products b on a.product_id=b.product_id group by product_name;
    - This query retrieves the minimum sales value and quantity for each product. Insight: Shows the lowest sales instances for products.


9. Total Sales by Year:
   select year(dates) as YEARR, sum(values_in_rupiah) as total_sales
   from sales group by YEARR;
   - This query calculates total sales for each year. Insight: Tracks annual sales performance and growth trends.

10. Combined Sales and Product Insights(Product Name and Sales Value)
   select b.product_name, a.values_in_rupiah
   from sales a inner join products b on a.product_id = b.product_id;
   - This join query provides the product names along with their corresponding sales values. Insight: Directly correlates products with their sales performance.

Key Insights Summary:
- Top Customers and Channels: Identify which customers and customer types are most valuable.
- Sales Trends: Understand how sales are distributed over time and across different locations.
- Product Performance: Gain detailed insights into how different products are performing in terms of total sales, average sales, and peak sales.
- Salesperson Effectiveness: Evaluate the performance of individual salespersons.
- Annual Growth:* Monitor yearly sales performance to gauge overall business growth.



 
