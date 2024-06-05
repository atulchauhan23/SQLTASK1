select * from laptop

select * from sales

select * from confg

-- 1: count and distinct of  company
select count(company) from laptop
select distinct(company) from laptop
select count (distinct company) from laptop
select company, count(company) from laptop group by company 

--count and distinct of  product

select count(product) from laptop
select count (distinct product) from laptop
select distinct(product) from laptop
select product, count(product) from laptop group by product 

--count and distinct of type_name
select count(type_name) from laptop
select distinct(type_name) from laptop
select count (distinct type_name) from laptop
select type_name, count(type_name) from laptop group by type_name

--count and distinct of op_sys,cpu,gpu,ram,memory,inches of confg table

select count(op_sys) from confg
select distinct(op_sys) from confg
select count (distinct op_sys) from confg
select op_sys, count(op_sys) from confg group by op_sys

select count(cpu) from confg
select distinct(cpu) from confg
select count (distinct cpu) from confg
select cpu, count(cpu) from confg group by cpu

select count(ram) from confg
select distinct (ram) from confg
select count(distinct ram) from confg
select ram, count(ram) from confg group by ram

select count(memory) from confg
select distinct(memory) from confg
select count(distinct memory) from confg
select memory, count(memory) from confg group by memory

--count and distinct of customer_type,gender,payment_mode of sales table

select count(customer_type) from sales
select distinct (customer_type) from sales
select count(distinct customer_type) from sales
select customer_type, count(customer_type) from sales group by customer_type

select count(gender) from sales
select distinct (gender) from sales
select count(distinct gender) from sales
select gender, count(gender) from sales group by gender

select count(payment_mode) from sales
select distinct (payment_mode) from sales
select count(distinct payment_mode) from sales
select payment_mode, count(payment_mode) from sales group by payment_mode

--  1 : Creating a new table cust_info using select query.

create table cust_info as 
select customer_id,customer_name,payment_mode,city from sales

--  2 : Creating a new table sales_info using select query.

create table sales_info as 
select id,invoice,quantity,branch,customer_type,gender,confg_id from sales

-- 3 : Join 3 tables

select * from laptop as lap
inner join confg as con
on lap.id = con.laptop_id
inner join sales as s
on con.laptop_id = s.id

-- 4 : join with where

select * from laptop as lap
inner join confg as con
on lap.id = con.laptop_id
where company = 'Apple'

-- 5 : get the data of laptop type_name and ram whose sum of price above 1000

select sum(lap.price_euros),lap.type_name,con.ram from laptop as lap 
inner join confg as con
on lap.id = con.id
group by lap.type_name, con.ram
having sum(price_euros) > 1000

-- 6 : get the payment mode of sales branch whose quantity of laptop sold above 10 

select payment_mode,branch,max(quantity) from sales
group by payment_mode,branch
having max(quantity)>10
order by max(quantity)

-- 7 : window function (RANK)

select customer_name,city,quantity,branch,customer_type,payment_mode,
RANK() OVER(
partition by payment_mode
order by quantity desc
)	
from sales

-- 8 : Subquery

--find the laptop who's price is more than ave price of the all laptop's

select * from laptop
where price_euros >(select avg(price_euros) from laptop)




