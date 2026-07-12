CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SaleValue INT
);

INSERT INTO Sales (SaleID, ProductName, SaleValue) VALUES
(1, 'Laptop', 75),
(2, 'Smartphone', 45),
(3, 'Headphones', 15),
(4, 'Tablet', 25),
(5, 'Camera', 55),
(6, 'Smartwatch', 10),
(7, 'Monitor', 30),
(8, 'Keyboard', 5);


select * from Sales;

select
case 
    when SaleValue > 50 then 'High'
    when SaleValue between 20 and 50 then 'Medium'
    else 'Low'
end as SalesReport
from sales;

--Case with group by
select
case 
    when SaleValue > 50 then 'High'
    when SaleValue between 20 and 50 then 'Medium'
    else 'Low'
end as SalesReport,sum(SaleValue)
from sales
group by case 
    when SaleValue > 50 then 'High'
    when SaleValue between 20 and 50 then 'Medium'
    else 'Low'
end;

