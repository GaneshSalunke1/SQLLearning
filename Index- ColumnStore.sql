CREATE TABLE SalesData (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO SalesData VALUES
(1, 'Laptop', 'Electronics', 5, 55000, '2026-07-01'),
(2, 'Mobile Phone', 'Electronics', 10, 25000, '2026-07-02'),
(3, 'Protein Powder', 'Health', 20, 3200, '2026-07-03'),
(4, 'Shoes', 'Fashion', 15, 4500, '2026-07-04'),
(5, 'Smart Watch', 'Electronics', 8, 12000, '2026-07-05'),
(6, 'Microwave Oven', 'Appliances', 3, 18000, '2026-07-06'),
(7, 'Books', 'Education', 30, 500, '2026-07-07'),
(8, 'Headphones', 'Electronics', 12, 3000, '2026-07-08');


select * from SalesData;

create columnstore index CategoryCluster on SalesData(Category);

create clustered columnstore index ProductNameCluster on SalesData(ProductName);--column specify not work

create nonclustered columnstore index PriceCluster on SalesData(Price);

create clustered columnstore index PriceCluster on SalesData;

select count(Category) from SalesData;


-----------------------------------------------------------------------------------------------------------------------------------------------------------
select * from nyctaxi_sample;

--select * into nyctaxi_sample_noCLuster
--from nyctaxi_sample;

--select * into nyctaxi_sample_noRowStore
--from nyctaxi_sample;

--select * into nyctaxi_sample_ColumnStoreStore
--from nyctaxi_sample;

create clustered index rate_Code_row on nyctaxi_sample_noRowStore(rate_Code);

--drop index rate_Code_row on nyctaxi_sample_ColumnStoreStore

select count(rate_Code) from nyctaxi_sample_ColumnStoreStore

select count(rate_Code) from nyctaxi_sample

ALTER INDEX rate_Code_row ON nyctaxi_sample_ColumnStoreStore REORGANIZE;

drop table nyctaxi_sample_ColumnStoreStore;
drop table nyctaxi_sample_noRowStore;
