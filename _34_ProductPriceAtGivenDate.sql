
-- LeetCode - 1164

-- Product Price at a Given Date
/*
    Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
*/

create table products1(
    product_id int, 
    new_price int, 
    change_date Date,
    primary key (product_id, change_date)
);

insert into products1(product_id, new_price, change_date)
values
    (1, 20, '2019-08-14'),
    (2, 50,' 2019-08-14'),
    (1, 30, '2019-08-15'),
    (1, 35, '2019-08-16'),
    (2, 65, '2019-08-17'),
    (3, 20, '2019-08-18');


-- Solution


select product_id, new_price as price
from products1
where (product_id, change_date) in
    (
        select product_id, max(change_date)
        from products1
        where change_date <= '2019-08-16'
        group by product_id
    )
union
select product_id, 10 as price
from products1
where product_id not in
    (
        select product_id
        from products1
        where change_date <= '2019-08-16'
        group by product_id
    );