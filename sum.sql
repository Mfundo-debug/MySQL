/*
bring back the total number of credits that each student done
*/
use school_db;
select concat(s.lastname, ',', s.firstname) `Student Name`,
sum(co.number_of_credits) as `Total credits`
 from enrollments e
inner join students s on e.student_id = s.id
inner join classes c on e.class_id = c.idClasses
inner join courses co on e.class_id = c.idClasses
group by s.lastname, s.firstname