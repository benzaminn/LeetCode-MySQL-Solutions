-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

-- Return the result table in any order.

-- The query result format is in the following example.

 
/*
Example 1:

Input: 
Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |
+------+---------+----------+--------+------------+  */


select left(trans_date,7) as month,country,count(ID) as trans_count,SUM(if(state='approved',1,0)) as approved_count,sum(amount) as trans_total_amount,SUM(if(state='approved',amount,0)) as approved_total_amount
from Transactions 
group by left(trans_date,7),country 
