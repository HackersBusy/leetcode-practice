select nearest_distance as shortest
from
(
    select *
    , coalesce(lead_values, lag_values) as next_point
    , abs(x - coalesce(lead_values, lag_values)) as nearest_distance
    from
        (
        select x
        , lag(x) over (order by x) as lag_values
        , lead(x) over (order by x) as lead_values
        from Point
        ) z
    ) y
order by nearest_distance
limit 1;
