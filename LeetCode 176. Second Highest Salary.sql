-- Find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

/*
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+  */


select max(salary) as secondHighestSalary
from employee
where salary < (select max(salary) from employee)
