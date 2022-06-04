# Write your MySQL query statement below
with cte as
    (
    select a.buyer_id, b.product_name
    from Sales a
    left join Product b
    on a.product_id = b.product_id
    )

select distinct buyer_id
from cte
where product_name = 'S8'
and
    buyer_id not in (
    select buyer_id
    from cte
    where product_name = 'iPhone'
    );
