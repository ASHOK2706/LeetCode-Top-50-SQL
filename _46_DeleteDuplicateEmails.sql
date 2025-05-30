
-- LeetCode - 196. Delete Duplicate Emails

/*
    Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

    For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

    For Pandas users, please note that you are supposed to modify Person in place.

    After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code 
    and then show the Person table. The final order of the Person table does not matter.
*/

create table person(
    id int primary key, 
    email varchar(100)
);

insert into person(id, email)
values
    (1, 'john@example.com'),
    (2, 'bob@example.com' ),
    (3, 'john@example.com');

-- Solution:

delete p1
from person p1 
join person p2 
on p1.email = p2.email
and p1.id > p2.id;