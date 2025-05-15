
-- LeetCode - 1484. Group Sold Products By The Date
/*
    Write a solution to find for each date the number of different products sold and their names.

    The sold products names for each date should be sorted lexicographically.

    Return the result table ordered by sell_date.
*/

create table activities(
    sell_date date,
    product varchar(100)
);

insert into activities(sell_date, product)
values
    ('2020-05-30', 'Headphone'),
    ('2020-06-01', 'Pencil'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'Basketball'),
    ('2020-06-01', 'Bible'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'T-Shirt');


-- Solution:

select 
    sell_date,
    count(distinct product) as num_sold,
    group_concat(distinct product order by product separator ', ') as products
from activities
group by sell_date
order by sell_date;


