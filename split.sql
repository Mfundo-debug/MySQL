/*
 having function splits group
 
bring back the total number of credits that each student done
*/
use school_db;
select concat(s.lastname, ',', s.firstname) `Student Name`,
sum(co.number_of_credits) as `Total credits`
 from enrollments e
inner join students s on e.student_id = s.id
inner join classes c on e.class_id = c.idClasses
inner join courses co on c.courses_id = co.courseid
group by s.lastname, s.firstname
having sum(co.number_of_credits) <=45;

/*
 bring back the highest and lowest grades for each course
*/

select class_id as `Class ID`, 
min(grade) as `Low grade`,
 max(grade) as `Highest grade` 
 from enrollments
group by class_id
having min(grade)>50