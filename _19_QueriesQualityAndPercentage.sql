
-- LeetCode - 1211

-- Queries Quality and Percentage
/*
    We define query quality as:
        The average of the ratio between query rating and its position.

    We also define poor query percentage as:
        The percentage of all queries with rating less than 3.

    Write a solution to find each query_name, the quality and poor_query_percentage.
    Both quality and poor_query_percentage should be rounded to 2 decimal places.
*/

create table queries(
    query_name varchar(100), 
    result varchar(100),
    position int,
    rating int
);

insert into queries(query_name, result, posistion, rating) 
values 
    ('Dog', 'Golden Retriever', 1, 5),
    ('Dog', 'German Shepherd', 2, 5),
    ('Dog', 'Mule', 200, 1),
    ('Cat', 'Shirazi', 5, 2),
    ('Cat', 'Siamese', 3, 3),
    ('Cat', 'Sphynx', 7, 4);

-- Solution :
 
select 
    query_name, 
    round(sum(rating / position) / count(position), 2) as quality,
    round((sum(case when rating < 3 then 1 else 0 end) / count(position) * 100), 2) as poor_query_percentage
from Queries
group by query_name;

