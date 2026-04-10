-- create Database
CREATE DATABASE book_store;
USE book_store;

-- create Books table 
CREATE TABLE books (
    Book_ID INT PRIMARY KEY ,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(150) NOT NULL,
    Genre VARCHAR(100),
    Published_Year YEAR,
    Price DECIMAL(10,2) CHECK (Price > 0),
    Stock INT CHECK (Stock >= 0)
);
-- create customer table
CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(150) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);
-- create order table
CREATE TABLE orders (
    Order_ID INT PRIMARY KEY ,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES books(Book_ID)
);
select * from customers;
select * from books;
select * from orders;

-- 1. Retrieve all books in the "Fiction" genre
select * 
from books 
where genre = "Fiction";

-- 2. Find books published after the year 1950
select * 
from books
where published_year >1950;
-- 3. list all customers from the canada
select *
from customers 
where country ="canada";
-- 4.show orders place in november 2023
select *
from orders
where order_date between "2023-11-01" and "2023-11-30";

-- 5.Retrieve the total stock of books available
select sum(stock) as total_stock
from books;
-- 6.Find the details of the most expensive books
select *
from books
order by price desc
limit 1;
-- 7. show all customers who orderd more than 1 quantity of a book
select * 
from orders
where quantity>1;

-- 8. retrieve al orders where the total amount exceeds $20:
select * 
from orders
where total_amount>20;
-- 9. list all genres available in the books table:
select distinct genre
from books;
-- 10. find the book with the lowest  stock:
select * from books 
order by stock;
-- 11. calculate the total revenue generated from all orders:
select sum(total_amount) as revenue
from orders;
 select*from books;
 -- 12 retrieve the total number of books sold for each genre:
 select b.genre,sum(o.quantity) as total_books_sold
 from orders o join books b on o.book_id=b.book_id
 group by b.genre;
 
-- find the average price of books in the "fantasy" genre:
select avg(price) as average_price
from books
where genre="fantasy";

-- list customer who have placed atleast 2 orders
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- Find the most frequently ordered book:
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3;

-- Retrieve the total quantity of books sold by each author:
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;

--  List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;

--  Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;

-- Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;

