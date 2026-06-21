create table Subjects(
id int not null,
name varchar(20),
constraint pk_subijectId primary key(id)
);

insert into subjects values
(1,'Maths'),
(2,'Science');

alter table subjects
add Registrations int;

insert into subjects(id,name,Registrations) values
(3, NULL,5);

select * from Subjects;
select * from UniversitySubjects;

create table UniversitySubjects(
id int not null,
name varchar(20),
marks int,
constraint pk_universitySubjectsId primary key(id)
);

insert into UniversitySubjects 
select id,name,null from Subjects;

update UniversitySubjects
set marks = 30
where id =2;

delete from Subjects where id = 4;
delete from Subjects;

truncate table Subjects;