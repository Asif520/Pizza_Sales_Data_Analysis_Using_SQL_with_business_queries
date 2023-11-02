select * from pizza_sales


------------------------------------KPI----------------------------------------
---------Total Revenue------

select Round(SUM(total_price),2) as 'Total Revenue'
from pizza_sales

---------Order Value--------

select Round(SUM(total_price) /(COUNT(Distinct order_id)),2) as 'Order Value'
from pizza_sales


---------Total Pizzas Sold----------

select SUM(quantity) as 'Total Pizzas Sold'
from pizza_sales


----------Total Orders----------------

select COUNT(Distinct order_id) as 'Total Orders'
from pizza_sales


----------Average Pizzas Per Order--------------

select SUM(quantity)/(COUNT(Distinct order_id)) as 'Average Pizzas Per Order'
from pizza_sales

---------------------------------CHART Requirements-----------------------------

----hourly trend for total pizzas sold

select DATEPART(HOUR, ORDER_TIME) AS 'ORDER HOUR', SUM(QUANTITY) AS 'PIZZAS SOLD'
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--hourly trend for total ORDERS

select DATEPART(HOUR, ORDER_TIME) AS 'ORDER HOUR', COUNT(Distinct order_id) as 'Total Orders'
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--WEEKLY trend for total ORDERS
select DATEPART(iso_WEEK,order_date) AS 'WEEK NUMBER',YEAR(order_date), COUNT(Distinct order_id) as 'Total Orders'
FROM pizza_sales
GROUP BY DATEPART(iso_WEEK,order_date),YEAR(order_date)
ORDER BY DATEPART(iso_WEEK,order_date),YEAR(order_date)

--PERCENTAGE OF SALES BY PIZZA CATEGORY

select pizza_category ,ROUND(SUM(total_price)*100/(select sum(total_price) from pizza_sales),2) as 'Total Sales (%)'
from pizza_sales
where MONTH(order_date)=1
GROUP BY pizza_category
order by pizza_category

--PERCENTAGE OF SALES BY PIZZA size

select pizza_size, ROUND(SUM(total_price)*100/(select sum(total_price) from pizza_sales),2) as 'Total Sales (%)'
from pizza_sales
group by pizza_size
order by pizza_size

--Total Pizzas Sold by Category

select pizza_category,SUM(quantity) as 'Total Pizzas Sold'
from pizza_sales
group by pizza_category
order by pizza_category;



select * from pizza_sales;

--Top 5 Best Selling pizzas based on Revenue

SELECT top 5 pizza_name, ROUND(SUM(total_price), 2) AS "Revenue"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Revenue" DESC

--Top 5 Best Selling pizzas based on Quantity

SELECT top 5 pizza_name, SUM(quantity) AS "Quantity"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Quantity" DESC

--Top 5 Best Selling pizzas based on Total Orders

SELECT top 5 pizza_name, COUNT(order_id) AS "Total Orders"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Total Orders" DESC


select * from pizza_sales

--Bottom 5 Best Selling pizzas based on Revenue

SELECT top 5 pizza_name, ROUND(SUM(total_price), 2) AS "Revenue"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Revenue"

--Bottom 5 Best Selling pizzas based on Quantity

SELECT top 5 pizza_name, SUM(quantity) AS "Quantity"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Quantity"

--Bottom 5 Best Selling pizzas based on Total Orders

SELECT top 5 pizza_name, COUNT(order_id) AS "Total Orders"
FROM pizza_sales
GROUP BY pizza_name
ORDER BY "Total Orders"


select pizza_category ,ROUND(SUM(total_price)*100/(select sum(total_price) from pizza_sales),2) as 'Total Sales (%)'
from pizza_sales
GROUP BY pizza_category
order by pizza_category
