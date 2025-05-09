
-- LeetCode - 1907

-- Count Salary Categories
/*
    Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

    "Low Salary": All the salaries strictly less than $20000.
    "Average Salary": All the salaries in the inclusive range [$20000, $50000].
    "High Salary": All the salaries strictly greater than $50000.
    The result table must contain all three categories. If there are no accounts in a category, return 0.
*/

create table accounts(
    account_id int primary key, 
    income int
);

insert into accounts(account_id, income)
values
    (3, 108939),
    (2, 12747 ),
    (8, 87709 ),
    (6, 91796 );

-- Solution:

select 
    'Low Salary' as category,
    sum(if(income < 20000, 1, 0)) as accounts_count
from accounts

union

select 
    'Average Salary' as category,
    sum(if(income >= 20000 and income <= 50000, 1, 0)) as accounts_count
from accounts

union 

select 
    'High Salary' as category,
    sum(if(income > 50000, 1, 0)) as accounts_count
from accounts;







 
