--Execution Plan

select * from NYCTaxi_Sample

select * 
into NYCTaxi_Sample_Duplicate
from NYCTaxi_Sample

select * from NYCTaxi_Sample_Duplicate where total_amount <6

create nonclustered index ind_amount on NYCTaxi_Sample_Duplicate(total_amount)

use master;

select * from Books;




select * from Authors;

select a.AuthorName, b.Title, b.Price, sum(Price) over (partition by b.AuthorID) from Books b join 
Authors A on b.AuthorID =a.AuthorID where Price <= 700;

SELECT * 
FROM Books WITH (INDEX(IX_Books_AuthorID))
WHERE AuthorID = 5;
