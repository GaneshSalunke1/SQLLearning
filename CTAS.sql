select * from Employees;
select * from Departments;

--PostGre, Oracle, MySQL syntax
create table EmployeeRequiredData as (
select e.EmpName, d.DeptName, e.Salary, e.HireDate from 
Employees e join Departments d
on e.DeptID = d.DeptID
)

--SQL Syntax
select e.EmpName, d.DeptName, e.Salary, e.HireDate
into EmployeeRequiredData from 
Employees e join Departments d
on e.DeptID = d.DeptID

select * from EmployeeRequiredData;
