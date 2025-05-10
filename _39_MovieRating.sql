
-- LeetCode - 1341

-- Movie Rating
/*
    Write a solution to:
        Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically 
        smaller user name.
        Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically 
        smaller movie name.
*/

create table movies(
    movie_id int primary key,
    title varchar(100)
);

create table users1(
    user_id int primary key,
    name varchar(100)
);

create table movie_rating(
    movie_id int,
    user_id int,
    rating int,
    create_at date,
    primary key (movie_id, user_id)
);

insert into movies(movie_id, title)
values
    (1, 'Avengers'),
    (2, 'Frozen 2 '),
    (3, 'Joker');


insert into users1(user_id, name)
values
    (1, 'Daniel'),
    (2, 'Monica'),
    (3, 'Maria'),
    (4, 'James');

insert into movie_rating(movie_id, user_id, rating, create_at)
values
    (1, 1 , 3 , '2020-01-12' ),
    (1, 2 , 4 , '2020-02-11' ),
    (1, 3 , 2 , '2020-02-12' ),
    (1, 4 , 1 , '2020-01-01' ),
    (2, 1 , 5 , '2020-02-17' ),
    (2, 2 , 2 , '2020-02-01' ),
    (2, 3 , 2 , '2020-03-01' ),
    (3, 1 , 3 , '2020-02-22' ), 
    (3, 2 , 4 , '2020-02-25' );
