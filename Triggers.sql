Create Table EmployeeLogs(
LogId int identity(1,1) primary key,
EmployeeID int,
LogMessage nvarchar(50),
LogDate DateTime
)

select * from Employees;

create trigger trg_afterInsertemployee on Employees
After Insert as
Begin
	Insert into EmployeeLogs (EmployeeID,LogMessage,LogDate) 
	select EmpID ,'New User Entry Inserted' + cast(EmpID as nvarchar),GETDATE()
	from inserted;
End

select * from EmployeeLogs;

insert into Employees Values(109,'Narendas Das','2',40000,GETDATE())
