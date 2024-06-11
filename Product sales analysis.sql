create database intern;
use intern;
create table sales
(sales_id int primary key auto_increment,
product_id int,
customer_name text,
location text,
sales_person text,
customer_type text,
Dates datetime,
Quantity int,
values_in_Rupiah int);

insert into sales(product_id,customer_name,location,sales_person,customer_type,Dates,Quantity,values_in_Rupiah)
values(100,'Holiday Inn','Bandung','Gates','Hotel','2019-10-01 00:00:00',25,50000000),
(200,'McKinsey','Jakarta','Kristi','Corporate','2019-11-01 00:00:00',300,35000000),
(300,'Ritz Carlton', 'Jakarta', 'Oprah','Hotel','2019-12-01 00:00:00',40,65000000),
(100,'McD','Makassar','Mark','Restaurant','2018-10-01 00:00:00',60,85000000),
(200,'Sate Senayan','Bali','Mercy','Restaurant','2018-11-01 00:00:00',220,29000000),
(300,'Hypermart','Medan','Frans','Retail','2018-12-01 00:00:00',20,22000000),
(100,'Holiday Inn','Jakarta','Gates','Hotel','2016-10-01 00:00:00',29,58000000),
(200,'McD','Jakarta','Mark','Restaurant','2016-11-01 00:00:00',100,200000000),
(300,'Sate Senayan','Jakarta','Mercy','Restaurant','2016-12-01 00:00:00',150,19000000),
(100,'Grand Hayat','Jakarta','Merry','Hotel','2017-10-01 00:00:00',33,58000000),
(200,'Microsoft','Jakarta','Kristi','Corporate','2017-11-01 00:00:00',22,40000000),
(300,'Google','Jakarta','William','Corporate','2017-12-01 00:00:00',150,18000000);

select * from sales;

create table products(
product_id int,
product_name varchar(225),
brand varchar(225),
U_o_M varchar(225));
INSERT INTO products(product_ID,product_name,brand,U_o_M)
values(100, 'Illy Ground 250 Gr', 'illy', 'Kg'),
(200, 'Viktory Ground 500 Gr', 'Viktory', 'Kg'),
(300, 'San Pellegrino Sparkling 500 MI', 'Water', 'Bottle'),
(400, 'Mango Puree Sorbetto', 'Ice Cream','Kg');


select * from sales
where values_in_rupiah > 30000000
order by values_in_rupiah desc;

select customer_name,customer_type,dates,values_in_rupiah 
from sales 
order by dates;

select customer_name,customer_type as channel,dates,values_in_rupiah 
from sales 
order by dates;

select customer_type, sum(values_in_rupiah) from sales
group by customer_type
order by sum(values_in_rupiah) desc;

 
select a.product_id,b.product_id,a.dates,a.sales_person,a.customer_type,b.product_name,b.brand,a.values_in_rupiah
from sales a
inner join products b
on a.product_id=b.product_id;

select a.product_id,b.product_id,a.dates,a.sales_person,a.customer_type,b.product_name,b.brand,a.values_in_rupiah
from sales a
inner join products b
on a.product_id=b.product_id
where sales_person = 'kristi'
and YEAR(dates) between 2017 and 2019
order by values_in_rupiah;

select b.product_name,sum(a.values_in_rupiah),sum(a.quantity)
from sales a
inner join products b
on a.product_id=b.product_id
group by product_name;


select b.product_name,avg(a.values_in_rupiah),avg(quantity)
from sales a
inner join products b
on a.product_id=b.product_id
group by product_name;

select b.product_name,max(a.values_in_rupiah) as maximum,max(quantity)
from sales a
inner join products b
on a.product_id=b.product_id
group by product_name;

select b.product_name,min(a.values_in_rupiah),min(quantity)
from sales a
inner join products b
on a.product_id=b.product_id
group by product_name;

select year(dates) as YEARR, sum(values_in_rupiah) as total_sales
from sales
group by YEARR;

select * from sales;
select * from products;

select b.product_name,a.values_in_rupiah
from sales a
inner join products b
on a.product_id = b.product_id;

