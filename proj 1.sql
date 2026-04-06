
create database office;
use office;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Amit', 1, 30000),
(102, 'Neha', 2, 50000),
(103, 'Raj', 2, 45000),
(104, 'Simran', 3, 40000),
(105, 'Karan', NULL, 35000);

INSERT INTO Projects VALUES
(1, 'Website', 102),
(2, 'App', 103),
(3, 'Audit', 104),
(4, 'Recruitment', 101);
SELECT e.emp_name, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

SELECT * FROM Employees
WHERE dept_id IS NULL;

SELECT d.dept_name, e.emp_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id;

SELECT e.emp_name, e.salary, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id;

SELECT p.project_name, e.emp_name
FROM Projects p
JOIN Employees e ON p.emp_id = e.emp_id;

SELECT * FROM Employees
WHERE dept_id IS NULL;

SELECT e.emp_name, p.project_name
FROM Employees e
LEFT JOIN Projects p ON e.emp_id = p.emp_id;

SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;


SELECT e.emp_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'HR';

SELECT e.emp_name, d.dept_name, p.project_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id
LEFT JOIN Projects p ON e.emp_id = p.emp_id;

SELECT emp_id
FROM Projects
GROUP BY emp_id
HAVING COUNT(project_id) > 1;

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT d.dept_name
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 2;

SELECT e.emp_name
FROM Employees e
LEFT JOIN Projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

SELECT p.project_name
FROM Projects p
LEFT JOIN Employees e ON p.emp_id = e.emp_id
WHERE e.emp_id IS NULL;

SELECT e.emp_name, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary > 40000;

SELECT dept_id, MAX(salary) AS highest_salary
FROM Employees
GROUP BY dept_id;
SELECT * FROM departments;

SELECT dept_id, MAX(salary) AS second_highest
FROM Employees e1
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees e2
    WHERE e1.dept_id = e2.dept_id
)
GROUP BY dept_id;

SELECT e.*
FROM Employees e
JOIN (
    SELECT dept_id, AVG(salary) avg_sal
    FROM Employees
    GROUP BY dept_id
) a ON e.dept_id = a.dept_id
WHERE e.salary > a.avg_sal;

SELECT dept_id
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > 45000;

SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id FROM Employees WHERE emp_name = 'Amit'
);

SELECT p1.emp_id, p2.emp_id, p1.project_id
FROM Projects p1
JOIN Projects p2 
ON p1.project_id = p2.project_id
AND p1.emp_id <> p2.emp_id;

SELECT e.emp_name
FROM Employees e
LEFT JOIN Projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL AND e.dept_id IS NOT NULL;

SELECT dept_id, SUM(salary) total, AVG(salary) avg_salary
FROM Employees
GROUP BY dept_id;

SELECT *
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
LEFT JOIN Projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

SELECT emp_id
FROM Projects
GROUP BY emp_id
HAVING COUNT(DISTINCT project_id) = (SELECT COUNT(*) FROM Projects);

SELECT dept_id, salary, COUNT(*) cnt
FROM Employees
GROUP BY dept_id, salary
HAVING COUNT(*) > 1;

SELECT dept_id
FROM Employees
GROUP BY dept_id
ORDER BY SUM(salary) DESC
LIMIT 1;

-- 39 (Top 3 per dept)
SELECT *
FROM (
    SELECT *,
    DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) rnk
    FROM Employees
) t
WHERE rnk <= 3;


SELECT emp_id
FROM Projects
GROUP BY emp_id
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT dept_id
FROM Employees
GROUP BY dept_id
HAVING MIN(salary) >= 30000;

SELECT DISTINCT e.emp_name
FROM Employees e
JOIN Projects p ON e.emp_id = p.emp_id
WHERE e.dept_id != (
    SELECT dept_id FROM Departments WHERE dept_name = 'IT'
);


SELECT p.project_name, COUNT(e.emp_id) emp_count, AVG(e.salary) avg_salary
FROM Projects p
JOIN Employees e ON p.emp_id = e.emp_id
GROUP BY p.project_name;