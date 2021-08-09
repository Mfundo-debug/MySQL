-- 'use' is the SQL command that specifies the database to which all the following commands will be run against
USE school_db;

-- create Tablename('...') will  create a table with all the specified columns and their respective datatype
CREATE TABLE Students (
	id INT AUTO_INCREMENT PRIMARY KEY,
	lastname NVARCHAR(50) NOT NULL,
	firstname NVARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	enrollment_date DATE
);
CREATE TABLE Courses(
	courseid INT AUTO_INCREMENT PRIMARY KEY,
	title NVARCHAR(50) NOT NULL,
	number_of_credits INT,
	course_code NVARCHAR(10) NOT NULL -- Example: NDBS600
);