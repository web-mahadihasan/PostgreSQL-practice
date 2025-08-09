-- Pagination in sql data base 
-- practace purpose

-- limit use for using limit how much item i want to get, 
-- and offset use for how much item i want to ignore

SELECT * FROM student
 
--  for first page using start 0
--  1 - 5 
 SELECT * FROM student LIMIT 5 OFFSET 5 * 0;
 
--  6-10
 SELECT * FROM student LIMIT 5 OFFSET 5 * 1;

--  11-15
 SELECT * FROM student LIMIT 5 OFFSET 5 * 2;
 
--  16-20
 SELECT * FROM student LIMIT 5 OFFSET 5 * 3;

--  21-30
 SELECT * FROM student OFFSET 21;

 SELECT * FROM student WHERE country IN ('Bangladesh', 'Spain', 'Pakistan') LIMIT 5 OFFSET 5 * 0

 SELECT * FROM student WHERE country IN ('Bangladesh', 'Spain', 'Pakistan') LIMIT 5 OFFSET 5 * 1

-- For delete something
 DELETE FROM student WHERE email='victor.lopez@example.com'

 