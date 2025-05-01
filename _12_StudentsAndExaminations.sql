
-- LeetCode - 1280

-- Students and Examinations
/*
    Write a solution to find the number of times each student attended each exam.
    Return the result table ordered by student_id and subject_name.
*/

create table students(
    student_id int primary key,
    student_name varchar(100)
);

create table subjects(
    subject_name varchar(100) primary key
);

create table examinations(
    student_id int,
    subject_name varchar(100)
);

insert into students(student_id, student_name)
values 
    (1 , 'Alice'),
    (2 , 'Bob'  ),
    (13, 'John' ),
    (6 , 'Alex' );

insert into subjects(subject_name)
values 
    ('Maths'),
    ('Physics'),
    ('Programming');

insert into examinations(student_id, subject_name)
values
    (1, 'Maths'),
    (1, 'Physics'),
    (1, 'Programming'),
    (2, 'Programming'),
    (1, 'Physics'),
    (1, 'Maths'),
    (13, 'Maths'),
    (13, 'Programming'),
    (13, 'Physics'),
    (2, 'Maths'),
    (1, 'Maths');


-- Solution :
 
select s.student_id, s.student_name, sub.subject_name, count(e.subject_name) as attended_exams
from students s
cross join  subjects sub
left join examinations e
on s.student_id = e.student_id and sub.subject_name = e.subject_name
group by s.student_id, s.student_name, sub.subject_name
order by s.student_id, sub.subject_name;
