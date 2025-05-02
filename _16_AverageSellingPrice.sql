
-- LeetCode - 1251

-- Average Selling Price
/*
    Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. 
    If a product does not have any sold units, its average selling price is assumed to be 0.
*/


create table prices(
    product_id int,
    start_date date, 
    end_date date,
    price int,
    primary key (product_id, start_date, end_date)
);

create table units_sold(
    product_id int,
    purchase_date date,
    units int
);

insert into prices(product_id, start_date, end_date, price)
values 
    (1, '2019-02-17', '2019-02-28', 5),
    (1, '2019-03-01', '2019-03-22', 20),
    (2, '2019-02-01', '2019-02-20', 15),
    (2, '2019-02-21', '2019-03-31', 30);

insert into units_sold(product_id, purchase_date, units) 
values
    (1, '2019-02-25', 100),
    (1, '2019-03-01', 15 ),
    (2, '2019-02-10', 200),
    (2, '2019-03-22', 30 );

-- Solution :

with sold_summary as (
    select p.product_id, p.price, u.units
    from prices p
    left join units_sold u
    on p.product_id = u.product_id and u.purchase_date between p.start_date and p.end_date
)
select product_id, ifnull(round (sum( price * units) / sum(units), 2), 0) as average_price 
from sold_summary 
group by  product_id;