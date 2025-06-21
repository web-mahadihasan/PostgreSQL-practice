CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT check (age >= 12),
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100) NOT NULL  UNIQUE,
    dob DATE,
    blood_group VARCHAR(3),
    country VARCHAR(50)
)

SELECT * FROM student

INSERT INTO student (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('Alice', 'Johnson', 15, 'A', 'Mathematics', 'alice.johnson@example.com', '2010-03-12', 'O+', 'USA'),
('Brian', 'Smith', 17, 'B', 'Physics', 'brian.smith@example.com', '2008-07-08', 'A-', 'UK'),
('Chloe', 'Lee', 13, 'A', 'Biology', 'chloe.lee@example.com', '2011-11-21', 'B+', 'Canada'),
('Daniel', 'Kim', 14, 'C', 'Chemistry', 'daniel.kim@example.com', '2010-06-04', 'AB+', 'South Korea'),
('Emily', 'Garcia', 16, 'B', 'History', 'emily.garcia@example.com', '2009-01-15', 'O-', 'Mexico'),
('Farhan', 'Ahmed', 18, 'A', 'Computer Science', 'farhan.ahmed@example.com', '2007-09-10', 'A+', 'Pakistan'),
('Grace', 'Brown', 15, 'B', 'English', 'grace.brown@example.com', '2010-05-18', 'B-', 'Australia'),
('Hiroshi', 'Tanaka', 14, 'C', 'Art', 'hiroshi.tanaka@example.com', '2010-12-01', 'O+', 'Japan'),
('Isabelle', 'Dupont', 13, 'A', 'Geography', 'isabelle.dupont@example.com', '2011-08-25', 'AB-', 'France'),
('Jamal', 'Williams', 17, 'B', 'Economics', 'jamal.williams@example.com', '2008-03-03', 'A-', 'South Africa');

-- again input data in table 
INSERT INTO student (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('Karan', 'Mehta', 16, 'A', 'Computer Science', 'karan.mehta2@example.com', '2009-02-14', 'B+', 'Bangladesh'),
('Lena', 'Schmidt', 15, 'B', 'Biology', 'lena.schmidt2@example.com', NULL, 'O-', 'Germany'),
('Miguel', 'Santos', 17, 'A', 'History', 'miguel.santos2@example.com', '2008-11-30', 'A+', 'Spain'),
('Nina', 'Ivanova', 14, 'C', 'Art', 'nina.ivanova2@example.com', '2010-09-05', 'AB-', 'Russia'),
('Omar', 'Khaled', 18, 'B', 'Economics', 'omar.khaled2@example.com', NULL, 'O+', 'Bangladesh'),
('Priya', 'Reddy', 13, 'A', 'Mathematics', 'priya.reddy2@example.com', '2011-04-22', 'A-', 'Bangladesh'),
('Quentin', 'Martinez', 16, 'C', 'Geography', 'quentin.martinez2@example.com', '2009-06-19', 'B-', 'Brazil'),
('Rina', 'Yamamoto', 15, 'B', 'Chemistry', 'rina.yamamoto2@example.com', NULL, 'AB+', 'Japan'),
('Sasha', 'Petrov', 17, 'A', 'Physics', 'sasha.petrov2@example.com', '2008-01-10', 'O+', 'Russia'),
('Tariq', 'Ali', 14, 'C', 'English', 'tariq.ali2@example.com', '2010-10-28', 'A+', 'Bangladesh'),

('Usha', 'Nair', 15, 'B', 'Computer Science', 'usha.nair@example.com', '2010-05-09', 'O-', 'Bangladesh'),
('Victor', 'Lopez', 16, 'A', 'Biology', 'victor.lopez@example.com', '2009-03-20', 'B+', 'Spain'),
('Wendy', 'Miller', 14, 'C', 'History', 'wendy.miller@example.com', NULL, 'A-', 'Germany'),
('Xiao', 'Chen', 13, 'A', 'Art', 'xiao.chen@example.com', '2011-12-01', 'B+', 'Japan'),
('Yasmine', 'Hassan', 17, 'B', 'Economics', 'yasmine.hassan@example.com', '2008-08-14', 'A+', 'Bangladesh'),
('Zane', 'Brown', 18, 'A', 'Mathematics', 'zane.brown@example.com', '2007-07-07', 'AB-', 'Australia'),
('Ahmed', 'Sadiq', 15, 'C', 'Geography', 'ahmed.sadiq@example.com', '2010-09-30', 'O+', 'Pakistan'),
('Bella', 'Ivanov', 14, 'B', 'Chemistry', 'bella.ivanov@example.com', NULL, 'B-', 'Russia'),
('Carlos', 'Diaz', 16, 'A', 'Physics', 'carlos.diaz@example.com', '2009-10-15', 'A-', 'Spain'),
('Diana', 'White', 13, 'C', 'English', 'diana.white@example.com', '2011-01-12', 'AB+', 'Australia');


SELECT email as studentEmail FROM student

SELECT * from student ORDER BY age DESC

-- data filtaring 

SELECT * FROM student WHERE email LIKE 'jamal.williams@example.com'

SELECT * FROM student WHERE grade = 'A' AND course = 'Mathematics'

-- Sclar and aggregation

SELECT concat (first_name, ' ', last_name) FROM student

-- Aggregation funtion 

SELECT avg(age) FROM student

SELECT min(age) FROM student

SELECT max(length(last_name)) FROM student

-- OR and NOT uses 

SELECT * FROM student
    WHERE NOT country = 'USA';

SELECT * FROM student
    WHERE grade = 'A' and course = 'Biology'

-- Update something in a column 
UPDATE student
    SET dob = NULL
    WHERE email = 'hiroshi.tanaka@example.com'


-- How to handle null and nullish coalishing

SELECT * FROM student 
    WHERE dob IS NULL


-- multiple value using in 

SELECT * FROM student
    WHERE age in (15, 18, 14, 13)

    

SELECT * FROM student
    WHERE age NOT IN (15, 18, 14, 13)