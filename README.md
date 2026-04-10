# Book-Store-SQL-Database-Project-Sales-Customer-Analysis
End-to-end SQL project designing a Book Store database with tables, relationships, and business queries to analyze sales, customers, and inventory insights.
# 📚 Book Store SQL Database Project

## 📌 Project Overview
This project demonstrates the design and analysis of a **Book Store Management System** using SQL.  
It includes **database creation, table relationships, and business queries** to extract insights on books, customers, and orders.

---

## 🎯 Objectives
- Design a relational database system  
- Establish relationships using foreign keys  
- Perform data analysis using SQL queries  
- Generate business insights (sales, customers, inventory)

---

## 🗄️ Database Schema

### 📘 Books Table
- Book_ID (Primary Key)  
- Title  
- Author  
- Genre  
- Published Year  
- Price  
- Stock  

### 👤 Customers Table
- Customer_ID (Primary Key)  
- Name  
- Email  
- Phone  
- City  
- Country  

### 🧾 Orders Table
- Order_ID (Primary Key)  
- Customer_ID (Foreign Key)  
- Book_ID (Foreign Key)  
- Order_Date  
- Quantity  
- Total_Amount  

---

## 🔗 Relationships
- One customer → Many orders  
- One book → Many orders  
- Foreign keys ensure data integrity  

---

## 📊 Key Business Queries & Insights

### 📚 Book Analysis
- Books in **Fiction genre**  
- Books published after 1950  
- Most expensive book  
- Lowest stock book  

### 👥 Customer Analysis
- Customers from specific countries (e.g., Canada)  
- Customers with multiple orders  
- Customer with highest spending  

### 🛒 Order Analysis
- Orders placed in November 2023  
- Orders with quantity > 1  
- Orders with amount > $20  

### 💰 Sales & Revenue
- Total revenue generated  
- Revenue per category  
- Total books sold per genre  
- Total books sold per author  

### 📦 Inventory Analysis
- Total stock available  
- Remaining stock after orders  
- Inventory tracking per book  

---

## 🛠️ Tools & Technologies Used
- SQL (MySQL)  
- Database Design  
- Data Analysis  
- Joins & Aggregations  

---

## 🚀 How to Run
1. Create database:
   ```sql
   CREATE DATABASE book_store;
   USE book_store;
