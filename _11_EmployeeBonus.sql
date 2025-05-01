
-- LeetCode - 577

-- Employee Bonus
/*
    Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
*/

create table employee1(
    emp_id int primary key,
    name varchar(100),
    supervisor int,
    salary int
);

create table bonus(
    emp_id int primary key, 
    bonus int,
    foreign key (emp_id) references employee1(emp_id)
);

insert into employee1(emp_id, name, supervisor, salary)
values 
    (3, 'Brad', null, 4000),
    (1, 'John', 3, 1000),
    (2, 'Dan' , 3, 2000),
    (4, 'Thomas', 3, 4000);

insert into bonus(emp_id, bonus)
values
    (2, 500),
    (4, 2000);


-- Solution :


select e.name, b.bonus
from employee1 e
left join bonus b
on e.emp_id = b.emp_id
where b.bonus < 1000 or b.bonus is null;
