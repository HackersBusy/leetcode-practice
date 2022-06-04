select seller_id
from
(
    select seller_id, sum(price) as total_sales, dense_rank() over (order by sum(price) desc) as dense_rnk
    from Sales a
    group by seller_id
) z
where dense_rnk = 1;
