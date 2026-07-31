
# For KPI's

create database coffe_shop_sales_db;
show tables;
#select * from coffee_shop_sales

update coffee_shop_sales
set transaction_date=str_to_date(transaction_date, '%Y/%m/%d');

alter table coffee_shop_sales
modify column transaction_date date;

#describe coffee_shop_sales

update coffee_shop_sales
set transaction_time=str_to_date(transaction_time, '%H:%i:%s');

alter table coffee_shop_sales
modify column transaction_time time;

alter table coffee_shop_sales
change column ï»¿transaction_id transaction_id int;

# Sales Analysis
#select * from coffee_shop_sales;

#select round(sum(unit_price*transaction_qty)) as total_sales from coffee_shop_sales
#where month(transaction_date)=5                 # May Month

#% increas or decrease in orders mom

with mon_sales as(select month(transaction_date) as month,count(transaction_id) as total_orders
from  coffee_shop_sales where month(transaction_date) in (4,5)
group by month(transaction_date))
select month,round(total_orders) as total_orders,round((total_orders-lag(total_orders,1) over(order by month))/lag(total_orders,1) over(order by month)*100,2) as mom_increase_percentage      # Percedence rule   />*>+,-
from mon_sales order by month;


# Total Order Analysis

select * from coffee_shop_sales

select count(*) as total_orders from coffee_shop_sales
where month(transaction_date)=3;             # March month

#% increas or decrease in orders mom

with mon_sales as(select month(transaction_date) as month,count(transaction_id) as total_orders
from  coffee_shop_sales where month(transaction_date) in (4,5)
group by month(transaction_date))
select month,round(total_orders) as total_orders,round((total_orders-lag(total_orders,1) over(order by month))/lag(total_orders,1) over(order by month)*100,2) as mom_increase_percentage      # Percedence rule   />*>+,-
from mon_sales order by month;


# Total Quantity sold analysis

#select * from coffee_shop_sales

select sum(transaction_qty) as total_qty from coffee_shop_sales
where month(transaction_date)=5;
#% increase and decrease in qty mom

with mon_qty as(select month(transaction_date) as month,sum(transaction_qty) as total_qty from coffee_shop_sales
where month(transaction_date) in(4,5) group by month(transaction_date))
select month,round(total_qty) as total_qty,round((total_qty-lag(total_qty,1) over (order by month))/lag(total_qty,1) over(order by month)*100,2) as mom_increase_percentage
from mon_qty order by month;