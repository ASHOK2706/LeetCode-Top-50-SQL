
-- LeetCode - 585. Investments in 2016

/*
    Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
        have the same tiv_2015 value as one or more other policyholders, and
        are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
    Round tiv_2016 to two decimal places.   
*/

create table insurance(
    pid int primary key,
    tiv_2015 float,
    tiv_2016 float,
    lat float,
    lon float
);

insert into insurance(pid, tiv_2015, tiv_2016, lat, lon)
values
    (1, 10, 5 , 10, 10),
    (2, 20, 20, 20, 20),
    (3, 10, 30, 20, 20),
    (4, 10, 40, 40, 40);

-- Solution:

select round(sum(tiv_2016), 2) as tiv_2016
from insurance
where tiv_2015 in (
    select tiv_2015
    from insurance 
    group by tiv_2015
    having count(*) > 1
) and
(lat,lon) in (
    select lat,lon
    from insurance 
    group by lat,lon
    having count(*) = 1
);