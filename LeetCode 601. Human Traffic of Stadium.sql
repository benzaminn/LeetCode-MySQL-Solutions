-- Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.

-- Return the result table ordered by visit_date in ascending order.

-- The query result format is in the following example.

 
/*
Example 1:

Input: 
Stadium table:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+*/


select distinct t1.*
from Stadium t1,Stadium t2,Stadium t3
where t1.people >=100 and t2.people >= 100 and t3.people >= 100
and (
(t1.id - t2.id = 1 and t1.id - t3.id = 2 and t2.id - t3.id = 1)
  OR
(t2.id - t1.id = 1 and t3.id - t1.id = 2 and t3.id - t2.id = 1)
  OR
(t1.id - t2.id = 1 and t3.id - t1.id =1 and t3.id - t2.id = 2)
)
order by t1.visit_date
