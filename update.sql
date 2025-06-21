
SELECT * FROM student ORDER BY student_id ASC

-- update something from database table 
UPDATE student 
    set country = 'USA to Bangladesh'
    WHERE country = 'USA'

SELECT * FROM student WHERE country = 'USA to Bangladesh'

-- change null to default value 
UPDATE student
    SET dob = '2000-01-01'
    WHERE dob IS NULL

-- change default value to null 
UPDATE student
    SET dob = '2006-03-12'
    WHERE  student_id = 1

UPDATE student
    SET age = EXTRACT(YEAR FROM age(current_date, dob))
    WHERE student_id = 1
