
-- LeetCode - 180

-- Consecutive Numbers
/*
    Find all numbers that appear at least three times consecutively.
*/

create table logs(
    id int primary key auto_increment,
    num int
);

insert into logs(num) 
values 
    ( 1),
    ( 1),
    ( 1),
    ( 2),
    ( 1),
    ( 2),
    ( 2);

-- Solution:

select l1.num as  ConsecutiveNums
from logs l1, logs l2, logs l3
where 
    l1.id = l2.id - 1 and
    l2.id = l3.id - 1 and
    l1.num = l2.num and
    l2.num = l3.num;