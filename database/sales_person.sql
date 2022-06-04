# Write your MySQL query statement below
select name
from SalesPerson
where name not in
(
    select c.name
    from Orders a
    left join Company b
    on a.com_id = b.com_id
    left join SalesPerson c
    on a.sales_id = c.sales_id
    where b.name = 'RED'
    group by c.name
);
