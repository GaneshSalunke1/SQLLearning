CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    SaleAmount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO EmployeeSales (SaleID, EmployeeName, Department, SaleAmount, SaleDate) VALUES
(12, 'Amit Sharma', 'IT', 5000.00, '2024-05-10'),
(2, 'Priya Iyer', 'HR', 3000.00, '2024-05-11'),
(3, 'Ravi Kumar', 'IT', 7000.00, '2024-05-12'),
(4, 'Sneha Rao', 'Finance', 4500.00, '2024-05-13'),
(5, 'Karan Mehta', 'Finance', 5500.00, '2024-05-14'),
(6, 'Amit Sharma', 'IT', 6000.00, '2024-05-15'),
(7, 'Priya Iyer', 'HR', 4000.00, '2024-05-16'),
(8, 'Ravi Kumar', 'IT', 8000.00, '2024-05-17'),
(9, 'Sneha Rao', 'Finance', 3000.00, '2024-05-18'),
(10, 'Karan Mehta', 'Finance', 6500.00, '2024-05-19');


select EmployeeName,avg(SaleAmount) over(partition by EmployeeName) AvgSales from EmployeeSales;

--AVG & Count
select EmployeeName,avg(SaleAmount) over(partition by EmployeeName) AvgSales,
COUNT(EmployeeName) OVER (PARTITION BY employeeName) from EmployeeSales;

--SUM
select sum(SaleAmount) over() from EmployeeSales;
select *,sum(SaleAmount) over(partition by Department) SalesByDepartment from EmployeeSales;

select *,sum(SaleAmount) over() TotalSales,round(SaleAmount*100/sum(SaleAmount) over(),2) percentsales from EmployeeSales;

--Avg Nulll
select * from EmployeeSales

select *, avg(saleamount) over() totalSales from EmployeeSales;--ignoring null

select *, avg(coalesce (saleamount,0)) over() totalSales from EmployeeSales;--by taking null

--windows function not work with where clause
--select *, avg(saleamount) over() totalSales from EmployeeSales where avg(saleamount) over() >SaleAmount;

select * from(
select EmployeeName,SaleAmount, avg(saleamount) over() totalSales from EmployeeSales)EmployeeSales
where totalSales >SaleAmount;

--MIN MAX

select * from EmployeeSales

select *, min(SaleAmount) over() from EmployeeSales

select *, min(SaleAmount) over(partition by Department) from EmployeeSales;
select *, max(SaleAmount) over(partition by Department) from EmployeeSales;

--running total and rolling total

select *,sum(SaleAmount) over(partition by Department order by SaleDate 
rows between unbounded preceding and current row) DepartmentTotal
from EmployeeSales

select *,sum(SaleAmount) over(partition by Department order by SaleDate 
rows between 2 preceding and current row) DepartmentTotal
from EmployeeSales

--calculate moving avg
select *,avg(SaleAmount) over(partition by Department order by SaleDate 
rows between 2 preceding and current row) DepartmentTotal
from EmployeeSales