


select D.dept_name,count(S.student_id) as student_number
from department1 D
left join student1 S
on D.dept_id = S.dept_id
group by 1
order by student_number desc,D.dept_name asc
