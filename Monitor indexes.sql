sp_helpindex 'dbo.Animals'

select * from sys.tables;
select * from sys.all_views;
select * from sys.indexes;
select * from sys.dm_db_index_usage_stats
select * from SalesData

select tab.name,ind.name, usage.user_seeks, usage.user_lookups, usage.user_scans from sys.dm_db_index_usage_stats 
usage left join sys.tables tab on usage.object_id = tab.object_id join sys.indexes ind on usage.object_id = ind.object_id

select * from sys.dm_db_missing_index_details

select * from sys.stats

update statistics dbo.Salesdata 

exec sp_updatestats

--fragmentation
select * from sys.dm_db_index_physical_stats(DB_ID(),null,null,null,'Limited')
