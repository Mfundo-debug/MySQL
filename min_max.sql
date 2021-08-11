/*
 bring back the highest and lowest grades for each course
*/
use school_db;

select class_id as `Class ID`, 
min(grade) as `Low grade`,
 max(grade) as `Highest grade` 
 from enrollments
group by class_id