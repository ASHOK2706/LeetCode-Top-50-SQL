
-- LeetCode - 1174

-- Immediate Food Delivery II
/*
    If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

    The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

    Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
*/

create table delivery(
    delivery_id int primary key,
    customer_id int,
    order_date date,
    customer_pref_delivery_date date
);

insert into delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
values 
    (1, 1, '2019-08-01', '2019-08-02'),
    (2, 2, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-12'),
    (4, 3, '2019-08-24', '2019-08-24'),
    (5, 3, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13'),
    (7, 4, '2019-08-09', '2019-08-09');

-- Solution :

with first_order as (
    select
        case 
            when order_date = customer_pref_delivery_date then 'immediate'
            else 'scheduled'
        end as status,
        row_number() over(partition by customer_id order by order_date) as delivery_rank
    from delivery
)
select 
    round((sum(case when status='immediate' then 1 else 0 end) / count(status) ) * 100, 2) as immediate_percentage
from first_order 
where delivery_rank = 1;

