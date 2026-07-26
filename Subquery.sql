CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES
(1, 'Arjun Desai', 'India'),
(2, 'Meera Kapoor', 'India'),
(3, 'John Smith', 'USA'),
(4, 'Sophia Brown', 'UK'),
(5, 'Carlos Diaz', 'Spain');


CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Price DECIMAL(10,2),
    PublishedYear INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Books (BookID, Title, AuthorID, Price, PublishedYear) VALUES
(101, 'AI Revolution', 1, 750.00, 2022),
(102, 'Data Science Basics', 2, 500.00, 2021),
(103, 'Cloud Computing Guide', 3, 650.00, 2020),
(104, 'Modern Cryptography', 4, 900.00, 2023),
(105, 'Machine Learning Made Easy', 5, 550.00, 2022),
(106, 'Deep Learning Explained', 1, 800.00, 2024),
(107, 'SQL Mastery', 2, 400.00, 2019),
(108, 'Cybersecurity Essentials', 3, 700.00, 2023),
(109, 'Blockchain Fundamentals', 4, 950.00, 2024),
(110, 'Big Data Analytics', 5, 600.00, 2021);

--from clause
select *,ROW_NUMBER() over(order by SumPrice) from
(
select AuthorID,sum(Price) SumPrice from Books group by AuthorID)t;

select * from (
select *,avg(Price) over() as AveragePrice from Books
)t where Price > AveragePrice;

--select clause only scalar function allowed
select Title,PublishedYear,(select sum(Price) as TotalAverage from books) from Books;
select *,(select sum(Price) as TotalAverage from books)TotalAverage from Authors;

--join clause
--normal join
select a.AuthorName,a.Country, count(PublishedYear) PublishedCount from Authors a
join Books b on
a.AuthorID = b.AuthorID
group by a.AuthorName,a.Country,B.AuthorID;


--subquery join
select * from Authors a
left join(
select AuthorID,COUNT(PublishedYear) TotalPublished
from books group by AuthorID)o
on a.AuthorID = o.AuthorID;

--subquery where clause
select * from Books
where Price > (select avg(Price) from Books);

--SUBQUERY WHERE IN clause
select * from Authors
where AuthorID in (select AuthorID from Books where AuthorID <3)
;

--SUBQUERY WHERE Any clause
select * from Books where Price < any (select Price from books where price < 800)

--SUBQUERY WHERE All clause
select * from Books where Price < all (select Price from books where price < 800)

--SUBQUERY WHERE Exist clause
select * from Authors a where exists (select * from books b where a.AuthorID = b.AuthorID)
select * from Authors a where not exists (select * from books b where a.AuthorID = b.AuthorID)
