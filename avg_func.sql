/*
	BRING BACK THE AVERAGE GRADES PER COURSE
*/
use school_db;
select 
co.title as `Course Title`,
avg(en.grade) as `Average grade	`
from enrollments en
inner join classes cl on cl.idClasses = en.class_id
inner join courses co on courseid = cl.courses_id
group by co.title                                                                                                                                                                                               