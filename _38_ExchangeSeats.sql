
-- LeetCode - 626

-- Exchange Seats
/*
    Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the 
    last student is not swapped.

    Return the result table ordered by id in ascending order.
*/

create table seat(
    id int primary key auto_increment,
    student varchar(100)
);

insert into seat(student)
values
    ('Abbot'),
    ('Doris'),
    ('Emerson'),
    ('Green'),
    ('Jeames' );

-- Solution:

select 
    case 
        when id = (select max(id) from seat)and id % 2 = 1 then id
        when id % 2 = 1 then id + 1 
        else id - 1 
    end as id, 
    student
from seat
order by id;
