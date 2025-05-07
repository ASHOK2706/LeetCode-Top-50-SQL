
-- LeetCode - 1731

-- The Number of Employees Which Report to Each Employee
/*
    For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
    Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
    Return the result table ordered by employee_id.

*/

create table employees4(
    employee_id int primary key, 
    name varchar(100),
    reports_to int, 
    age int
);

insert into employees4(employee_id, name, reports_to, age)
values
    (1, 'Michael', null, 45),
    (2, 'Alice'  , 1   , 38),
    (3, 'Bob'    , 1   , 42),
    (4, 'Charlie', 2   , 34),
    (5, 'David'  , 2   , 40),
    (6, 'Eve'    , 3   , 37),
    (7, 'Frank'  , null, 50),
    (8, 'Grace'  , null, 48);

-- Solution:
with managers as (
    select 
        distinct reports_to as manager_id,
        count(reports_to) as count,
        round(sum(age) / count(reports_to)) as average_age
    from employees4
    where reports_to is not null
    group by reports_to
)
select 
    e.employee_id, 
    e.name, 
    m.count as reports_count, 
    m.average_age
from employees4 e
inner join managers m
on e.employee_id = m.manager_id
order by e.employee_id;



select 
    e1.reports_to as employee_id,
    e2.name, 
    count(e2.employee_id) as reports_count,
    round(avg(e1.age)) as average_age
from employees4 e1
inner join employees4 e2
on e1.reports_to = e2.employee_id
group by e1.reports_to
order by employee_id;

