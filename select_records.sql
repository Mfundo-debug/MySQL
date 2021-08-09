 -- * means all
 use school_db;
 
select * from students;
-- you can specify the columns you would like to see
-- add an alias and represent the output column as you wish
select lastname as 'Last Name', 
firstname as 'First name', 
date_of_birth  'Date of Birth'
from students;
