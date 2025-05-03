
-- LeetCode - 1633

-- Percentage of Users Attended a Contest
/*
    Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
    Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
*/

create table users(
    user_id int primary key,
    user_name varchar(100)
);
 
create table register(
    contest_id int,
    user_id int,
    primary key (contest_id, user_id)
);

insert into users(user_id, user_name) 
values
    (6, 'Alice'),
    (2, 'Bob'  ),
    (7, 'Alex' );

insert into register(contest_id, user_id)
values
    (215, 6),
    (209, 2),
    (208, 2),
    (210, 6),
    (208, 6),
    (209, 7),
    (209, 6),
    (215, 7),
    (208, 7),
    (210, 2),
    (207, 2),
    (210, 7);


select contest_id, round(count(user_id) / (select count(user_id) from users) * 100, 2) as percentage
from register
group by contest_id
order by percentage desc, contest_id asc;
