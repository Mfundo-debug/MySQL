/*
	Bring back the number of students enrolled per class
*/
use school_db;
select co.title, c.time, count(student_id) from enrollments en
inner join classes c on en.class_id = c.idClasses
inner join courses co on co.courseid = c.courses_id
group by class_id;


/*
Bring back the number of students enrolled per class
*/
select co.title, count(student_id) from enrollments en
inner join classes c on en.class_id = c.idClasses
inner join courses co on co.courseid = c.courses_id
group by class_id;

