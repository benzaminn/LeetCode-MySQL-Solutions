/*
The winning streak of a player is the number of consecutive wins uninterrupted by draws or losses.

Write an SQL query to count the longest winning streak for each player.

Return the result table in any order.

The query result format is in the following example.

Example 1:

Input: 
Matches table:
+-----------+------------+--------+
| player_id | match_day  | result |
+-----------+------------+--------+
| 1         | 2022-01-17 | Win    |
| 1         | 2022-01-18 | Win    |
| 1         | 2022-01-25 | Win    |
| 1         | 2022-01-31 | Draw   |
| 1         | 2022-02-08 | Win    |
| 2         | 2022-02-06 | Lose   |
| 2         | 2022-02-08 | Lose   |
| 3         | 2022-03-30 | Win    |
+-----------+------------+--------+
Output: 
+-----------+----------------+
| player_id | longest_streak |
+-----------+----------------+
| 1         | 3              |
| 2         | 0              |
| 3         | 1              |
+-----------+----------------+
Explanation: 
Player 1:
From 2022-01-17 to 2022-01-25, player 1 won 3 consecutive matches.
On 2022-01-31, player 1 had a draw.
On 2022-02-08, player 1 won a match.
The longest winning streak was 3 matches.

Player 2:
From 2022-02-06 to 2022-02-08, player 2 lost 2 consecutive matches.
The longest winning streak was 0 matches.

Player 3:
On 2022-03-30, player 3 won a match.
The longest winning streak was 1 match.
*/

WITH match_row_num AS (
    SELECT player_id, match_day, result,
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_day) AS seq
    FROM matches),
    
win_row_num AS (
    SELECT player_id,
           seq - ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY match_day) AS group_id
    FROM match_row_num
    WHERE result = 'Win'
),
winning_streak AS (
    SELECT player_id, group_id, COUNT(*) as cnt
    FROM win_row_num
    GROUP BY 1, 2
    ORDER BY NULL
)

SELECT a.player_id, IFNULL(MAX(b.cnt), 0) as longest_streak
FROM (SELECT DISTINCT player_id FROM matches) a
     LEFT JOIN
     winning_streak b
     ON a.player_id = b.player_id
GROUP BY 1
ORDER BY NULL;


