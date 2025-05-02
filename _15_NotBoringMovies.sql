
-- LeetCode - 620

-- Not Boring Movies
/*
    Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
    Return the result table ordered by rating in descending order.
*/

create table cinema(
    id int primary key,
    movies varchar(100),
    description varchar(100),
    rating decimal(3,1)
);

insert into cinema(id, movies, description, rating)
values 
    (1  , 'War'        , 'great 3D'    , 8.9),
    (2  , 'Science'    , 'fiction'     , 8.5),
    (3  , 'irish'      , 'boring'      , 6.2),
    (4  , 'Ice song'   , 'Fantacy'     , 8.6),
    (5  , 'House card' , 'Interesting' , 9.1);

-- Solution :

select * 
from cinema
where id % 2 = 1 and description != 'boring'
order by rating desc;