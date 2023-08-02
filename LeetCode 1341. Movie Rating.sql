

-- Write an SQL query to:

-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

/*
Movies table:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+
Users table:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+
MovieRating table:
+-------------+--------------+--------------+-------------+
| movie_id    | user_id      | rating       | created_at  |
+-------------+--------------+--------------+-------------+
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  | 
| 2           | 2            | 2            | 2020-02-01  | 
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  | 
| 3           | 2            | 4            | 2020-02-25  | 
+-------------+--------------+--------------+-------------+  */







with view as (
    select M.user_id,M.created_at,M.movie_id,M.rating,U.name
    from MovieRating M
    left join users U
    on M.user_id=U.user_id
),

rating as (
select name as results
from view 
group by name
order by count(rating) desc,name asc
limit 1
),


movie as (
select M.title as results
from MOVIES M
join view V
on V.movie_id = M.movie_id
where DATE_FORMAT(created_at,"%b")="Feb"
and YEAR(created_at) = 2020
group by M.title
order by avg(V.rating) desc, M.title asc
limit 1
)

select results from rating
union all
select results from movie 
