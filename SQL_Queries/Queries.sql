-- Write a query to display the name, product line, and buy price of all products. 
-- The output columns should display as “Name”, “Product Line”, and “Buy Price”. The output should display the most expensive items FIRST.
SELECT productName AS "Name", productLine AS "Product Line", buyPrice AS "Buy Price"
FROM products ORDER BY buyPrice DESC

-- Write a query to display the first name, last name, and city for all customers from Germany. 
-- Columns should display as “First Name”, “Last Name”, and “City”. The output should be sorted by the customer’s last name (ascending).
SELECT contactFirstName AS "First Name", contactLastName AS "Last Name", city AS "City"
FROM customers WHERE country="Germany" ORDER BY contactLastName

-- Write a query to display each of the unique values of the status field in the orders TABLE. 
-- The output should be sorted alphabetically increasing. Hint: the output should show exactly 6 rows.

SELECT Distinct STATUS FROM orders ORDER BY status

-- Select all fields from the payments table for payments made on or after January 1, 2005. Output should be sorted by increasing payment date.
SELECT * FROM payments WHERE paymentDate>='2005-01-01' ORDER BY paymentDate

-- Write a query to display all Last Name, First Name, Email and Job Title of all employees working out of the San Francisco office. Output should be sorted by last name.
SELECT lastName, firstName, email, jobTitle FROM employees e Join offices o ON e.officeCode=o.officeCode WHERE o.officeCode=1 order BY lastName

-- Write a query to display the Name, Product Line, Scale, and Vendor of all of the car products – both classic and vintage. 
-- The output should display all vintage cars first (sorted alphabetically by name), and all classic cars last (also sorted alphabetically by NAME).
SELECT productName, productLine, productScale, productVendor FROM products WHERE productLine LIKE "%Cars" ORDER BY productLine DESC, productname 

_______________________________________________________________________________________________________________

-- Write a query to display each customer’s name (as “Customer Name”) alongside the name of the employee who is responsible for that customer’s orders. 
-- The employee name should be in a single “Sales Rep” column formatted as “lastName, firstName”. The output should be sorted alphabetically by customer name.

SELECT c.customerName AS "Customer Name", Concat(e.lastName, ', ' ,e.firstName) AS "Sales Rep"  
FROM customers c JOIN employees e ON c.salesRepEmployeeNumber=e.employeeNumber
ORDER BY c.customerName

-- Determine which products are most popular with our customers. 
-- For each product, list the total quantity ordered along with the total sale generated (total quantity ordered * priceEach) for that product. 
-- The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”. List the products by Total Sale descending.

SELECT p.productName AS "Product Name", SUM(od.quantityOrdered) AS "Total # Ordered", SUM(od.quantityOrdered*od.priceEach) AS "Total Sale"  
FRoM orders o JOIN orderdetails od ON o.orderNumber=od.orderNumber JOIN products p ON p.productCode=od.productCode
GROUP BY od.productCode ORDER BY SUM(od.quantityOrdered*od.priceEach) desc

-- Write a query which lists order status and the # of orders with that status.
-- Column headers should be “Order Status” and “# Orders”. Sort alphabetically by status.

SELECT o.status AS "Order Status", SUM(o.orderNumber) AS "# Orders" FROM orders o GROUP BY o.status ORDER BY o.status

-- Write a query to list, for each product line, the total # of products sold from that product line.
-- The first column should be “Product Line” and the second should be “# Sold”. Order by the second column descending.

SELECT p.productLine AS "Product Line", SUM(od.quantityOrdered) AS "# Sold"
FRoM orderdetails od JOIN products p ON p.productCode=od.productCode
GROUP BY p.productLine ORDER BY SUM(od.quantityOrdered) DESC;

-- For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale amount of those orders.
-- The employee name should be output as a single column named “Sales Rep” formatted as “lastName, firstName”.
-- The second column should be titled “# Orders” and the third should be “Total Sales”.
-- Sort the output by Total Sales descending.
-- Only (and all) employees with the job title ‘Sales Rep’ should be included in the output, and if the employee made no sales the Total Sales should display as “0.00”.

SELECT Concat(e.lastName, ', ' ,e.firstName) AS "Sales Rep", COALESCE(SUM(o.orderNumber),0) AS "# Orders", COALESCE(SUM(od.quantityOrdered*od.priceEach),0.00) AS "Total Sale"  
FROM employees e LEFT JOIN customers c ON c.salesRepEmployeeNumber=e.employeeNumber
LEFT JOIN orders o ON o.customerNumber=c.customerNumber
LEFT JOIN orderdetails od ON od.orderNumber=o.orderNumber
WHERE e.jobTitle="Sales Rep"
GROUP BY c.customerName, Concat(e.lastName, ', ' ,e.firstName)
ORDER BY SUM(od.quantityOrdered*od.priceEach) desc

-- Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception.
-- Write a query to output the month (January, February, etc.), 4-digit year, and total sales for that month.
-- The first column should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’.
-- Values in the third column should be formatted as numbers with two decimals – for example: 694,292.68.

SELECT MONTH(o.orderDate) AS "Month", YEAR(o.orderDate) AS "Year", SUM(od.quantityOrdered*od.priceEach) AS "Payments Received"   
FROM orders o JOIN orderdetails od ON o.orderNumber=od.orderNumber
GROUP BY MONTH(o.orderDate), YEAR(o.orderDate)


----------------------------------------------------------------------------------------------

-- For each product, show the product name "Product" and the product type name "Type".
SELECT p.NAME AS Product, pt.NAME AS Type
FROM product AS p JOIN product_type AS pt ON p.product_type_cd = pt.product_type_cd;


-- For each branch, list the branch name and city, plus last name and title of each employee who works in that branch.
SELECT b.name, b.city, e.last_name, e.title
FROM branch AS b JOIN employee AS e ON b.branch_id = e.assigned_branch_id;


-- Show a list of each unique employee title.
SELECT DISTINCT TITLE FROM employee;


-- Show the last name and title of each employee, along with the last name and title of that employee's boss.
SELECT e.last_name AS Employee, e.title AS Title, s.last_name AS Superior, s.title AS Title
FROM employee AS e JOIN employee AS s ON e.superior_emp_id = s.emp_id;


-- For each account, show the name of the account's product, the available balance, and the customer's last name.
SELECT  p.name AS Product, FORMAT(a.avail_balance, 2) AS 'Available Balance', i.last_name AS Customer
FROM product AS p JOIN account AS a ON p.product_cd = a.product_cd  JOIN individual AS i ON a.cust_id = i.cust_id;


-- List all account transaction details for individual customers whose last name starts with 'T'.
SELECT *
FROM acc_transactions AS at
 JOIN account AS a ON at.account_id = a.account_id
 JOIN individual AS i ON a.cust_id = i.cust_id
WHERE i.last_name LIKE 't%';