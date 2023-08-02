-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

-- The result format is in the following example.

 
/*
Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+  */


select distinct num as ConsecutiveNums
from(
    select num,sum(c) over(order by id) as flag 
    from
        (select id, num,LAG(Num) OVER (order by id) as prev,
        case when LAG(Num) OVER (order by id)- Num = 0 then 0 else 1 end as c
        from logs ) a

    )b
group by num,flag
having count(*) >= 3
