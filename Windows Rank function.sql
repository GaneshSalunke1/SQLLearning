CREATE TABLE StudentScores (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Subject VARCHAR(50),
    Score INT
);

INSERT INTO StudentScores (StudentID, StudentName, Subject, Score) VALUES
(1, 'Amit Sharma', 'Math', 85),
(2, 'Priya Iyer', 'Math', 92),
(3, 'Ravi Kumar', 'Math', 76),
(4, 'Sneha Rao', 'Math', 92),
(5, 'Karan Mehta', 'Science', 88),
(6, 'Amit Sharma', 'Science', 91),
(7, 'Priya Iyer', 'Science', 85),
(8, 'Ravi Kumar', 'Science', 78),
(9, 'Sneha Rao', 'Science', 95),
(10, 'Karan Mehta', 'Math', 80);

select * from StudentScores;

select *,row_number() over(order by score desc) from StudentScores;

select *,rank() over(order by score desc) from StudentScores;

select *,DENSE_RANK() over(order by Score desc) from StudentScores;

select * from(select *,row_number() over(partition by score order by score desc)
rn from StudentScores) StudentScores where rn =1;

select *, ntile(3) over(order by Score desc) from StudentScores

select *, case
when ScoreDivide =1 then 'High'
when ScoreDivide =2 then 'Medium'
when ScoreDivide =3 then 'Low'
end ScoreSegmentation 
from (
select *,ntile(3) over(order by Score desc) ScoreDivide from StudentScores
) StudentScores; --Data Segmentation

select * from StudentScores

select*,NTILE(2) over(order by Score desc) from StudentScores --Equalizing load balancing

select *,CUME_DIST() over(order by Score desc) as CumDist,
PERCENT_RANK() over(order by Score desc) as percentrank
from StudentScores; --Cume_dist
