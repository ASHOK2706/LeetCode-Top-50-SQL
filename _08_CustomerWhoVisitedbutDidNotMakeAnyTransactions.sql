
-- LeetCode - 1581

-- Customer Who Visited but Did Not Make Any Transactions
/*
    Write a solution to find the IDs of the users who visited without making any transactions and the number of 
    times they made these types of visits.
*/

create table visits(
    visit_id int primary key,
    customer_id int
);


create table transactions(
    transaction_id int primary key,
    visit_id int,
    amount int,
    foreign key (visit_id) references visits(visit_id)
);

insert into visits(visit_id, customer_id)
values 
    (1, 23),
    (2, 9),
    (4, 30),
    (5, 54),
    (6, 96),
    (7, 54),
    (8, 54);

insert into transactions(transaction_id, visit_id, amount)
values
    (2, 5, 310),
    (3, 5, 300),
    (9, 5, 200),
    (12, 1, 910),
    (13, 2, 970);


-- Solution :

select customer_id, count(v.visit_id) as count_no_trans
from visits v
left join transactions t
on v.visit_id = t.visit_id
where t.visit_id is null
group by v.customer_id;
