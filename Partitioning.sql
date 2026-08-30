--Partitioning

select * from NYCTaxi_Sample;

create partition function partitionbyMonth(Date)
as range left for values('2013-05-28','2013-08-28', '2013-12-28')

select * from sys.partition_functions

-- create file groups

alter database NYCTAXI_Sample add filegroup Month5;
alter database NYCTAXI_Sample add filegroup Month8;
alter database NYCTAXI_Sample add filegroup Month12;

alter database NYCTAXI_Sample remove filegroup Month5;

select * from sys.filegroups

--create data files

alter database NYCTAXI_Sample add file (
Name = Month5th, --logical name
FileName = "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\month5.ndf" --file path
)
To filegroup Month5

alter database NYCTAXI_Sample add file (
Name = Month8th, --logical name
FileName = "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\month8.ndf" --file path
)
To filegroup Month8

alter database NYCTAXI_Sample add file (
Name = Month12th, --logical name
FileName = "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\month12.ndf" --file path
)
To filegroup Month12

ALTER DATABASE NYCTAXI_Sample 
REMOVE FILE Month5;

select * from sys.master_files where database_id =6

--connect partition function to files

create partition scheme schemepartitionbyMonth 
as partition partitionbyMonth 
to (Month5,Month8,Month12,[primary])

--partition table creation
create table NYCTaxi_Sample_PartitionbyMonth(
	[medallion] [varchar](50) NOT NULL,
	[hack_license] [varchar](50) NOT NULL,
	[vendor_id] [char](3) NULL,
	[rate_code] [char](3) NULL,
	[store_and_fwd_flag] [char](3) NULL,
	[pickup_datetime] [date] NOT NULL,
	[dropoff_datetime] [datetime] NULL,
	[passenger_count] [int] NULL,
	[trip_time_in_secs] [bigint] NULL,
	[trip_distance] [float] NULL,
	[pickup_longitude] [varchar](30) NULL,
	[pickup_latitude] [varchar](30) NULL,
	[dropoff_longitude] [varchar](30) NULL,
	[dropoff_latitude] [varchar](30) NULL,
	[payment_type] [char](3) NULL,
	[fare_amount] [float] NULL,
	[surcharge] [float] NULL,
	[mta_tax] [float] NULL,
	[tolls_amount] [float] NULL,
	[total_amount] [float] NULL,
	[tip_amount] [float] NULL,
	[tipped] [int] NULL,
	[tip_class] [int] NULL
)
on schemepartitionbyMonth(pickup_datetime)

insert into NYCTaxi_Sample_PartitionbyMonth (medallion,hack_license,pickup_datetime) values ('C2B9067BB92017120FEF9865217E5E53', 'C2B9067BB92017120FEF9865217E5E53','2013-05-01');

select * from NYCTaxi_Sample_PartitionbyMonth;

select * from sys.partitions

SELECT
    p.partition_number AS PartitionNumber,
    f.name AS PartitionFilegroup,
    p.rows AS NumberOfRows
FROM sys.partitions p
JOIN sys.destination_data_spaces dds 
    ON p.partition_number = dds.destination_id
JOIN sys.filegroups f 
    ON dds.data_space_id = f.data_space_id
WHERE OBJECT_NAME(p.object_id) = 'NYCTaxi_Sample_PartitionbyMonth';

