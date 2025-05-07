
--  LeetCode - 1045

-- Customers Who Bought All Products
/*
    Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
*/

create table customer(
    customer_id int not null,
    product_key int,
    foreign key (product_key) references product2(product_key)
);

create table product2(
    product_key int primary key
);

insert into customer(customer_id, product_key)
values 
    (1, 5),
    (2, 6),
    (3, 5),
    (3, 6),
    (1, 6);

insert into product2(product_key)
values 
    (5), (6);


-- Solution :

select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select count(*) from product2);



