CREATE DATABASE company_sales;
USE company_sales;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    gender VARCHAR(10)
);
describe customers;
INSERT INTO customers VALUES
(1, 'Raj', 'Delhi', 'Male'),
(2, 'Aman', 'Mumbai', 'Male'),
(3, 'Simran', 'Delhi', 'Female'),
(4, 'Priya', 'Bangalore', 'Female'),
(5, 'Ravi', 'Mumbai', 'Male'),
(6, 'Neha', 'Delhi', 'Female');
select * from customers;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    category VARCHAR(50),
    sales INT,
    order_date DATE,
    
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
INSERT INTO orders VALUES
(101, 1, 'Laptop', 'Electronics', 50000, '2026-01-05'),
(102, 1, 'Mouse', 'Electronics', 1200, '2026-01-07'),
(103, 2, 'Shoes', 'Fashion', 3000, '2026-01-10'),
(104, 3, 'Phone', 'Electronics', 25000, '2026-01-11'),
(105, 4, 'Bag', 'Fashion', 2000, '2026-01-15'),
(106, 5, 'Laptop', 'Electronics', 55000, '2026-01-20'),
(107, 6, 'Watch', 'Accessories', 4000, '2026-01-25'),
(108, 2, 'T-shirt', 'Fashion', 1500, '2026-01-28'),
(109, 3, 'Headphones', 'Electronics', 3500, '2026-02-01'),
(110, 4, 'Shoes', 'Fashion', 2800, '2026-02-05');

#1

select customer_id, sum(sales)
from orders
group by customer_id;

#2

select city, customer_name
from customers
group by city, customer_name;

#3

select customers.city, sum(orders.sales) AS total_sales
from customers
join orders 
on customers.customer_id = orders.customer_id 
group by customers.city;

#4

select customers.customer_name, orders.product
from customers
join orders
on customers.customer_id = orders.customer_id
group by orders.product, customers.customer_name;

#5

select customers.customer_id, sum(orders.sales)
from orders
join customers
on customers.customer_id = orders.customer_id
group by customers.customer_id;

#6

select customers.customer_name, orders.order_date
from orders
join customers
on customers.customer_id = orders.customer_id
group by customers.customer_name, orders.order_date;

#7

SELECT customers.city, SUM(orders.sales)
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.city;