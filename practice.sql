create database SQL_WORKBENCH;

USE SQL_WORKBENCH;

#numeric functions

select abs(25);

select mod(10,2) as remainder;

select mod(15,4) as remainder;

select power(4,2);

select power(500,2);

select least(12,4,5,6);

select truncate(40.2334,2);

create table students
(stud_id int primary key,
stu_name varchar(25), age int, gender char(1),doa date,
city varchar(24));
alter table students add marks int;
DROP table students;

insert into students values
(1234, "Jerry", 22, "M", "2020-02-23", "Jozi", 60),
(2352, "Ree", 18, "M", "2020-02-23","Kby", 70),
(3523, "Lee", 21, "M", "2020-02-23", "Reely", 80),
(2423, "John", 24, "F", "2020-02-23", "Pta", 65),
(2756, "Rich", 19 ,"F", "2020-02-23", "Kby", 75),
(2757, "Telly", 20 ,"F", "2020-02-23", "UP", 55),
(2758, "Charle", 19 ,"F", "2020-02-23", "Cpt", 67),
(2759, "Bruda", 20 ,"M", "2020-02-23", "Cpt",67),
(2760, "Charle", 19 ,"M", "2020-02-23", "Cpt", 88),
(1758, "Mar", 19 ,"F", "2020-02-23", "Cpt", 78),
(1558, "Harle", 22 ,"M", "2020-02-23", "Jozi", 77),
(1258, "Charle", 19 ,"M", "2020-02-23", "Jozi", 65),
(1755, "Arle", 24 ,"F", "2020-02-23", "Pta", 90),
(1759, "Rarle", 18 ,"F", "2020-02-23", "Pta", 70);
#view the whole table
select * from students;
#view certain columns
select stu_name,age,city from students;
#where

select * from students where city = 'Kby';

#consist of both
select * from students where city = 'Kby' and gender = 'M';

#or operator means either this or that
select * from students where city = 'Jozi' or age =22;

select * from students where marks >60 and age = 22;

select * from students where marks >50 and age = 18;

select * from students where age>18 and (city ='Kby' or city= 'Pta');
# display marks in descending order
select * from students order by marks desc;

select * from students order by age asc, marks desc;

select stu_name from students where city is null;

select * from students limit 3;

select * from students 
where city = 'Jozi'  limit 3;

select min(marks) as minimummark from students;

select max(marks) from students;
select count(marks) from students;
select * from students;
select avg(marks) from students;
#sql statement selects students with student name startting with R
select * from students where stu_name like 'R%';
#students name ending a
select * from students where stu_name like '%a';
#student name with ar in any position
select * from students where stu_name like '%ar%';

#student name with letter a in second position
select * from students where stu_name like '_a%';
#select all students in kby and cpt
select * from students where city in ('Kby','Cpt');
#select all students not in kby and jozi
select * from students where city not in ('Kby','Jozi');
#select all students betweeen certain age
select * from students where age between 18 and 22;
#select all students not between certain age
select * from students where age not between 18 and 22;
#select all students between certain age and certain marks
select * from students where age between 18 and 22 and marks between 70 and 90;

select * from students where age between 18 and 22 and marks not in (60,70);
