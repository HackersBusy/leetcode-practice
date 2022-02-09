select player_id, event_date as first_login
from
(
    select player_id, event_date
    ,row_number() over (partition by player_id order by event_date) as rw_nm
    from Activity
) a
where rw_nm = 1
group by 1,2;
