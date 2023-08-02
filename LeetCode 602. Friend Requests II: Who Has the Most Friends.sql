-- Write an SQL query to find the people who have the most friends and the most friends number.

-- The test cases are generated so that only one person has the most friends.

-- The query result format is in the following example.

/*
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+ */


select X.requester as id,sum(X.count) as num
from (
  select distinct requester_id as requester,
  count(requester_id) as count
  from RequestAccepted
  group by requester

  union all

  select distinct accepter_id as requester,
  count(accepter_id) as count
  from RequestAccepted
  group by requester
)X

group by X.requester
order by sum(X.count) desc
limit 1
