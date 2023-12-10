--DDl:Data Definition Language-create,alter,drop
--DML:Data Manipulation Lang-insert,update,delete
--DCL:Data Control Language-grant,revoke

create database Day2DB
use Day2Db
create table Emp
(Id int primary key,
Fname nvarchar(50) not null, 
Lname nvarchar(50),
Designation nvarchar(50) default 'Developer',
Salary float not null check(Salary>=1000 and Salary<=1500000))
select *from Emp
-----insert
--insert into <table name>(column name.....)values(value.....)
insert into Emp(Id, Fname,Lname,Designation,Salary)values(1,'sam','ruthu','manager',56550.6)
insert into Emp(Id,Fname,Lname,Salary) values (2,'dharam','veer',58900.4),(3,'ran','vijay',34999),(4,'ram','pandu',56777),(8,'bamchik','babloo',56999)

select *from Emp

select Fname,Lname,Designation from Emp

select Fname,Lname,Designation from Emp where Id<=10
select *from Emp
--update table set Column=valuew where condition
update Emp set Lname='Das' where Id=2
select *from Emp
update Emp set Lname='Sharma' where Id>=4
update Emp set Lname='Reddy' ,Salary=95000,Designation='TL'where Id=3

----delete
select *from Emp
delete from Emp where ID=1

delete from Emp where Lname='Das'
select *from Emp
delete from Emp

select *from Emp
insert into Emp(Id,Fname,Lname,Designation,Salary) values
(10,'sam','ruthu','manager',56550.6),
(9,'Chinna','kutti','Developer',58900.4),
(7,'prince','narulla','TL',34999)
insert into Emp(Id,Fname,Lname,Salary) values (2,'dharam','veer',58900.4),(3,'ran','vijay',34999),(4,'ram','pandu',56777),(8,'bamchik','babloo',56999)
select *from Emp

--delete vs drop
--delete :we can delete a single record or multiple records or all records but struture of table remain in database
--drop:all records delte and structure of table also gone.. Nothing reamin in database
drop table Emp
select *from Emp
-------------------------truncate vs delete-------------------------------------
--truncate:used to remove the records from table & it resets the identity
create table Products
(PId int primary key identity(500,1),
Pname nvarchar(50) not null,
Price float)
insert into Products values('Iphone-15',75000)
insert into Products values('OnePuls',93000)
insert into Products values('Zplus-15',87000)
insert into Products values('Iphone-13',56000)
select *from Products
delete from Products where PId =501

delete from Products

select *from Products

insert into Products values('oppo A98',96000)

select *from Products
-----------------------------------------------------
drop table Products
create table Products
(PId int primary key identity(500,1),
Pname nvarchar(50) not null,
Price float)
insert into Products values('Iphone-15',75000)
insert into Products values('OnePuls',93000)
insert into Products values('Zplus-15',87000)
insert into Products values('Iphone-13',56000)
select *from Products
truncate table products
insert into Products values('oppo A98',96000)
select *from Products
--not null
--primary key
--check
--identity
--unique
--foreign key
--check constraint for pattern checking
create table Student
(SId int primary key,
SName nvarchar(50) not null,
Contact varchar(10) not null unique check (Contact like  '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
insert into Student values(1,'sam','9867584756')
insert into Student values(2,'Ram','987984756')
--Msg 547, Level 16, State 0, Line 98
--The INSERT statement conflicted with the CHECK constraint "CK__Student__Contact__403A8C7D". The conflict occurred in database "Day2DB", table "dbo.Student", column 'Contact'.
--The statement has been terminated.
insert into Student values(2,'Ram','98798475k')
--Msg 547, Level 16, State 0, Line 102
--The INSERT statement conflicted with the CHECK constraint "CK__Student__Contact__403A8C7D".
--The conflict occurred in database "Day2DB", table "dbo.Student", column 'Contact'.
--The statement has been terminated.
insert into Student values(2,'Ram','9879847598')
insert into Student values(3,'Shinnnu','9879847589')
select *from Student

create table Fee
(FeeId int primary key identity(1000,1),
SId int foreign key references Student(SId),
FAmount float,
DepositDate date)

insert into Fee(SId,FAmount,DepositDate)values(1,5000,'12/12/2022')
insert into Fee(SId,FAmount,DepositDate)values(2,5000,'12/09/2022')
insert into Fee(SId,FAmount,DepositDate)values(9,5000,'12/12/2022')
--Msg 547, Level 16, State 0, Line 119
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Fee__SId__4316F928". 
--The conflict occurred in database "Day2DB", table "dbo.Student", column 'SId'.
--The statement has been terminated.
select *from Student
select *from Fee
select *from Student,Fee where Student.SId =Fee.Sid

select *from Student s, Fee f where s.SId=f.SId

select s.SId,s.SName,s.Contact,f.FeeId,f.FAmount,f.DepositDate from Student s,Fee f where s.SId=f.SId

select s.SId 'Student ID',s.SName 'Student Name',s.Contact,f.FeeId,f.FAmount 'Fee Amount',f.DepositDate 
from Student s,Fee f where s.SId=f.SId
---------------------------------------------------
create table Category
(CId int primary key,
CName nvarchar(50) not null unique)
insert into Category values(1,'Drama'),(2,'Action'),(3,'comedy'),(4,'scientific')
select *from Category

create table Movies
(MId int primary key,
Title nvarchar(100)not null,
StarCast nvarchar(200) not null,
MCat int foreign key references Category(CId))
insert into Movies values(1,'the godfather',' Al Pacino, m.Brando',2)
insert into Movies values(2,'Titanic',' Kate Winslet',3)
insert into Movies values(4,'Dark Night',' ........',5)

select *from Category,Movies where Movies.MCat=Category.CId
