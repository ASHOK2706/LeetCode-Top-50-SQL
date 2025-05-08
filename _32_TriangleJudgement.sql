
-- LeetCode - 610

-- Triangle Judgement
/*
    Report for every three line segments whether they can form a triangle.
*/

create table triangle(
    x int, 
    y int,
    z int,
    primary key(x, y, z)
);

insert into triangle(x, y, z)
values  
    (13, 15, 30),
    (10, 20, 15);


-- Solution:

select x, y, z , 
    case 
        when (x + y) > z and (x + z) > y and (y + z) > x then 'Yes'
        else 'No'
    end as triangle
from triangle;