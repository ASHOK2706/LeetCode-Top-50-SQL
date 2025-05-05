
-- LeetCode - 2356

-- Number of Unique Subjects Taught by Each Teacher
/*
    Write a solution to calculate the number of unique subjects each teacher teaches in the university
*/

create table teacher(
    teacher_id int, 
    subject_id int, 
    dept_id int,
    primary key (subject_id, dept_id)
);

insert into teacher(teacher_id, subject_id, dept_id)
values
    (1, 2, 3),
    (1, 2, 4),
    (1, 3, 3),
    (2, 1, 1),
    (2, 2, 1),
    (2, 3, 1),
    (2, 4, 1);  

-- Solution :

select 
    teacher_id, 
    count(distinct subject_id) as cnt
from teacher
group by teacher_id;
