
-- LeetCode - 570

-- Managers with at Least 5 Direct Reports
/*
    Write a solution to find managers with at least five direct reports.
*/


create table employee2(
    id int primary key,
    name varchar(100),
    department varchar(100),
    manager_id int
);

insert into employee2(id, name, department, manager_id) 
values
    (101, 'John', 'A', null),
    (102, 'Dan', 'A', 101),
    (103, 'James', 'A', 101),
    (104, 'Amy', 'A', 101),
    (105, 'Anne', 'A', 101),
    (106, 'Ron', 'B', 101);


-- Solution 

select e2.name 
from employee2 e1
inner join employee2 e2
on e1.manager_id = e2.id
group by e2.id
having count(e1.id) >= 5;




