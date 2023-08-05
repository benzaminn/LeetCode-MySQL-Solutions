
/*
Get the highest answer rate question from a table survey_log with these columns:uid, action, question_id, answer_id, q_num, timestamp.
uid means user id; action has these kind of values: "show", "answer", "skip"; answer_id is not null when action column is "answer", while is null for "show" and "skip"; q_num is the numeral order of the question in current session.
Write a sql query to identify the question which has the highest answer rate.
Example:
Input:

+------+-----------+--------------+------------+-----------+------------+
| uid  | action    | question_id  | answer_id  | q_num     | timestamp  |
+------+-----------+--------------+------------+-----------+------------+
| 5    | show      | 285          | null       | 1         | 123        |
| 5    | answer    | 285          | 124124     | 1         | 124        |
| 5    | show      | 369          | null       | 2         | 125        |
| 5    | skip      | 369          | null       | 2         | 126        |
+------+-----------+--------------+------------+-----------+------------+

Output:

+-------------+
| survey_log  |
+-------------+
|    285      |
+-------------+

Explanation:

question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.  */


select question_id as survey_log from (
	select question_id,sum(if(action='show',1,0)) as show_num,
    sum(if(action='answer',1,0)) as answer_num
	from survey_log
	group by 1
	
) X
order by IFNULL((answer_num/show_num),1) desc
limit 1


/*

SELECT question_id as survey_log
FROM survey_log
GROUP BY question_id
ORDER BY avg(case when action = 'answer' then 1 else 0 end) desc
LIMIT 1; */


