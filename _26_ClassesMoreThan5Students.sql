
-- LeetCode - 96

-- Classes More Than 5 Students
/*
    Write a solution to find all the classes that have at least five students.
*/

create table courses(
    student varchar(100),
    class varchar(100),
    primary key (student, class)
);

insert into courses(student, class) 
values 
    ('A', 'Math'),
    ('B', 'English'),
    ('C', 'Math'),
    ('D', 'Biology'),
    ('E', 'Math'),
    ('F', 'Computer'),
    ('G', 'Math'),
    ('H', 'Math'),
    ('I', 'Math');

-- Solution:

select class
from courses
group by class
having count(student) >= 5;