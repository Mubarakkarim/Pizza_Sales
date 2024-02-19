  
   -- data  set
  Select * From pizza_sales

-- Total_Revenue

Select SUM(total_price) As "Total_Revenue (Rs)" From pizza_sales;

-- Total unit_price

Select SUM(unit_price) "Total unit Sales (Rs)" From pizza_sales;
Select COUNT(unit_price) "Total unit Sales (Rs)" From pizza_sales;

-- Average Order value

Select SUM(total_price)/ COUNT(DISTINCT(order_id)) AS "Average Order value" From pizza_sales;
  
-- Total pizza Sold

select SUM(quantity) AS "Total pizza Sold" From pizza_sales;

-- Total Order

Select COUNT(DISTINCT(order_id)) AS "Total Order"  From pizza_sales;

-- Average pizzas per order 
                       

select CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /

CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 

AS "Average pizzas per order" 

From pizza_sales;


--- Daily trend for total Orders


        Select DATENAME(DW, order_date) As day_Order, COUNT(DISTINCT order_id) 
             
			 AS total_order From pizza_sales

                   Group by DATENAME(DW, order_date);


 ---  Monthly trend for total Orders



  Select DATENAME(MONTH, order_date) As Month_Order, COUNT(DISTINCT order_id) 
   
    AS total_order From pizza_sales

       Group by DATENAME(MONTH, order_date)

         ORDER  BY total_order   DESC


 --- Percentage of Sales by pizza category

                         ------January
 
        Select pizza_category, CAST(SUM(total_price)*100 /(select SUM(total_price) 
   
         from pizza_sales Where MONTH(order_date) =3) AS DECIMAL(10,2)) 
   
             AS "% of Total" from pizza_sales
			 Where MONTH(order_date) =1
   
                 Group By pizza_category

				   ------february

				 Select pizza_category, CAST(SUM(total_price)*100 /(select SUM(total_price) 
   
         from pizza_sales Where MONTH(order_date) =2 ) AS DECIMAL(10,2)) 
   
             AS "% of Total" from pizza_sales
			 Where MONTH(order_date) =2
   
                 Group By pizza_category

				 --- March
				  Select pizza_category, CAST(SUM(total_price)*100 /(select SUM(total_price) 
   
         from pizza_sales Where MONTH(order_date) =3) AS DECIMAL(10,2)) 
   
             AS "% of Total" from pizza_sales
			 Where MONTH(order_date) =3
   
                 Group By pizza_category

  ----	 Percentage of Quantity by pizza category

    
  

    Select pizza_category, CAST(SUM(quantity)*100 /(select SUM(quantity) from pizza_sales) 
	 
	      AS DECIMAL(10,2)) from pizza_sales
      
               Group By pizza_category;

   ---- Percentage of sales by pizza size


			  -------Percentage of sales by pizza size for 1st Quarter

      Select  pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2))  AS Total_price, CAST(SUM(total_price)*100/
        (select SUM(total_price) From pizza_sales   Where DATEPART(QUARTER, order_date)=1)
          AS DECIMAL(10,2)) AS "% Sales"  From pizza_sales
		  Where DATEPART(QUARTER, order_date)=1
            Group by pizza_size
                  Order By SUM(unit_price)  DESC;

				    -------Percentage of sales by pizza size for 2nd Quarter

					Select  pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2))  AS Total_price, CAST(SUM(total_price)*100/
        (select SUM(total_price) From pizza_sales   Where DATEPART(QUARTER, order_date)=2)
          AS DECIMAL(10,2)) AS "% Sales"  From pizza_sales
		  Where DATEPART(QUARTER, order_date)=2
            Group by pizza_size
                  Order By SUM(unit_price)  DESC;

				  -------Percentage of sales by pizza size for 3rd Quarter


				  Select  pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2))  AS Total_price, CAST(SUM(total_price)*100/
        (select SUM(total_price) From pizza_sales   Where DATEPART(QUARTER, order_date)=3)
          AS DECIMAL(10,2)) AS "% Sales"  From pizza_sales
		  Where DATEPART(QUARTER, order_date)=3
            Group by pizza_size
                  Order By SUM(unit_price)  DESC;

				  ------Percentage of sales by pizza size for 4th Quarter

				   Select  pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2))  AS Total_price, CAST(SUM(total_price)*100/
        (select SUM(total_price) From pizza_sales   Where DATEPART(QUARTER, order_date)=4)
          AS DECIMAL(10,2)) AS "% Sales"  From pizza_sales
		  Where DATEPART(QUARTER, order_date)=4
            Group by pizza_size
                  Order By SUM(unit_price)  DESC;


      ------Total pizzas Sold by Pizza Category

	                                      ------Percentage of PIZZA sold  by pizza category for 1st Quarter

			Select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) As Total_Price, CAST(SUM(total_price)*100/

             (select SUM(total_price) From pizza_sales Where DATEPART(QUARTER, order_date)=1) AS DECIMAL(10,2))

                       AS "% total_price" From pizza_sales
			                    Where DATEPART(QUARTER, order_date)=1
								Group by pizza_category;

								 ------Percentage of PIZZA sold  by pizza category for 2nd  Quarter

			  Select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) As Total_Price, CAST(SUM(total_price)*100/

             (select SUM(total_price) From pizza_sales Where DATEPART(QUARTER, order_date)=2) AS DECIMAL(10,2))

                       AS "% total_price" From pizza_sales
			                    Where DATEPART(QUARTER, order_date)=2
								Group by pizza_category;

								 ------Percentage of PIZZA sold  by pizza category for 3rd  Quarter

								 Select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) As Total_Price, CAST(SUM(total_price)*100 / 
								 (select SUM(total_price) From pizza_sales Where DATEPART(QUARTER,order_date)=3) AS DECIMAL(10,2)) AS "% total_price"
								 From pizza_sales
								 Where DATEPART(QUARTER,order_date)=3
								 Group by pizza_category;


								 ------Percentage of PIZZA sold  by pizza category for 4th  Quarter

			 Select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) As Total_Price, CAST(SUM(total_price)*100/

             (select SUM(total_price) From pizza_sales Where DATEPART(QUARTER, order_date)=4) AS DECIMAL(10,2))

                       AS "% total_price" From pizza_sales
			                    Where DATEPART(QUARTER, order_date)=4
								Group by pizza_category;


         ----Top 5 best Sellers by Revenues


		 Select * From pizza_sales

		 
		 Select TOP 5 pizza_name, SUM(total_price) AS "Revenue" From pizza_sales
		 
		 Group By pizza_name
		
		Order By Revenue  DESC;

		------------Top 5 best Sellers by Total quantity

		Select TOP 5 pizza_name, SUM(quantity) AS Total_Quantity From pizza_sales
		 
		 Group By pizza_name
		
		Order By Total_Quantity  DESC;

		------------Top 5 best Sellers by Order

		Select TOp 5 pizza_name, COUNT(DISTINCT order_id) As Total_order From pizza_sales
		 Group by pizza_name
		 Order By Total_order  DESC;

----Bottom 5 Worsts Sellers by Revenue

     Select TOP 5 pizza_name, SUM(total_price) AS "Revenue" From pizza_sales
		 
		 Group By pizza_name
		
		Order By Revenue ASC;

		-----------Bottom 5 Worsts Sellers by Total quantity

		Select TOP 5 pizza_name, SUM(quantity) AS Total_Quantity From pizza_sales
		 
		 Group By pizza_name
		
		Order By Total_Quantity  ASC;

		------------Bottom 5 Worst Sellers by Order

		Select TOp 5 pizza_name, COUNT(DISTINCT order_id) As Total_order From pizza_sales
		 Group by pizza_name
		 Order By Total_order  ASC;




		 mc mc mcv



