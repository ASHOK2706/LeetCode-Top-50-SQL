
-- leetCode - 1327. List the Products Ordered in a Period
/*
    Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
*/

create table products3(
    product_id int primary key,
    product_name varchar(100),
    product_category varchar(100)
);

create table orders(
    product_id int,
    order_date date,
    unit int,
    foreign key (product_id) references products3(product_id)
);

insert into products3(product_id, product_name, product_category)
values
    (1, 'Leetcode Solutions', 'Book'),
    (2, 'Jewels of Stringology', 'Book'),
    (3, 'HP', 'Laptop'),
    (4, 'Lenovo', 'Laptop'),
    (5, 'Leetcode Kit', 'T-shirt');

insert into orders(product_id, order_date, unit)
values
    (1, '2020-02-05', 60),
    (1, '2020-02-10', 70),
    (2, '2020-01-18', 30),
    (2, '2020-02-11', 80),
    (3, '2020-02-17', 2 ),
    (3, '2020-02-24', 3 ),
    (4, '2020-03-01', 20),
    (4, '2020-03-04', 30),
    (4, '2020-03-04', 60),
    (5, '2020-02-25', 50),
    (5, '2020-02-27', 50),
    (5, '2020-03-01', 50);


-- Solution:

select p.product_name, sum(o.unit) as unit
from products3 p
join orders o
on p.product_id = o.product_id
where date_format(o.order_date, '%Y-%m') = '2020-02'
group by p.product_name
having unit >= 100;


