# 🥖 Pơ Bread – Store Management Database System

## 📌 Overview

**Pơ Bread** is a personal database design project that models the core operations of a small bakery store selling bread, pastries, and beverages. The system focuses on **sales management, customer loyalty, and data integrity**, implemented using **SQL Server and T‑SQL**.

This project was developed as a **personal / academic project** and is presented here as part of my **portfolio for internship and entry‑level opportunities**.

---

## 🎯 Project Objectives

* Design a normalized relational database for a retail food business
* Automate order processing and revenue calculation
* Manage customers, employees, products, and invoices
* Apply advanced database techniques (constraints, triggers, procedures, functions)
* Ensure data consistency and integrity

---

## 🏗 System Scope & Features

### 1. Product & Category Management

* Manage product categories (bread, pastries, beverages)
* Store product details: name, price, status, category
* Enforce price and status constraints

### 2. Order Management

* Support multiple order types (dine‑in, takeaway, delivery)
* Automatically calculate order totals
* Track order status and creation time

### 3. Customer Management & Loyalty

* Store customer personal information
* Automatically accumulate loyalty points
* View customer purchase history

### 4. Invoice & Payment Handling

* Generate one invoice per order
* Support multiple payment methods
* Track payment amounts and invoice dates

### 5. Reporting & Analytics

* Calculate daily revenue using a user‑defined function
* Identify best‑selling products
* Analyze sales by date and category

---

## 🧩 Entity Relationship Model

The database is designed based on a complete **ER Diagram**, including the following main entities:

* **LoaiSanPham** (Product Category)
* **SanPham** (Product)
* **KhachHang** (Customer)
* **NhanVien** (Employee)
* **DonHang** (Order)
* **ChiTietDonHang** (Order Details)
* **HoaDon** (Invoice)

Relationships include:

* One‑to‑many (Category → Product, Customer → Order)
* Many‑to‑many (Order ↔ Product via Order Details)
* One‑to‑one (Order → Invoice)

📌 The ER diagram is provided in the `diagrams/` folder.

---

## 🛠 Technologies & Tools

* **Database:** SQL Server
* **Language:** T‑SQL
* **Techniques Used:**

  * Primary & Foreign Keys
  * CHECK, UNIQUE, DEFAULT constraints
  * Triggers
  * Stored Procedures
  * User‑Defined Functions

---

## ⚙ Advanced Database Implementation

### Triggers

* **Auto‑update order total** when order details change
* **Automatically calculate loyalty points** after invoice creation

### Stored Procedure

* `sp_TaoDonHang`: Create a new order and return the generated Order ID

### Function

* `fn_TinhDoanhThuNgay`: Calculate total revenue for a given date

---

## 📂 Project Structure

```
po-bread-store-management-db/
│
├── README.md
├── database/
│   ├── schema.sql        # Table creation & constraints
│   ├── triggers.sql      # Triggers
│   ├── procedures.sql    # Stored procedures
│   ├── functions.sql     # User-defined functions
│   └── sample_data.sql   # Sample data & test queries
│
├── diagrams/
│   └── er-diagram.jpeg
│
└── docs/
    └── Pơ Bread.pdf
```

---

## ▶ How to Run the Project

1. Open **SQL Server Management Studio (SSMS)**
2. Create a new database (e.g. `PoBreadDB`)
3. Execute scripts in the following order:

   1. `schema.sql`
   2. `triggers.sql`
   3. `procedures.sql`
   4. `functions.sql`
   5. `sample_data.sql`
4. Run the sample queries to verify functionality

---

## 🚀 Future Improvements

* Recipe‑based inventory deduction
* Detailed ingredient stock management
* Role‑based user authorization
* Integration with a web or mobile application

---

## 👤 Author

**Nguyễn Khánh Sơn**
Database Design & SQL Developer (Entry‑Level)

📌 This project demonstrates my ability to design relational databases, write clean SQL, and apply real‑world business logic using T‑SQL.
