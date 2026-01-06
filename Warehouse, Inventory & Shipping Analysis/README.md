# 📦 Warehouse, Inventory & Shipping Analysis (SQL)

## 📌 Project Overview
This project analyzes **warehouse operations, inventory levels, and shipping performance** using SQL.  
The objective is to support **operational decision-making** by identifying capacity utilization, staffing efficiency, inventory risks, and logistics performance.

The analysis answers key business questions related to:
- Warehouse capacity and workforce allocation
- Inventory distribution and expiry risks
- Supplier dependency
- Shipping cost and carrier efficiency
- Seasonal shipment trends

---

## 🧰 Tools Used
- **SQL (MySQL)**
  - Aggregations
  - Joins
  - Date functions
  - Grouping and sorting
- **Relational Database Design**
  - Warehouse information
  - Inventory records
  - Shipping logs

---

## 🗂️ Dataset Description
The database contains the following key tables:
- **warehouse_information**: warehouse capacity, location, manager, and staffing
- **inventory_records**: product quantities, suppliers, and expiry dates
- **shipping_log**: shipment details including cost, carrier, destination, and delivery dates

---

## 3. Analysis & Findings
## 🔹 Task 1: Warehouse Capacity & Staffing Analysis
### Q1: Which warehouses have storage capacity above 15,000 units?
**SQL Query:**
```sql
SELECT warehouse_id, location, capacity, manager, number_of_employees
FROM warehouse_information
WHERE capacity > 15000;
```
--- 

### Q2: What is the average number of employees per location?
**SQL Query:**

```sql
SELECT location, AVG(number_of_employees) AS avg_employees
FROM warehouse_information
GROUP BY location;
```
---
## 🔹 Task 2: Inventory Insights
### Q3: Total quantity of each product across all warehouses
**SQL Query:**
```sql
SELECT product_name, SUM(quantity) AS total_quantity
FROM inventory_records
GROUP BY product_name
ORDER BY total_quantity DESC;
```
---

## Q4: Products expiring in the next 3 months
**SQL Query:**
```sql
SELECT wi.warehouse_id, location, product_name, quantity, supplier, expiry_date
FROM inventory_records ir
JOIN warehouse_information wi ON ir.warehouse_id = wi.warehouse_id
WHERE expiry_date <= DATE_ADD(CURDATE(), INTERVAL 3 MONTH)
ORDER BY expiry_date ASC;
```
---

## Q5: Total inventory by supplier
**SQL Query:**
```sql
SELECT supplier, SUM(quantity) AS total_quantity
FROM inventory_records
GROUP BY supplier
ORDER BY total_quantity DESC;
```
---
## 🔹 Task 3: Shipping Performance
### Q6: Average shipping cost per destination
**SQL Query:**
```sql
SELECT destination, ROUND(AVG(shipping_cost),1) AS avg_shipping_cost
FROM shipping_log
GROUP BY destination
ORDER BY avg_shipping_cost DESC;
```
--- 

## Q7: Top carriers by shipments
**SQL Query:**
```sql
SELECT carrier, COUNT(shipment_id) AS total_shipments
FROM shipping_log
GROUP BY carrier
ORDER BY total_shipments DESC;
```
---

## Q8: Average transit time by carrier
**SQL Query:**
```sql
SELECT carrier, AVG(DATEDIFF(arrival_date, dispatch_date)) AS avg_transit_days
FROM shipping_log
GROUP BY carrier
ORDER BY avg_transit_days ASC;
```
---

## 🔹 Task 4: Summary Analysis
### Q9: Monthly shipment volume
**SQL Query:**
```sql
SELECT DATE_FORMAT(dispatch_date, '%Y-%m') AS month, COUNT(shipment_id) AS total_shipments
FROM shipping_log
GROUP BY month
ORDER BY month ASC;
```
---

## Q10: Warehouse utilization rate
**SQL Query:**
```sql
SELECT wi.warehouse_id, wi.location, ROUND(SUM(ir.quantity/capacity*100)) AS utilization_rate
FROM warehouse_information wi
JOIN inventory_records ir ON wi.warehouse_id = ir.warehouse_id
GROUP BY wi.warehouse_id, wi.location
ORDER BY utilization_rate DESC;
```
---

## 📊 Key Insights
- Certain warehouses operate close to full capacity, indicating potential expansion needs.
- Inventory is unevenly distributed across products and suppliers.
- Some suppliers contribute a disproportionately large share of total inventory.
- Shipping costs vary significantly by destination.
- Carrier performance differs in both shipment volume and delivery speed.

---

## 💡 Recommendations
- Reallocate inventory to reduce overcapacity in high-utilization warehouses.
- Proactively manage products approaching expiry to reduce waste.
- Diversify suppliers to reduce dependency risks.
- Renegotiate shipping contracts on high-cost routes.
- Prioritize efficient carriers with lower average transit times.

---

## 🚀 Conclusion
This project demonstrates the use of **SQL for operational and logistics analysis**, focusing on real-world business problems.  
It highlights the ability to transform raw transactional data into actionable insights that support efficient warehouse and supply chain management.
