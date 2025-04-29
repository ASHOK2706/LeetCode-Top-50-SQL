
-- LeetCode - 1683

-- Invalid Tweets
/*
    Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used 
    in the content of the tweet is strictly greater than 15.
*/

create table tweets(
    tweet_id int primary key,
    content varchar(100)
);

insert into tweets(tweet_id, content)
values
    (1, 'Let us Code'),
    (2, 'More than fifteen chars are here!');

-- Solution :

select tweet_id from tweets where length(content) > 15;