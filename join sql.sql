CREATE DATABASE store;
USE store;
CREATE TABLE customer(
cid INT PRIMARY KEY AUTO_INCREMENT , 
cname VARCHAR(100) NOT NULL , 
cadd VARCHAR(100) NOT NULL , 
cmob VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO customer VALUES(101,'Rohan Singh','Noida','78354834355');
INSERT INTO customer(cname,cadd,cmob) VALUES
('Mohan Singh','Delhi','9389483435'),
('Suresh Kumar','GZB','8752736834'),
("Riya Singh",'Noida','8623639745');
SELECT * FROM customer;

CREATE TABLE product(
pid INT PRIMARY KEY AUTO_INCREMENT ,
pname VARCHAR(100) NOT  NULL , 
price DECIMAL(8,2) NOT NULL 
);
INSERT INTO product VALUE(501,'Keyboard',980);
INSERT INTO product(pname,price) VALUES
('Mouse',530),
("SSD",9750),
("HDD",4270),
("Monitor",5300);
SELECT * FROM product;


CREATE TABLE orders(
oid INT PRIMARY KEY AUTO_INCREMENT ,
cid INT NOT NULL , 
pid INT NOT NULL , 
qty INT DEFAULT 1
); 
INSERT INTO orders(cid,pid,qty) VALUES
(102,504,5),
(103,502,7),
(108,503,7),
(103,509,4),
(109,509,5); 
select * from orders;
SELECT * FROM customer
JOIN orders;

SELECT * FROM customer
CROSS JOIN orders;
SELECT * FROM customer
JOIN orders
ON customer.cid = orders.cid;

SELECT * FROM customer
INNER JOIN orders
ON customer.cid = orders.cid;

SELECT * FROM customer AS c
INNER JOIN orders AS o
ON c.cid = o.cid;

SELECT * FROM customer c
INNER JOIN orders o
ON c.cid = o.cid;
SELECT * FROM customer
JOIN orders
USING (cid);

SELECT * FROM customer c
JOIN orders o
ON c.cid = o.cid
JOIN product p
ON o.pid = p.pid;

SELECT c.*,pname,price,qty FROM customer c
JOIN orders o
ON c.cid = o.cid
JOIN product p
ON o.pid = p.pid;

SELECT c.cid,cname,cadd,cmob,pname,price,qty,price*qty AS Amt FROM customer c
JOIN orders o ON c.cid=o.cid JOIN product p ON o.pid=p.pid;
