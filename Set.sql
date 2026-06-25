CREATE TABLE Electronics (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Brand VARCHAR(50)
);

INSERT INTO Electronics (ProductID, ProductName, Brand) VALUES
(1, 'Laptop', 'Dell'),
(2, 'Smartphone', 'Samsung'),
(3, 'Tablet', 'Apple'),
(4, 'Headphones', 'Sony'),
(5, 'Camera', 'Canon');


CREATE TABLE Gadgets (
    GadgetID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Brand VARCHAR(50)
);

INSERT INTO Gadgets (GadgetID, ProductName, Brand) VALUES
(101, 'Smartphone', 'Samsung'),
(102, 'Smartwatch', 'Apple'),
(103, 'Tablet', 'Apple'),
(104, 'Drone', 'DJI'),
(105, 'Camera', 'Canon');

select * from Electronics;
select * from Gadgets;

select Brand,ProductName from Electronics
union 
select Brand,ProductName from Gadgets;

select Brand,ProductName from Electronics
union all
select Brand,ProductName from Gadgets;

select Brand,ProductName from Electronics
except 
select Brand,ProductName from Gadgets;

select Brand,ProductName from Gadgets
except 
select Brand,ProductName from Electronics;

select Brand,ProductName from Gadgets
intersect 
select Brand,ProductName from Electronics;
