
-- LeetCode - 1661

-- Average Time of Process per Machine
/*
    There is a factory website that has several machines each running the same number of processes. 
    Write a solution to find the average time each machine takes to complete a process.

    The time to complete a process is the ''end'' timestamp minus the ''start'' timestamp. 
    The average time is calculated by the total time to complete every process on the machine divided by the number of 
    processes that were run.

    The resulting table should have the machine_id along with the average time as processing_time, which should be 
    rounded to 3 decimal places.
*/

create table activity(
    machine_id int,
    process_id int,
    activity_type enum('start', 'end'),
    timestamp float,
    primary key (machine_id, process_id, activity_type)
);

insert into activity(machine_id, process_id, activity_type, timestamp)
values 
    (0, 0, 'start', 0.712),
    (0, 0, 'end' , 1.520),
    (0, 1, 'start', 3.140),
    (0, 1, 'end' , 4.120),
    (1, 0, 'start', 0.550),
    (1, 0, 'end' , 1.550),
    (1, 1, 'start', 0.430),
    (1, 1, 'end' , 1.420),
    (2, 0, 'start', 4.100),
    (2, 0, 'end' , 4.512),
    (2, 1, 'start', 2.500),
    (2, 1, 'end' , 5.000);


-- Solution :

with process_times as (
    select a.machine_id, a.process_id, (b.timestamp - a.timestamp) as process_time
    from activity a
    join activity b
    on a.machine_id = b.machine_id
        and a.process_id = b.process_id
        and a.activity_type = 'start'
        and b.activity_type = 'end'
)
select machine_id, round(avg(process_time), 3) as process_time 
from process_times
group by machine_id;


