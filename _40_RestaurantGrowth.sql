
-- LeetCode - 1321

--  Restaurant Growth
/*
    You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
    Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). 
    average_amount should be rounded to two decimal places.
    Return the result table ordered by visited_on in ascending order.
*/

create table customers1(
    customer_id int, 
    name varchar(100),
    visited_on date,
    amount int,
    primary key (customer_id, visited_on)
);

insert into customers1(customer_id, name, visited_on, amount)
values
    (1, 'Jhon'  , '2019-01-01', 100),
    (2, 'Daniel' , '2019-01-02', 110),
    (3, 'Jade'   , '2019-01-03', 120),
    (4, 'Khaled' , '2019-01-04', 130),
    (5, 'Winston', '2019-01-05', 110),
    (6, 'Elvis'  , '2019-01-06', 140),
    (7, 'Anna'   , '2019-01-07', 150),
    (8, 'Maria'  , '2019-01-08', 80 ),
    (9, 'Jaze'   , '2019-01-09', 110),
    (1, 'Jhon'   , '2019-01-10', 130),
    (3, 'Jade'   , '2019-01-10', 150);


-- Solution:

select visited_on,
    (
        select sum(amount) 
        from  customers1 
        where visited_on between date_sub(c.visited_on, interval 6 day) and c.visited_on
    ) as amount,
    (
        select round(sum(amount) / 7, 2)
        from  customers1 
        where visited_on between date_sub(c.visited_on, interval 6 day) and c.visited_on
    )as average_amount
from customers1 c
where visited_on >= (
    select date_add(min(visited_on), interval 6 day)
    from customers1
)
group by visited_on
order by visited_on;
