
-- LeetCode - 550

-- Game Play Analysis IV
/*
    Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, 
    rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two 
    consecutive days starting from their first login date, then divide that number by the total number of players.
*/

create table activity1(
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    primary key (player_id, event_date)
);

insert into activity1(player_id, device_id, event_date, games_played)
values  
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);
