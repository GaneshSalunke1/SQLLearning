Select * from Books;
Select * from Authors;


Select a.AuthorName, avg(Price) as BookAverage from 
Books b join Authors A
on b.AuthorID = a.AuthorID
group by a.AuthorName;

create procedure AuthorUpdate
As
Begin

	Select a.AuthorName, avg(Price) as BookAverage from 
	Books b join Authors A
	on b.AuthorID = a.AuthorID
	group by a.AuthorName;

end

exec AuthorUpdate

drop proc AuthorUpdate

--Parameter Based Stored Procedure
create procedure AuthorExtraction @AvgValue int
As
Begin

	Select a.AuthorName, avg(Price) as BookAverage from 
	Books b join Authors A
	on b.AuthorID = a.AuthorID
	group by a.AuthorName
	having avg(Price) < @AvgValue;

end

Exec AuthorExtraction @AvgValue = 500
--OR
Exec AuthorExtraction 500

--Parameter Based Stored Procedure if parameter value not provided by user
create procedure IsAuthorExtractionValue @AvgValue int = 300
As
Begin

	Select a.AuthorName, avg(Price) as BookAverage from 
	Books b join Authors A
	on b.AuthorID = a.AuthorID
	group by a.AuthorName
	having avg(Price) < @AvgValue;

end

Exec IsAuthorExtractionValue @AvgValue = 500
--OR
Exec IsAuthorExtractionValue


--Variables in Store Procedure
Alter procedure AuthorExtractionVariableBased @AvgValue int = 300
As
Begin
	Declare @AverageValue int;

	Select @AverageValue = avg(Price) from 
	Books ;

	Print 'Average Value of Book is ' + Cast(@AverageValue as varchar) + '.';

	Select a.AuthorName, avg(Price) as BookAverage from 
	Books b join Authors A
	on b.AuthorID = a.AuthorID
	group by a.AuthorName
	having avg(Price) < @AvgValue;

end

Exec AuthorExtractionVariableBased @AvgValue = 500


--IF else 

CREATE TABLE BookNullPractice (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150) NULL,
    AuthorName VARCHAR(100) NULL,
    Genre VARCHAR(50) NULL,
    Price DECIMAL(10,2) NULL,
    PublishedYear INT NULL
);

INSERT INTO BookNullPractice (BookID, Title, AuthorName, Genre, Price, PublishedYear)
VALUES
(1, 'The Silent River', 'R.K. Narayan', 'Fiction', 250.00, 1980),
(2, 'Mystery of Shadows', NULL, 'Mystery', NULL, 2005),
(3, 'Future of AI', 'Ganesh Patil', NULL, 500.00, NULL),
(4, NULL, 'Jane Austen', 'Romance', 300.00, 1813),
(5, 'Untitled Work', NULL, NULL, NULL, NULL);


Select * from BookNullPractice;

select * from BookNullPractice where Price is null

If Exists(select * from BookNullPractice where Price is null)
	Begin
		Print('Updating Null Values');
		Update BookNullPractice
		Set Price = 0
		where Price is null;
	end
Else
	Begin 
		Print('No Null Values found');
	end

--If else in stored procedure

Create procedure AuthorExtractionIfElse @AvgValue int = 300
As
Begin
	Declare @AverageValue int;

	If Exists(select * from BookNullPractice where Price is null)
	Begin
		Print('Updating Null Values');
		Update BookNullPractice
		Set Price = 0
		where Price is null;
	end
Else
	Begin 
		Print('No Null Values found');
	end

	Select @AverageValue = avg(Price) from 
	Books ;

	Print 'Average Value of Book is ' + Cast(@AverageValue as varchar) + '.';

	Select a.AuthorName, avg(Price) as BookAverage from 
	Books b join Authors A
	on b.AuthorID = a.AuthorID
	group by a.AuthorName
	having avg(Price) < @AvgValue;

end

Exec AuthorExtractionVariableBased @AvgValue = 500


--Error Handling Try/Catch

create procedure TryCatchAuthorExtractionValue @AvgValue int = 300
As
Begin

	Begin Try
		Select a.AuthorName, avg(Price)/0 as BookAverage from 
		Books b join Authors A
		on b.AuthorID = a.AuthorID
		group by a.AuthorName
		having avg(Price) < @AvgValue;
	End Try
	Begin Catch
	print('Error Occured please check the query')
	End Catch
end

Exec TryCatchAuthorExtractionValue 600;
