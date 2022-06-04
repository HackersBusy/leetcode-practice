# Write your MySQL query statement below
select project_id
from
(
    select project_id, dense_rank() over(order by count_employees desc) as dns_rnk
    from
    (
        select a.project_id, count(b.name) as count_employees
        from Project a
        left join Employee b
        on a.employee_id = b.employee_id
        group by a.project_id
        order by count_employees desc
    ) z
) u
where dns_rnk = 1;