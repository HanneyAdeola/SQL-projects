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

## 🔹 Task 1: Warehouse Capacity & Staffing Analysis
This section evaluates warehouse capacity and workforce distribution.

### Key Questions:
- Which warehouses have storage capacity above 15,000 units?
- How are employees distributed across warehouse locations?

### Business Value:
- Identifies **high-capacity warehouses**
- Highlights staffing differences across regions
- Supports workforce planning and operational scaling

---

## 🔹 Task 2: Inventory Insights
This section analyzes inventory distribution and risk.

### Key Questions:
- What is the total quantity of each product across all warehouses?
- Which products are most heavily stocked?
- Which inventory items are nearing expiry within the next 3 months?
- How dependent are we on each supplier?

### Business Value:
- Prevents **inventory waste** due to expiration
- Identifies **overstocked products**
- Supports supplier risk management

---

## 🔹 Task 3: Shipping Performance Analysis
This section evaluates logistics efficiency and costs.

### Key Questions:
- What is the average shipping cost per destination?
- Which carriers handle the highest shipment volumes?
- How efficient is each carrier in terms of transit time?

### Business Value:
- Identifies **high-cost shipping routes**
- Evaluates carrier performance
- Supports logistics optimization decisions

---

## 🔹 Task 4: Summary & Operational KPIs
This section provides high-level operational insights.

### Key Questions:
- How does shipment volume vary by month?
- What is the warehouse utilization rate relative to capacity?

### Business Value:
- Reveals **seasonal shipment trends**
- Highlights underutilized or overutilized warehouses
- Supports capacity planning and expansion decisions

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

