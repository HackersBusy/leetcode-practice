-- 1st solution
select player_id, device_id
from (
    select player_id
         ,device_id
         ,row_number() over (
             partition by player_id
             order by event_date
             ) as rw_nm
      from Activity
    ) a
where rw_nm = 1;


-- 2nd solution
select player_id, device_id
from Activity
where (player_id, event_date) in
(
    select player_id, min(event_date) as first_login
    from Activity
    group by player_id
);

-- 3rd solution
select z.player_id, y.device_id
from
(
    select a.player_id, min(a.event_date) as first_login
    from Activity a
    group by a.player_id
) z
join Activity y
on z.player_id = y.player_id and z.first_login = y.event_date;
