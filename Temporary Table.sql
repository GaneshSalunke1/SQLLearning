select e.EmpName, d.DeptName, e.Salary, e.HireDate
into #TempEmployeeRequiredData from 
Employees e join Departments d
on e.DeptID = d.DeptID

select * from #TempEmployeeRequiredData
