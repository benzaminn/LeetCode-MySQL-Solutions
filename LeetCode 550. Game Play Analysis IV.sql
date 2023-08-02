-- Write an SQL query to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

-- The query result format is in the following example.

 
/*
Example 1:

Input: 
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+ */


SELECT  ROUND(COUNT(t2.player_id)/COUNT(t1.player_id),2) AS fraction
FROM 
    (SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id) t1 
    LEFT JOIN Activity t2
    ON t1.player_id = t2.player_id AND t1.first_login = t2.event_date - 1
