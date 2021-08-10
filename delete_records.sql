use school_db;
-- basically in command goes through the table it will remove students with id(8&6)
delete from students 
where id in (8,6);
 /* 
 remove one row by id
 delete from students, where id = (1...n);
 */
 -- Delete student by names
 delete from students
 where firstname = 'Rich' and lastname = 'frank';
 /* 
 delete all students with name containing the word 'student'
 delete from students
 where firstname like '%student$' or lastname like '%student%';
 */