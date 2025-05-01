
-- LeetCode - 934

-- Confirmation Rate
/*
    The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested 
    confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. 
    Round the confirmation rate to two decimal places.

    Write a solution to find the confirmation rate of each user.
*/


create table signups(
    user_id int primary key,
    time_stamp datetime
);

create table confirmations(
    user_id int,
    time_stamp datetime,
    action enum('confirmed', 'timeout'),
    primary key (user_id, time_stamp),
    foreign key (user_id) references signups(user_id)
);

insert into signups(user_id, time_stamp)
values 
    (3, '2020-03-21 10:16:13'),
    (7, '2020-01-04 13:57:59'),
    (2, '2020-07-29 23:09:44'),
    (6, '2020-12-09 10:39:37');

insert into confirmations(user_id, time_stamp, action)
values
    (3, '2021-01-06 03:30:46', 'timeout'),
    (3, '2021-07-14 14:00:00', 'timeout'),
    (7, '2021-06-12 11:57:29', 'confirmed'),
    (7, '2021-06-13 12:58:28', 'confirmed'),
    (7, '2021-06-14 13:59:27', 'confirmed'),
    (2, '2021-01-22 00:00:00', 'confirmed'),
    (2, '2021-02-28 23:59:59', 'timeout');


-- Solution :
 

with confirmation_count as (
    select s.user_id, count(c.user_id) as total_no_request, 
    sum(
            case 
                when c.action = 'confirmed' then 1 
                else 0
            end
        ) as confirmed_requests
    from signups s
    left join confirmations c
    on s.user_id = c.user_id
    group by s.user_id
)
select user_id, ifnull( round( confirmed_requests / total_no_request, 2), 0) as confirmation_rate
from confirmation_count;