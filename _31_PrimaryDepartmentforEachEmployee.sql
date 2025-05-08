
-- LeetCode - 1789

--Primary Department for Each Employee
/*
    Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department 
    is their primary department. 'N'ote that when an employee belongs to only one department, their primary column is ''N''.

    Write a solution to report all the employees with their primary department. For employees who belong to one department, 
    report their only department.
*/

create table employee5(
    employee_id int,
    department_id int,
    primary_flag enum(''Y'', ''N''), 
    primary key (employee_id, department_id)
);

insert into employee5(employee_id, department_id, primary_flag)
values
    (1, 1, 'N'),
    (2, 1, 'Y'),
    (2, 2, 'N'),
    (3, 3, 'N'),
    (4, 2, 'N'),
    (4, 3, 'Y'),
    (4, 4, 'N');

-- Solution:

SET SESSION sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));



select employee_id, department_id
from employee5
where primary_flag = 'Y'
group by employee_id
union
select employee_id, department_id
from employee5
group by employee_id
having count(*) = 1;

