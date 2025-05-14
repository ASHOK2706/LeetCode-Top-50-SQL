
-- LeetCode - 176. Second Highest Salary
/*
    Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, 
    return nul
*/

create table employee6(
    id int primary key,
    salary int 
);

insert into employee6(id, salary)
values
    (1, 100),
    (2, 200),
    (3, 300);

-- Solution:

select max(salary) as SecondHighestSalary 
from employee6 
where salary != (select max(salary) from employee6);