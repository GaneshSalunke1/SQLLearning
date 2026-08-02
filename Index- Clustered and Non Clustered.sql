Drop table TechEmployees

CREATE TABLE TechEmployees (
    EmpID INT,
    EmpName VARCHAR(100),
    Role VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

create clustered index IndexonEmpId on TechEmployees(EmpID) --Clustered Index

create index IndexonSalary on TechEmployees(Salary)-- default to Non CLustered Index

create Nonclustered index IndexonEmpName on TechEmployees(EmpName, Role) --Non Clustered Index

drop index IndexonEmpName on TechEmployees --Drop Index
