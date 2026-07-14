use localDB;
--CREATE TABLE Orders (
--    OrderID INT PRIMARY KEY,
--    CustomerName VARCHAR(50),
--    Product VARCHAR(50),
--    Quantity INT,
--    Price DECIMAL(10,2),
--    OrderDate DATE
--);

--INSERT INTO Orders (OrderID, CustomerName, Product, Quantity, Price, OrderDate) VALUES
--(1, 'Amit Sharma', 'Laptop', 1, 75000.00, '2024-05-10'),
--(2, 'Priya Iyer', 'Smartphone', 2, 30000.00, '2024-05-11'),
--(3, 'Ravi Kumar', 'Tablet', 1, 25000.00, '2024-05-12'),
--(4, 'Sneha Rao', 'Headphones', 3, 4500.00, '2024-05-13'),
--(5, 'Karan Mehta', 'Camera', 1, 55000.00, '2024-05-14'),
--(6, 'Amit Sharma', 'Monitor', 2, 20000.00, '2024-05-15'),
--(7, 'Priya Iyer', 'Keyboard', 4, 4000.00, '2024-05-16'),
--(8, 'Ravi Kumar', 'Smartwatch', 1, 15000.00, '2024-05-17');


--select * from orders;

select customername,sum(quantity) as totalQuantity from orders group by customername;
--here we achieved combine result using groupby

select customername,product, sum(quantity) as totalQuantity from orders group by customername,product;
--here we try to combine but we lost sum(quantity) as we are grouping by using two different results
--so we need to use windows function here.

select customername, product, sum(quantity) over(partition by customername) as quantitybyname  from orders;

select customername, product, sum(quantity) over(partition by customername,quantity) as quantityplusname  from orders;

select customername,quantity, product, sum(quantity) over(partition by customername,quantity
order by customername rows between current row and 2 following) as quantityplusnameframe  from orders;