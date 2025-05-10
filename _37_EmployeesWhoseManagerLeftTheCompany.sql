
-- LeetCode - 1978

-- Employees Whose Manager Left the Company
/*
    Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. 
    When a manager leaves the company, their information is deleted from the Employees table, but the reports still 
    have their manager_id set to the manager that left.

    Return the result table ordered by employee_id.
*/

create table employees6(
    employee_id int primary key,
    name varchar(100),
    manager_id int,
    salary int
);

insert into employees6(employee_id, name, manager_id, salary)
values
    (3, 'Mila', 9, 60301),
    (12, 'Antonella', null, 31000),
    (13, 'Emery', null, 67084),
    (1, 'Kalel', 11, 21241),
    (9, 'Mikaela', null, 50937),
    (11, 'Joziah', 6, 28485);

-- Solution:

select 
    employee_id
from employees6
where salary < 30000 and  manager_id not in (
    select 
        employee_id
    from employees6
)
order by employee_id;