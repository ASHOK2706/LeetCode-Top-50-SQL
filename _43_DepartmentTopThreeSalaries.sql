
-- LeetCode - 185. Department Top Three Salaries

/*
    A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
    Write a solution to find the employees who are high earners in each of the departments.
*/

create table employees7(
    id int primary key,
    name varchar(100),
    salary int,
    department_id int,  
    foreign key (department_id) references department(id)
);

create table department(
    id int, 
    name  varchar(100)
);

insert into employees7(id, name, salary, department_id)
values
    (1, 'Joe', 85000, 1),
    (2, 'Henry', 80000, 2),
    (3, 'Sam', 60000, 2),
    (4, 'Max', 90000, 1),
    (5, 'Janet', 69000, 1),
    (6, 'Randy', 85000, 1),
    (7, 'Will', 70000, 1);

insert into department(id, name)
values
    (1, 'IT'),
    (2, 'Sales');

-- Solution:


select Department, Employee, Salary
from (
    select 
        d.name as Department,
        e.name as Employee,
        e.salary as Salary,
        dense_rank() over(partition by department_id order by salary desc) as top_salaries_by_dept
    from employees7 e
    join department d
    on e.department_id = d.id
) as top_salaries
where top_salaries_by_dept <= 3;
