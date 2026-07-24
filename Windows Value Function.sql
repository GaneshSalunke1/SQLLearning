CREATE TABLE DailySales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    EmployeeName VARCHAR(50),
    SaleAmount DECIMAL(10,2)
);

INSERT INTO DailySales (SaleID, SaleDate, EmployeeName, SaleAmount) VALUES
(1, '2024-05-01', 'Amit Sharma', 5000.00),
(2, '2024-05-02', 'Amit Sharma', 7000.00),
(3, '2024-05-03', 'Amit Sharma', 6500.00),
(4, '2024-05-01', 'Priya Iyer', 4000.00),
(5, '2024-05-02', 'Priya Iyer', 6000.00),
(6, '2024-05-03', 'Priya Iyer', 5500.00),
(7, '2024-05-01', 'Ravi Kumar', 3000.00),
(8, '2024-05-02', 'Ravi Kumar', 4500.00),
(9, '2024-05-03', 'Ravi Kumar', 5000.00);


select * from DailySales;

select *,LAG(SaleAmount) over(order by saleamount) from DailySales;--default start
select *,LAG(SaleAmount,2) over(order by saleamount) from DailySales;--start from 2
select *,LAG(SaleAmount,2,10) over(order by saleamount) from DailySales;--before start assign 10 to all nulls


select *,LEAD(SaleAmount) over(order by saleamount) from DailySales;--default start
select *,LEAD(SaleAmount,2) over(order by saleamount) from DailySales;--start from 2
select *,LEAD(SaleAmount,2,10) over(order by saleamount) from DailySales;--before start assign 10 to all nulls

select *,AverageSales-LeadData as ProfitEmployeeWise from(
select EmployeeName, avg(SaleAmount) AverageSales,LAG(avg(SaleAmount)) 
over(order by EmployeeName)LeadData from DailySales group by EmployeeName)t;

select *,first_value(SaleID) over(order by SaleID) from DailySales;
select *,last_value(SaleID) over(order by SaleID) from DailySales;

select *,LAST_VALUE(SaleID) over(order by SaleID 
rows between current row and unbounded following)from DailySales;
