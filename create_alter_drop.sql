use localDB;


create table person(
id int primary key not null,
person_Name nvarchar(20) not null,
age int not null,
education varchar(20)
);

create table person1(
id int  not null,
person_Name nvarchar(20) not null,
age int not null,
education varchar(20),
constraint person_primarykey primary key(id)
);

alter table person
add mobileNumber int;

select * from person;

alter table person
drop column education;

drop table person;