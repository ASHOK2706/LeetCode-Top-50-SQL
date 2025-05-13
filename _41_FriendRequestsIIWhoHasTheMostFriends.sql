
-- LeetCode - 602. Friend Requests II: Who Has the Most Friends

/*
    Write a solution to find the people who have the most friends and the most friends number.
    The test cases are generated so that only one person has the most friends.
*/

create table request_accepted(
    requester_id int,
    accepter_id int,
    accept_date date,
    primary key (requester_id, accepter_id)
);

insert into request_accepted(requester_id, accepter_id, accept_date)
values
    (1, 2, '2016/06/03'),
    (1, 3, '2016/06/08'),
    (2, 3, '2016/06/08'),
    (3, 4, '2016/06/09');


-- Solution:

select 
    requester_id as id,
    count(accepter_id) as num
from (
    select requester_id, accepter_id
    from request_accepted
    union all 
    select accepter_id, requester_id
    from request_accepted
) as friends
group by id
order by num desc
limit 1;

