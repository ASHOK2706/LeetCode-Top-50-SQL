
-- LeetCode - 584

-- Find Customer Referee
-- Find the names of the customer that are not referred by the customer with id = 2.



create table customers(
    id int primary key,
    name varchar(100),
    referee_id int
);

insert into customers(id, name, referee_id)
values 
    (1, 'will', null),
    (2, 'jane', null),
    (3, 'Alex', 2),
    (4, 'Bill', null),
    (5, 'Zack', 1),
    (6, 'Mark', 2);


-- Solution :

select name from customers where referee_id != 2 or referee_id is null;


