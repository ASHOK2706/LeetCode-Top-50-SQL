
-- LeetCode - 1193

-- Monthly Transactions I
/*
    Write an SQL query to find for each month and country, the number of transactions and their total amount, the number 
    of approved transactions and their total amount.
*/

create table transactions1(
    id int primary key,
    country varchar(100),
    state enum('approved', 'declined'),
    amount int,
    trans_date date
);

insert into transactions1(id, country, state, amount, trans_date)
values
    (121, 'US', 'approved', 1000, '2018-12-18'),
    (122, 'US', 'declined', 2000, '2018-12-19'),
    (123, 'US', 'approved', 2000, '2019-01-01'),
    (124, 'DE', 'approved', 2000, '2019-01-07');

-- Solution :

select 
    date_format(trans_date, "%Y-%m") as month, 
    country, 
    count(amount) as trans_count, 
    sum(case when state='approved' then 1 else 0 end) as approved_count,
    sum(amount) as trans_total_amount,
    sum(case when state='approved' then amount else 0 end) as approved_total_amount
from transactions1
group by month, country;

