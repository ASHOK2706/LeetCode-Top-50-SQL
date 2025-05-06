
-- LeetCode - 1070

-- Product Sales Analysis III
/*
    Write a solution to select the product id, year, quantity, and price for the first year of every product sold. 
    If any product is bought multiple times in its first year, return all sales separately.
*/

create table sales1(
    sales_id int,
    product_id int,
    year int,
    quantity int,
    price int, 
    primary key (sales_id, year),
    foreign key (product_id) references product1(product_id)
);


create table product1(
    product_id int primary key,
    product_name varchar(100)
);

insert into sales1(sales_id, product_id, year, quantity, price)
values 
    (1, 100 , 2008, 10, 5000),
    (2, 100 , 2009, 12, 5000),
    (7, 200 , 2011, 15, 9000);

insert into product1(product_id, product_name) 
values 
    (100, 'Nokia'  ),
    (200, 'Apple'  ),
    (300, 'Samsung');

-- Solutions:

select 
    product_id, 
    year as first_year,
    quantity, 
    price 
from sales1
where (product_id, year) in (select product_id, min(year) from sales1 group by product_id);



