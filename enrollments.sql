-- Select the details of each enrollment by starting the Student name, course, lecturer and time of class session
SELECT
concat(lect.last_name, '.', lect.first_name) as `Lecturer Full Name`,
concat(stu.lastname, '.', stu.firstname) as `Student Full Name`,
cour.title as `Course Title`,
class.time as `Session Time`
FROM school_db.enrollments enrols
inner join school_db.classes class on class.idClasses = enrols.class_id
inner join school_db.students stu on stu.id = enrols.student_id
inner join school_db.lecturers lect on class.Lecture_id = lect.id
inner join school_db.courses cour on class.courses_id = cour.courseid;