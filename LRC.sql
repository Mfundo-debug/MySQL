use school_db;
-- will select all values in the 'left table', whether or not they meet the condition
-- be sure to structure the query correctly to bring back the records that you are interested in.

select * from classes c
left join lecturers l on c.Lecture_id = l.id;

-- select all values in the 'right table', whethere or no they the condition
-- be sure to structure the query correctly to bring back the records interest in.

select * from classes c
right join lecturers l on c.Lecture_id = l.id;

-- select all records on either side regardless of there being a match
select * from classes c
cross join lecturers l;