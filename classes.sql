-- select all scheduled classes to which a lecturer has been assigned
SELECT 
concat(lect.last_name, '.', lect.first_name) as ` Lecturer Full Name`,
cour.title as `Course Title`,
cour.number_of_credits as `Number of Credits` 
FROM school_db.classes class
inner join school_db.lecturers lect on class.Lecture_id = lect.id
inner join school_db.courses cour on class.courses_id = cour.courseid;


