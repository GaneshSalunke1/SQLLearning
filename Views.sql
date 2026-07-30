CREATE TABLE Animals (
    AnimalID INT PRIMARY KEY,
    Name VARCHAR(50),
    Species VARCHAR(50),
    Habitat VARCHAR(50),
    Age INT,
    Weight DECIMAL(6,2),
    IsEndangered CHAR(1)
);

INSERT INTO Animals VALUES
(1, 'Leo', 'Lion', 'Savannah', 8, 190.50, 'Y'),
(2, 'Ella', 'Elephant', 'Forest', 25, 5400.00, 'Y'),
(3, 'Milo', 'Monkey', 'Jungle', 5, 35.20, 'N'),
(4, 'Sammy', 'Snake', 'Desert', 2, 12.00, 'N'),
(5, 'Polly', 'Parrot', 'Rainforest', 3, 1.50, 'N'),
(6, 'Tara', 'Tiger', 'Forest', 12, 220.00, 'Y'),
(7, 'Zara', 'Zebra', 'Savannah', 6, 300.00, 'N');

alter view animalWeight  with schemabinding as(
select AnimalID,Name,Weight from dbo.Animals where AnimalID =2
)

insert into animalWeight (AnimalID, Name, Weight) values (9, 'Zebra', 300.00);

create view weightandID as(
select *,count(IsEndangered) over(partition by IsEndangered) as TotalEndangered from Animals
)

select * from weightandID
