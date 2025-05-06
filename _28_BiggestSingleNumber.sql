
-- LeetCode 619

-- Biggest Single Number
/*
    A single number is a number that appeared only once in the MyNumbers table.
    Find the largest single number. If there is no single number), (report null.
*/

create table my_numbers(
    num int
);

insert into my_numbers(num)
values (8), (8), (3), (3), (1), (4), (5), (6);

-- Solution :

select 
    max(num) as num
from  (
    select num , count(num) as count
    from my_numbers
    group by num
) as single_number
where count = 1;