# Write your MySQL query statement below
select book_id, name
from Books
where available_from not between date_add(str_to_date('2019-06-23','%Y-%m-%d'), interval -1 month) and (str_to_date('2019-06-23','%Y-%m-%d'))
and book_id not in
(
    select a.book_id
    from Books a
    left join Orders b
    on a.book_id = b.book_id
    where b.dispatch_date between date_add(str_to_date('2019-06-23','%Y-%m-%d'), interval -1 year) and (str_to_date('2019-06-23','%Y-%m-%d'))
    group by a.book_id
    having sum(b.quantity) >= 10
);

-- date transformations

-- get one year from given date
select date_add(str_to_date('2019-06-23','%Y-%m-%d'), interval -1 year)

-- gets year
select year(str_to_date('2019-06-23','%Y-%m-%d'))
