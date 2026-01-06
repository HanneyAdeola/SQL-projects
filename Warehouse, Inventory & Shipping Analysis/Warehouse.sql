create database project;
use project;
/*Task 1: Warehouse Capacity and Staffing
1. Generate a list of warehouses where the storage capacity is above 15,000 units.
Include details on location, manager, and the number of employees.*/
SELECT warehouse_id, location, capacity, manager, number_of_employees
FROM warehouse_information
WHERE capacity > 15000;

/*2. Calculate the average number of employees working in warehouses at each location. 
This will help us gauge our staffing levels in various regions*/
SELECT location, AVG(number_of_employees) AS avg_employees
FROM warehouse_information
GROUP BY location;

/*Task 2: Inventory Insights
Find the total quantity of each product type across all warehouses. 
Please organize the data by product name so we can quickly see which products are stocked most heavily.
Inventory Levels by Product*/
SELECT product_name, SUM(quantity) AS total_quantity
FROM inventory_records
GROUP BY product_name
ORDER BY total_quantity DESC;

/*4. Expiring Inventory
Identify any products with an expiry date within the next 3 months. Include warehouse location, product name, quantity, 
and supplier in your report.This will help us manage perishable stock proactively.*/
SELECT wi.warehouse_id, location, product_name, quantity, supplier, expiry_date
FROM inventory_records ir
JOIN warehouse_information wi ON ir.warehouse_id = wi.warehouse_id
WHERE expiry_date <= DATE_ADD(CURDATE(), INTERVAL 3 MONTH)
ORDER BY expiry_date ASC;

/*5. Inventory by Supplier
Group inventory by supplier and calculate the total quantity of items supplied by each. 
This will give us insight into our dependency on each supplier.*/
SELECT supplier, SUM(quantity) AS total_quantity
FROM inventory_records
GROUP BY supplier
ORDER BY total_quantity DESC;

/*Task 3: Shipping Performance
6. Calculate the average shipping cost per destination. This will help us evaluate where our shipping expenses 
are highest.*/
SELECT destination, round(AVG(shipping_cost),1) AS avg_shipping_cost
FROM shipping_log
GROUP BY destination
ORDER BY avg_shipping_cost DESC;

/*7. Top Carriers by Shipments
Identify which carriers have handled the most shipments for us over the past year. Include the count of 
shipments for each carrier.*/
SELECT carrier, COUNT(shipment_id) AS total_shipments
FROM shipping_log
GROUP BY carrier
ORDER BY total_shipments DESC;

/*8. Dispatch to Arrival Time Analysis
Calculate the average transit time (difference between dispatch date and arrival date) for each carrier. 
This will help us assess the efficiency of each carrier.*/
SELECT carrier, AVG(DATEDIFF(arrival_date, dispatch_date)) AS avg_transit_days
FROM shipping_log
GROUP BY carrier
ORDER BY avg_transit_days ASC;

/*Task 4: Summary Analysis
9. Monthly Shipment Volume
Generate a summary of the total number of shipments each month over the past year. 
I’d like to see any seasonal trends in our shipment volumes.*/
SELECT DATE_FORMAT(dispatch_date, '%Y-%m') AS month, COUNT(shipment_id) AS total_shipments
FROM shipping_log
GROUP BY month
ORDER BY month ASC;

/*10. Warehouse Utilization Rate
Calculate the average inventory quantity as a percentage of capacity for each warehouse. 
This will give us a sense of our warehouse utilization levels.*/
SELECT wi.warehouse_id,wi.location, round(SUM(ir.quantity/capacity*100)) AS utilization_rate
FROM warehouse_information wi
JOIN inventory_records ir ON wi.warehouse_id = ir.warehouse_id
GROUP BY wi.warehouse_id,wi.location
ORDER BY utilization_rate DESC;

SELECT wi.warehouse_id, round(SUM(ir.quantity/capacity*100)) AS utilization_rate
FROM warehouse_information wi
JOIN inventory_records ir ON wi.warehouse_id = ir.warehouse_id
GROUP BY wi.warehouse_id
ORDER BY utilization_rate DESC;

SELECT wi.location, round(SUM(ir.quantity/capacity*100)) AS utilization_rate
FROM warehouse_information wi
JOIN inventory_records ir ON wi.warehouse_id = ir.warehouse_id
GROUP BY wi.location
ORDER BY utilization_rate DESC;
