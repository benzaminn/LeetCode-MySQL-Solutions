-- Find employees who have the highest salary in each of the departments.

-- Return the result table in any order.

-- The result format is in the following example.

 
/*
Example 1:

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+ */


select D.name as Department,E.name as Employee,E.salary as Salary
from Employee E
join Department D
on E.departmentId = D.id
where (E.departmentId,E.salary) in (select departmentId,MAX(salary) as Salary from Employee group by departmentId )
