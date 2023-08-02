-- Find the managers with at least five direct reports.

-- Return the result table in any order.

-- The result format is in the following example.

 
/*
Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | None      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+*/


select E2.name
from Employee E1
inner join Employee E2 
on E1.managerId = E2.id
group by E2.name
having count(*) >= 5

