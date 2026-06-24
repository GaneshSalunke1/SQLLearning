use localDB;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES
(1, 'George Orwell', 'UK'),
(2, 'Haruki Murakami', 'Japan'),
(3, 'J.K. Rowling', 'UK'),
(4, 'Gabriel García Márquez', 'Colombia'),
(5, 'Chinua Achebe', 'Nigeria');

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    YearPublished INT,
    CONSTRAINT fk_author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Books (BookID, Title, AuthorID, YearPublished) VALUES
(101, '1984', 1, 1949),
(102, 'Norwegian Wood', 2, 1987),
(103, 'Harry Potter and the Philosopher''s Stone', 3, 1997),
(104, 'One Hundred Years of Solitude', 4, 1967),
(105, 'Things Fall Apart', 5, 1958),
(106, 'Kafka on the Shore', 2, 2002),
(107, 'Animal Farm', 1, 1945);


select Authors.AuthorName, books.YearPublished from authors inner join books on books.AuthorID = Authors.AuthorID;

select * from authors left join books on books.AuthorID = Authors.AuthorID;

select * from books right join authors on Books.AuthorID = Authors.AuthorID;

select * from books full join authors on Books.AuthorID = Authors.AuthorID;

select * from authors AS a left join books AS b on b.AuthorID = a.AuthorID where b.AuthorID is NULL;

select * from authors cross join books;


CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100),
    Country VARCHAR(50)
);

INSERT INTO Publishers (PublisherID, PublisherName, Country) VALUES
(1, 'Penguin Random House', 'USA'),
(2, 'Bloomsbury', 'UK'),
(3, 'Kodansha', 'Japan'),
(4, 'HarperCollins', 'USA');


CREATE TABLE BookStores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO BookStores (StoreID, StoreName, City) VALUES
(1, 'City Lights', 'San Francisco'),
(2, 'Strand Bookstore', 'New York'),
(3, 'Waterstones', 'London'),
(4, 'Kinokuniya', 'Tokyo');

ALTER TABLE Books 
ADD PublisherID INT;

UPDATE Books SET PublisherID = 1 WHERE BookID IN (101,107); -- Orwell
UPDATE Books SET PublisherID = 3 WHERE BookID IN (102,106); -- Murakami
UPDATE Books SET PublisherID = 2 WHERE BookID = 103;        -- Rowling
UPDATE Books SET PublisherID = 4 WHERE BookID = 104;        -- Márquez
UPDATE Books SET PublisherID = 1 WHERE BookID = 105;        -- Achebe

select * from Authors;
select * from books;
select * from Publishers;
select * from BookStores;

select * from authors as a 
join books  as b on a.AuthorID =b.AuthorID 
join Publishers as p on p.PublisherID = b.PublisherID;

alter table bookstores
add CountryID int;

alter table Publishers
add CountryCode int;

UPDATE bookstores SET CountryID = 1 WHERE City IN ('San Francisco','New York'); --USA
UPDATE bookstores SET CountryID = 2 WHERE City IN ('London'); -- UK
UPDATE bookstores SET CountryID = 3 WHERE City = 'Tokyo';        -- Japan

UPDATE Publishers SET CountryCode = 1 WHERE Country IN ('USA'); --USA
UPDATE Publishers SET CountryCode = 2 WHERE Country IN ('UK'); --UK
UPDATE Publishers SET CountryCode = 3 WHERE Country IN ('Japan'); --Japan

select * from authors as a 
join books  as b on a.AuthorID =b.AuthorID 
join Publishers as p on p.PublisherID = b.PublisherID
join BookStores as bs on p.CountryCode = bs.CountryID;

select a.AuthorName,b.Title,p.PublisherName,b.YearPublished,bs.StoreName,a.Country,bs.City from authors as a 
join books  as b on a.AuthorID =b.AuthorID 
join Publishers as p on p.PublisherID = b.PublisherID
join BookStores as bs on p.CountryCode = bs.CountryID;