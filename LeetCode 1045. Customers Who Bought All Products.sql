-- Write an SQL query to report the customer ids from the Customer table that bought all the products in the Product table.

-- Return the result table in any order.

-- The query result format is in the following example.

 
/*
Example 1:

Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+ */




select customer_id 
from customer
where product_key in (select product_key from Product)
group by customer_id
having count(distinct product_key)=(select count(distinct product_key) from product)



