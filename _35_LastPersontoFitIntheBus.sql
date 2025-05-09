
-- LeetCode - 1204

-- Last Person to Fit in the Bus
/*
    There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be 
    some people who cannot board.
    Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. 
    The test cases are generated such that the first person does not exceed the weight limit.
    Note that only one person can board the bus at any given turn.
*/

create table queue(
    persion_id int primary key,
    person_name varchar(100),
    weight int, 
    turn int
);

insert into queue(persion_id, person_name, weight, turn)
values 
    (5, 'Alice', 250, 1),
    (4, 'Bob', 175, 5),
    (3, 'Alex', 350, 2),
    (6, 'John Cena', 400, 3),
    (1, 'Winston', 500, 6),
    (2, 'Marie', 200, 4);

-- Solution:

with persion_info as(
    select 
        person_name, 
        sum(weight) over (order by turn) as running_weight
    from queue
)
select person_name
from persion_info 
where running_weight <= 1000
order by running_weight desc
limit 1;

