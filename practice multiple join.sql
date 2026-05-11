CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50),
signup_date DATE
);
select * from customers;
describe customers;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv'
into table customers
fields terminated by ','
lines terminated by '/n'
ignore 1 rows;
show variables like "secure_file_priv";
truncate customers;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
describe products;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
into table products
fields terminated by ','
lines terminated by '/n'
ignore 1 rows;
select * from products;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
describe orders;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
into table orders
fields terminated by ','
lines terminated by '/n'
ignore 1 rows;
select * from orders;
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
describe order_items;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_items.csv'
into table order_items
fields terminated by ','
lines terminated by '/n'
ignore 1 rows;
select * from order_items;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM customers;
DELETE FROM products;

select customers.customer_id, customers.city
from customers
group by customers.customer_id, customers.city;

select customers.customer_id, orders.order_date
from orders
join customers
on customers.customer_id = orders.customer_id
group by customers.customer_id, orders.order_date;

# multiple table join
select customers.customer_name, orders.order_id, order_items.quantity
from customers
join orders
on customers.customer_id = orders.customer_id
join order_items
on orders.order_id = order_items.order_id;

# group by 
SELECT 
    customers.customer_name,
    SUM(order_items.quantity) AS total_quantity
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
GROUP BY customers.customer_name;

