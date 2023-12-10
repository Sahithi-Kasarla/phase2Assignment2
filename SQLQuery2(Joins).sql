--joins
--syntax
--select <columnName1>,<columnName2>...<ColumnNameN>
--from table-a as table-alias-a join
--table-b as table-alias-b on
--table_alias_a,<commoncolumn>=table_alias_b.<commoncolumn>

Use Day2DB
create table Depts
(DId int primary key,
DName nvarchar(50) not null unique)
insert into Depts values(1,'hr'),(2,'accoutnt'),(3,'development'),(4,'web-development'),(5,'agile-scrum')
select *from Depts order by DId

create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50)not null,
Salary float,
Department int)
insert into Emps values(1,'sam','ruthu',56444,3)
insert into Emps values(10,'Ravi','kumar',56984,4)
insert into Emps values(7,'surya','deeo',45676,3)
insert into Emps values(6,'kangana','ranathu',4564,1)
insert into Emps(Id,Fname,Lname) values(1,'sam','ruthu'),(2,'viren','naik'),(34,'garima','prasad')

insert into Emps values(13,'neil','kithulu',89544,1)
insert into Emps values(8,'kajal','agarwal',58343,1)
insert into Emps(Id,Fname,Lname,Salary) values(15,'kamal','hassan',786950)

select *from Emps order by Id
select *from Depts order by DId
---inner join
--equi or join
--select <columnName1>,<columnName2>...<ColumnNameN>
--from table-a as table-alias-a join
--table-b as table-alias-b on
--table_alias_a,<commoncolumn>=table_alias_b.<commoncolumn>
select *from Emps e join Depts d on e.Department=d.DId
select e.Id,e.Fname,e.Lname,e.Salary,d.DId,d.Dname from Emps e join Depts d on e.Department=d.DId

select e.Id,e.Fname,e.Lname,e.Salary,d.DId,d.Dname from Emps e inner join Depts d on e.Department=d.DId
--left outer join
select e.Id,e.Fname,e.Lname,e.Salary,d.DId,d.Dname from Emps e left outer join Depts d on e.Department=d.DId
--right outer join
select e.Id,e.Fname,e.Lname,e.Salary,d.DId,d.Dname from Emps e  right outer join Depts d on e.Department=d.DId
--full outer join
select e.Id,e.Fname,e.Lname,e.Salary,d.DId,d.Dname from Emps e full outer join Depts d on e.Department=d.DId

select *from Emps Cross join Depts
--cross join
--m rows in left join
--n rows in right 
--m*n in cross join
create table Colors
(Id int primary key identity, Color nvarchar(50) not null unique)
insert into Colors values('Red'),('Green'),('Blue'),('Pink'),('White')
create table Sizes
(Id int primary key identity,Size nvarchar(50) not null unique)
truncate table Sizes
insert into Sizes values ('M'),('S'),('L')
select *from Colors order by Id
select *from Sizes order by Id
select Color,Size from Colors cross join Sizes

insert into Sizes values('XL')
select Color,Size from Colors cross join Sizes

