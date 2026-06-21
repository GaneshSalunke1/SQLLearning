-- Create table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Marks INT
);

-- Insert sample data
INSERT INTO Students (StudentID, Name, Age, Department, Marks) VALUES
(1, 'Amit', 20, 'Computer Science', 85),
(2, 'Priya', 22, 'Mathematics', 92),
(3, 'Ravi', 21, 'Computer Science', 76),
(4, 'Sneha', 23, 'Physics', 89),
(5, 'Karan', 20, 'Mathematics', 92),
(6, 'Meena', 22, 'Computer Science', 85),
(7, 'Arjun', 24, 'Physics', 70),
(8, 'Neha', 21, 'Mathematics', 88),
(9, 'Vikas', 23, 'Computer Science', 95),
(10, 'Pooja', 22, 'Physics', 85);


select * from Students;

select * from Students where studentID = 5;
select * from Students where studentID != 5;
select * from Students where StudentID in (5,4);

select * from Students  order by Age DESC;
select * from Students where age <= 22 order by Age DESC;

select Department,sum(Marks) from Students group by Department;
select Department from Students group by Department;
select Department,sum(Marks) as CombineMarks from Students group by Department;
select Department,Name,sum(Marks) from Students group by Department,Name;

select Department,sum(Marks) from Students group by Department Having sum(Marks) >250;
select Department,sum(Marks) from Students where Marks >80 group by Department Having sum(Marks) >250;

select top 1 Department,sum(Marks) from Students group by Department Having sum(Marks) >250;
select top 1 Department from Students order by Department desc;