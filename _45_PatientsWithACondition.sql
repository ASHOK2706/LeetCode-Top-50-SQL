
-- LeetCode - 1527. Patients With a Condition

/*
    Write a solution to find the patient_id, patient_name, and conditions of the patients who 
    have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
*/

create table patients(
    patient_id int primary key,
    patient_name varchar(100),
    conditions varchar(100)
);

insert into patients(patient_id, patient_name, conditions)
values
    (1, 'Daniel', 'YFEV COUGH'  ),
    (2, 'Alice' , ' ' ),
    (3, 'Bob', 'DIAB100 MYOP'),
    (4, 'George', 'ACNE DIAB100'),
    (5, 'Alain' , 'DIAB201');

-- Solution:

select 
    patient_id, 
    patient_name, 
    conditions
from 
    patients
where conditions like 'DIAB1%' or conditions like '% DIAB1%';
