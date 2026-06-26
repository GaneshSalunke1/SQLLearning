CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Email VARCHAR(50),
    City VARCHAR(30),
    Balance DECIMAL(10,2),
    JoinDate DATE
);

INSERT INTO Customers (CustomerID, FullName, Email, City, Balance, JoinDate) VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com', 'Delhi', 1520.75, '2022-01-15'),
(2, 'Priya Iyer', 'priya.iyer@example.com', 'Mumbai', 230.00, '2021-11-20'),
(3, 'Ravi Kumar', 'ravi.kumar@example.com', 'Chennai', 985.50, '2023-03-10'),
(4, 'Sneha Rao', 'sneha.rao@example.com', 'Bangalore', 120.00, '2020-07-05'),
(6, 'Karan Mehta', 'karan.mehta@example.com', 'Pune', 4500.00, '2024-09-25'),
(5, 'Karan Mehta', 'karan.mehta@example.com', 'Pune', 4500.00, '2024-09-25');


select * from Customers;

select CONCAT(fullname,' ', email)as NameEmail from Customers;

select *,upper(fullname)as upperName ,Lower(fullname) as lowerName from Customers;

select concat((fullname),'---',Lower(fullname)) from Customers;

select trim(City) from customers;

update Customers
set fullname =trim(fullname)
from Customers
where fullname != trim(fullname);

select len(fullname) from Customers;

select '123-456-789',
replace('123-456-789','-','/');

select fullname, left(fullname,3) as first3 from customers;

select fullname, right(fullname,3) as first3 from customers;

select fullname,substring(fullname,2,3) as subs from Customers;

select fullname,substring(fullname,2,len(fullname)-1) as subs from Customers;

select Balance,round(balance,0) from Customers;

select -10, abs(-10);
