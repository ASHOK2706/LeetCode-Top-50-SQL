

-- LeetCode - 1757

-- Recyclable and Low Fat Products
-- Write a solution to find the ids of products that are both low fat and recyclable.

create table products (
    product_id int primary key,
    low_fats enum('Y', 'N'),
    recyclable enum('Y', 'N')
);

insert into products(product_id, low_fats, recyclable) 
values
    (0, 'Y', 'N'),
    (1, 'Y', 'Y'),
    (2, 'N', 'Y'),
    (3, 'Y', 'Y'),
    (4, 'Y', 'N');

-- Solution :

select product_id from products where low_fats = 'Y' and recyclable = 'Y';



