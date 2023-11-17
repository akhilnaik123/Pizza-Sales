
SELECT* FROM pizza_sales;


--Total Revenue
   
          SELECT round(SUM(total_price),2) as revenue
          FROM pizza_sales;
  
--Average Order Value
  
          SELECT round(SUM(total_price)/count(distinct order_id),4) as average_order_value 
          FROM pizza_sales;

 --Total Pizza Sold
        
         SELECT sum(quantity) FROM pizza_sales;

 --Total Orders
         SELECT count(distinct order_id)
	 FROM pizza_sales

 --Average Pizza Per Order
	 
          SELECT cast(cast(sum(quantity) as decimal(10,2))/
	  cast(count(distinct order_id) as decimal(10,2))  as decimal(10,2)) Average_Pizza_Per_Order
	  FROM pizza_sales


---PROBLEM STATEMENTS----------------------------------------------------------------------

 -- Daily trend for total orders
	  
          SELECT DATENAME(dw,order_date) as weekdays,
	         COUNT(distinct order_id) as total_orders FROM pizza_sales
	  GROUP BY DATENAME(dw,order_date)

 -- monthly trend for total order
	 
          SELECT DATENAME(month,order_date) as months,
	         COUNT(distinct order_id) as total_orders 
	  FROM pizza_sales
	  GROUP BY DATENAME(month,order_date)
	
 -- percentage of sales by catagory

	 SELECT pizza_category,round(sum(total_price)*100/
	       (SELECT sum(total_price) FROM pizza_sales),2) as PcT
	 FROM pizza_sales
	 GROUP  BY pizza_category
	
-- percentage of sales by catagory for first month

	 SELECT pizza_category,sum(total_price)*100/
	       (SELECT sum(total_price) FROM pizza_sales where MONTH(order_date)=1) as PcT
	 FROM pizza_sales
	 WHERE MONTH(order_date)=1
	 GROUP  BY pizza_category

 -- percentage of sales by PIZZA SIZE
	
         SELECT pizza_size, ROUND(sum(total_price)*100/
              (SELECT sum(total_price) from pizza_sales),2) AS  PcT
	 FROM pizza_sales
	 GROUP BY pizza_size
	 ORDER BY PcT DESC

 -- Total Pizza Sold by Pizza Catagory
	
         SELECT pizza_category,CAST(sum(total_price) AS decimal(10,2)) as total_sales
	 FROM pizza_sales
	 GROUP BY pizza_category
	 ORDER BY total_sales DESC
 
 --5 best sellers by revenue
	 SELECT TOP 5 pizza_name,CAST(SUM(total_price) as decimal(10,2)) AS total_Revenue
	 FROM pizza_sales
	 GROUP BY pizza_name
	 ORDER BY total_revenue desc

 --5 best sellers by Quantity
        
         SELECT top 5 pizza_name,SUM(quantity) as total_quantity
	 FROM pizza_sales
	 GROUP BY pizza_name
	 ORDER BY total_quantity desc

 --5 best sellers by total orders

	 SELECT top 5 pizza_name,count(distinct order_id)as total_orders
	 FROM pizza_sales
	 GROUP BY	pizza_name
	 ORDER BY total_orders desc

  --5 worst sellers by revenue
	SELECT TOP 5 pizza_name,CAST(SUM(total_price) as decimal(10,2)) AS total_Revenue
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY total_revenue 




