
-- LeetCode - 197

-- Rising Temperature
/*
    Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
*/

create table weather(
    id int primary key,
    recordDate date,
    temperature int
);

insert into weather(id, recordDate, temperature) 
values 
    (1, '2015-01-01', 10),
    (2, '2015-01-02', 25),
    (3, '2015-01-03', 20),
    (4, '2015-01-04', 30);


-- Solution :


select w1.id
from weather w1
join weather w2
on datediff(w1.recordDate, w2.recordDate) = 1
where w1.temperature > w2.temperature;
