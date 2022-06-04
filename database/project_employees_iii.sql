# Write your MySQL query statement below
with cte as
(
    select a.project_id, max(b.experience_years) as max_exp_years
    from Project a
    left join Employee b
    on a.employee_id = b.employee_id
    group by a.project_id
)

select a.project_id, b.employee_id
from Project a
left join Employee b
on a.employee_id = b.employee_id
where (a.project_id, b.experience_years) in (
    select distinct project_id, max_exp_years
    from cte
)
