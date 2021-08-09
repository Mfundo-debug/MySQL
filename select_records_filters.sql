-- databasename.tablename
SELECT * FROM school_db.students;
-- Retrieve only students with the last name 'Dagama'
select lastname, firstname from school_db.students
where lastname = 'Dagama';

-- retrieve only students with the  letter 'e' in their last name
select lastname, firstname from school_db.students
where lastname like '%e%';

-- retrieve only students with the word that ends with 'e' in their last name
select lastname, firstname from school_db.students
where lastname like '%e';
-- retrieve only students names that starts with 'M' in their last name
select lastname, firstname from school_db.students
where lastname like 'M%';
-- Retrieve only Full names of students and their enrollment dates
select concat( firstname,' ', lastname) 'Full Name', enrollment_date 'Enrollment Date' from school_db.students;

-- select courses withe number of credits greater than 2
SELECT * FROM  school_db.courses
where number_of_credits > 2;

-- select courses with the number of credicts 3 and less
SELECT * FROM school_db.courses
where number_of_credits <= 3;