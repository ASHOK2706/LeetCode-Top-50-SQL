
-- LeetCode - 1517. Find Users With Valid E-Mails

/*
    Write a solution to find the users who have valid emails.

    A valid e-mail has a prefix name and a domain where:

    The prefix name is a string that may contain letters (upper or lower case), digits, 
    underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
    The domain is '@leetcode.com'.
*/

create table users3(
    user_id int primary key,
    name varchar(100),
    mail varchar(100)
);

insert into users3(user_id, name, mail)
values
    (1, 'Winston', 'winston@leetcode.com'),
    (2, 'Jonathan', 'jonathanisgreat'),
    (3, 'Annabelle', 'bella-@leetcode.com'),
    (4, 'Sally', 'sally.come@leetcode.com'),
    (5, 'Marwan', 'quarz#2020@leetcode.com'),
    (6, 'David', 'david69@gmail.com'),
    (7, 'Shapiro', '.shapo@leetcode.com');

-- Solution:

select * 
from users3
where mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$';