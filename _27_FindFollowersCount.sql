
-- LeetCode - 1729

-- Find Followers Count
/*
    Write a solution that will, for each user, return the number of followers.
    Return the result table ordered by user_id in ascending order.
*/

create table followers(
    user_id int,
    follower_id int,
    primary key (user_id, follower_id)
);

insert into followers(user_id, follower_id)
values 
    (0, 1),
    (1, 0),
    (2, 0),
    (2, 1);

-- Solution:

select user_id, count(follower_id)
from followers
group by user_id
order by user_id;
