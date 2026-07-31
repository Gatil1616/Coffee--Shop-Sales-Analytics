
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
# For Charts

#select * from coffee_shop_sales

select concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as Total_sales,concat(round(sum(transaction_qty)/1000,2),'K') as Total_qty,concat(round(count(transaction_id)/1000,2),'K') as Total_orders from coffee_shop_sales
where transaction_date='2023-05-18';

#sun=1  mon=2 ..... fri=6  sat=7

select case when dayofweek(transaction_date)in(1,7) then "weekends"
else "weekdays" end as day_type,concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as Total_sales from coffee_shop_sales
where month(transaction_date)=5   # May month
group by day_type;

select store_location,concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as Total_sales from coffee_shop_sales
where month(transaction_date)=5          # May 
group by store_location order by Total_sales desc;

select concat(round(avg(total_sales)/1000,1),'K') as avg_sales 
from( select sum(unit_price*transaction_qty) as total_sales from coffee_shop_sales
where month(transaction_date)=4 group by transaction_date) t;

select day(transaction_date) as day_of_month,sum(unit_price*transaction_qty) as total_sales
from coffee_shop_sales where month(transaction_date)=4 
group by day_of_month order by day_of_month;

with sales as(select day(transaction_date) as day_of_month,sum(unit_price*transaction_qty) as total_sales from coffee_shop_sales
where month(transaction_date)=5 group by day_of_month)
select day_of_month,total_sales,
case when total_sales>avg(total_sales) over()  then "Above Average"
when total_sales<avg(total_sales) over() then "Below Average"
else "Equals to Average" end as sales_status from sales order by day_of_month;

select product_category,concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as total_sales from coffee_shop_sales
where month(transaction_date)=5
group by product_category order by total_sales desc;

# Top 10 product by sale for a month

select product_type,concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as total_sales from coffee_shop_sales
where month(transaction_date)=4
group by product_type order by total_sales desc limit 10;

# same for coffee category

select product_type,concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as total_sales from coffee_shop_sales
where month(transaction_date)=5 and product_category='coffee'
group by product_type order by total_sales desc;

# For particular day and hour
select concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as Total_sales,sum(transaction_qty) as Total_qty_sold,count(*) as Total_orders from coffee_shop_sales
where month(transaction_date)=5
and dayofweek(transaction_date)=2   #Monday
and  hour(transaction_time)=8;       # hour no.8

select hour(transaction_time) as Hour,concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as Total_sales from coffee_shop_sales
where month(transaction_date)=3
group by Hour order by Hour;

select case when dayofweek(transaction_date)=1 then 'Sunday'
when dayofweek(transaction_date)=2 then 'Monday'
when dayofweek(transaction_date)=3 then 'Tuesday'
when dayofweek(transaction_date)=4 then 'Wednesday'
when dayofweek(transaction_date)=5 then 'Thursday'
when dayofweek(transaction_date)=6 then 'Friday'
else 'Saturday' end as days_of_week,concat(round(sum(unit_price*transaction_qty)/1000,2),'K') as Total_sales from coffee_shop_sales
where month(transaction_date)=4 group by days_of_week;
