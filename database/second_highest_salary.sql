/* MySQL */
select max(salary) as SecondHighestSalary
from
(
    select salary
         ,rank() over (
         order by salary desc
         ) as row_num
    from Employee
    ) a
where row_num = 2
