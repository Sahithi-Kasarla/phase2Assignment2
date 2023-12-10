create database Assignment2
use Assignment2
create table CompanyInfo(
Cid int primary key,
CName nvarchar(50) not null unique)
insert into CompanyInfo values (1,'Samsung'),(2,'HP'),(3,'Apple'),(4,'Dell'),(5,'Toshiba'),(6,'Redmi')

create table ProductInfo(
PId int primary key,
PName nvarchar(50) not null,
PPrice float not null,
PMDate date,
Cid int foreign key references CompanyInfo(Cid))
insert into ProductInfo values (101,'Laptop',55000.90,'12/12/2023',1),
(102,'Laptop',35000.90,'12/12/2012',2),
(103,'Mobile',15000.90,'12/03/2012',2),
(104,'Laptop',135000.90,'12/12/2012',3),
(105,'Mobile',65000.90,'12/12/2012',3),
(106,'Laptop',35000.90,'12/12/2012',5),
(107,'Mobile',35000.90,'12/01/2012',5),
(108,'Earpod',1000.90,'12/01/2022',3),
(109,'Laptop',85000.90,'12/12/2021',6),
(110,'Mobile',55000.70,'12/12/2020',1)

select * from CompanyInfo order by cid
select * from ProductInfo

select c.Cid,c.cname,p.pid,p.pname,p.pprice,p.pmdate from CompanyInfo c left join ProductInfo p on c.cid=p.cid

select c.cname,p.pname from CompanyInfo c right join ProductInfo p on c.cid=p.cid

select cname,pid,pname,pprice,pmdate  from CompanyInfo cross join ProductInfo