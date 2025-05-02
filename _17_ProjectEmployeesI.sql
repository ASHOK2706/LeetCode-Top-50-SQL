
-- LeetCode - 1075

-- Project Employees I
/*
    Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
*/

create table project(
    project_id int,
    employee_id int,
    primary key (project_id, employee_id),
    foreign key (employee_id) references employee3(employee_id)
);

create table employee3(
    employee_id int primary key,
    name varchar(100),
    experience_years int not null
);

insert into project(project_id, employee_id)
values 
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);

insert into employee3(employee_id, name, experience_years) 
values 
    (1, 'Khaled', 3),
    (2, 'Ali'   , 2),
    (3, 'John'  , 1),
    (4, 'Doe'   , 2);


-- Solution :

select p.project_id, round(sum(e.experience_years) / count(p.employee_id), 2) as average_years
from project p
left join employee3 e
on p.employee_id = e.employee_id
group by p.project_id;