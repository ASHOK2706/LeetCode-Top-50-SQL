
-- LeetCode - 1667. Fix Names in a Table

/*
    Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
    Return the result table ordered by user_id.
*/

create table users2(
    user_id int primary key,
    name varchar(100)
);

insert into users2(user_id, name)
values 
    (1, 'aLice'),
    (2, 'bOB');

-- Solution:

select user_id, concat(upper(substring(name, 1, 1)), lower(substring(name, 2))) as name 
from users2
order by user_id;