use localDB;

select * from subjects;

select * from subjects where id > 2;

select * from subjects where not id >2;

select * from subjects where id in (1,3);

select * from subjects where id  not in (1,3);

select * from Subjects where id between 2 and 4;

select * from Subjects where name like '%M';

select * from Subjects where name like 'M%';

select * from Subjects where name like '%A%';

select * from Subjects where name like '___A%';