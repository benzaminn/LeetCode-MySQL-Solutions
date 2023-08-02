-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- Return the result table in any order.

-- The query result format is in the following example.

 
/*
Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+  */


with view as (
    select product_id,new_price,change_date,
    ROW_NUMBER() over(partition by product_id order by change_date DESC) as row_num
    from Products 
    where change_date <="2019-08-16"
),
P as (
  select distinct product_id
  from  Products
)

select P.product_id,coalesce(view.new_price,10) as price
from P
left join View
on P.product_id = View.product_id
and View.row_num = 1
