
-- LeetCode - 1068

-- Product Sales Analysis I
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

create table sales(
    sale_id int,
    product_id int,
    year int,
    quantity int,
    price int,
    primary key (sale_id, year),
    foreign key (product_id) references product(product_id)
);

create table product(
    product_id int primary key,
    product_name varchar(100)
);


insert into sales(sale_id, product_id, year, quantity, price)
values 
    (1, 100, 2008, 10, 5000),
    (2, 100, 2009, 12, 5000),
    (7, 200, 2011, 15, 9000);


insert into product(product_id, product_name)
values
    (100, 'Nokia'),
    (200, 'Apple'),
    (300, 'Samsung');



-- Solution :


select p.product_name, s.year, s.price 
from sales s
join product p
on s.product_id = p.product_id;
