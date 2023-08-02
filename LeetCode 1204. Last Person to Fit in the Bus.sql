-- There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

-- Write an SQL query to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.

-- The query result format is in the following example.

 
/*
Example 1:

Input: 
Queue table:
+-----------+-------------+--------+------+
| person_id | person_name | weight | turn |
+-----------+-------------+--------+------+
| 5         | Alice       | 250    | 1    |
| 4         | Bob         | 175    | 5    |
| 3         | Alex        | 350    | 2    |
| 6         | John Cena   | 400    | 3    |
| 1         | Winston     | 500    | 6    |
| 2         | Marie       | 200    | 4    |
+-----------+-------------+--------+------+
Output: 
+-------------+
| person_name |
+-------------+
| John Cena   |
+-------------+ */



select person_name
from(
    select Q1.turn,Q1.person_name,Q1.weight,
    sum(Q2.weight) as total_weight
    from QUEUE Q1
    join QUEUE Q2
    on Q1.turn >= Q2.turn 
    group by Q1.turn
    order by Q1.turn,Q2.turn
    )X

where total_weight <= 1000
order by total_weight DESC
limit 1

