-- Write an SQL query to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

-- have the same tiv_2015 value as one or more other policyholders, and
-- are not located in the same city like any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).

/*
Insurance table:
+-----+----------+----------+-----+-----+
| pid | tiv_2015 | tiv_2016 | lat | lon |
+-----+----------+----------+-----+-----+
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |
+-----+----------+----------+-----+-----+
Output: 
+----------+
| tiv_2016 |
+----------+
| 45.00    |
+----------+ */


select ROUND(SUM(X.TIV_2016),2) as TIV_2016
from (
    select *,
    count(*) over(partition by tiv_2015) as count1,
    count(*) over(partition by lat,lon) as count2
    from Insurance
) X
where X.count1 > 1 and X.count2=1
