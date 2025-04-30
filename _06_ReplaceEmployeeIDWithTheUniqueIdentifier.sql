
-- LeetCode - 1378

-- Replace Employee ID With The Unique Identifier
-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.


create table employees(
    id int primary key,
    name varchar(100)
);

insert into employees(id, name) 
values
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');


create table employee_uni(
    id int,
    unique_id int,
    primary key (id, unique_id)
);

insert into employee_uni(id, unique_id) 
values 
    (3, 1),
    (11, 2),
    (90, 3);

-- Solution :

select eu.unique_id, e.name from employees e
left join employee_uni eu
on e.id = eu. id;