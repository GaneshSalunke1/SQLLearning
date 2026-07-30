CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(1, 'IT', 'Pune'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Sales', 'Bangalore');


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary, HireDate) VALUES
(101, 'Amit Sharma', 1, 60000, '2022-01-15'),
(102, 'Priya Iyer', 1, 75000, '2021-03-10'),
(103, 'Ravi Kumar', 2, 50000, '2023-07-01'),
(104, 'Sneha Rao', 2, 52000, '2022-11-20'),
(105, 'Karan Mehta', 3, 80000, '2020-05-05'),
(106, 'Meera Kapoor', 3, 85000, '2021-09-12'),
(107, 'John Smith', 4, 45000, '2023-02-18'),
(108, 'Sophia Brown', 4, 47000, '2022-06-25');


WITH DepartmentSalary AS
(
    select DeptID,Sum(Salary) as DivideSalary 
    from Employees 
    group by DeptID
)

select * from DepartmentSalary;
 
select EmpID, EmpName, Salary, HireDate, DivideSalary from Employees e 
join DepartmentSalary d on e.DeptID = d.DeptID;


--standalone multiple CTE
With TotalSalaryDivide As(
    select DeptID,Sum(Salary) as DivideSalary 
    from Employees 
    group by DeptID
), LeastDepartmentSalary as(
select DeptID,Max(salary) as MaxDeptSalary from Employees group by DeptID
)

select EmpID, EmpName, Salary, HireDate, DivideSalary,MaxDeptSalary from Employees e
Join TotalSalaryDivide t on e.DeptID= t.DeptID
Join LeastDepartmentSalary l on e.DeptID= l.DeptID

select * from Employees

---Nested CTE

with TotalSalaryByDept as(
 select d.DeptName,sum(e.Salary) as combine from Employees e join Departments d
 on e.DeptID = d.DeptID
 group by d.DeptName
), RankCustomer as
(
select Deptname,combine,rank() over(order by combine) as ranked from TotalsalaryByDept
),
casesegment as(
select *,
case
    when combine < 100000 then 'Low'
    when combine > 100000  and combine < 150000 then 'Medium'
    when combine > 150000 then 'High'
end as dataDistribution
from RankCustomer
)

select * from casesegment;

-----------------------------------------------------------------------------

with series as (
select 1 as Mynumber --anchor runs only one time
union all
select Mynumber + 1 from Series --recursive
where Mynumber <=20
)

select * from series

CREATE TABLE Employees_Recursive (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    BirthDate DATE,
    Gender CHAR(1),
    Salary DECIMAL(10,2),
    ManagerID INT NULL
);

INSERT INTO Employees_Recursive(EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID)
VALUES
(1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL),
(2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1),
(3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1),
(4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2),
(5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3);

select * from Employees_Recursive;

with OrganizationLevel as(
select EmployeeID,FIRSTName,Department,ManagerID, 1 as Level from Employees_Recursive
where ManagerID is null

union all

select er.EmployeeID, er.FIRSTName, er.Department, er.ManagerID, Level + 1 from Employees_Recursive er
join OrganizationLevel ol on er.ManagerID = ol.EmployeeID
)

select * from OrganizationLevel;
