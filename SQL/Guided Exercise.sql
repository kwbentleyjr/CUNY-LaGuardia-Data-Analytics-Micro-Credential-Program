  
DROP TABLE IF EXISTS student;
CREATE TABLE student
(
    id serial PRIMARY KEY,
    first_name character varying,
    last_name character varying,
    email character varying,
    gender character varying,
    work_phone character varying,
    book_preference_hardcopy boolean 
);

copy student(first_name,last_name,email,gender,work_phone,book_preference_hardcopy)
--set the path for file location of student_data.csv
from 'C:\Temp\student_data.csv'
delimiter ',' CSV header


  
DROP TABLE IF EXISTS student_marks;
CREATE TABLE student_marks
(
    id serial PRIMARY KEY,
    student_reg_id integer,
    student_id integer,
	unit2 integer,
	unit3 integer,
	unit4 integer,
	unit5 integer    
);

copy student_marks(student_reg_id,student_id,unit2,unit3,unit4,unit5)
--set the path for file location of student_marks.csv
from 'C:\Temp\student_marks.csv'
delimiter ',' CSV header


Sample questions: 

-- 1. students with the highest marks in Unit 4
SELECT * FROM student_marks ORDER BY unit4 DESC;

-- 2. students scored between 89 and 100 unit4 
SELECT * FROM student_marks WHERE unit4 BETWEEN 89 AND 100 ORDER BY unit4;

-- Open ended questions:
-- Take a closer look at the tables that you created and come up with 10 different scenarios/ questions and from SQL

SELECT * FROM student;
SELECT * FROM student_marks;
SELECT COUNT(*) FROM student;

-- 1. How many males are in the class:
SELECT COUNT(*) FROM student WHERE gender='Male';

-- 2. How many females are in the class:
SELECT COUNT(*) FROM student WHERE gender='Female';

-- 3. Which students and how many prefer hardcopy books?
SELECT first_name, last_name FROM student WHERE book_preference_hardcopy=true;
SELECT COUNT(book_preference_hardcopy) FROM student WHERE book_preference_hardcopy=true;

-- 4. How many students made less than 90 on Unit 2?
SELECT COUNT(unit2) FROM student_marks WHERE unit2<90;

-- 5. Which students scored 100 on Unit 5:
SELECT student.first_name, student.last_name, student_marks.unit5 FROM student_marks 
INNER JOIN student ON student_marks.student_id=student.id WHERE unit5=100;

-- 6. Which students have last names that begin with Be
SELECT first_name, last_name FROM student WHERE last_name LIKE 'Be%';

-- 7. Which students scored greater than 95 on all units?
SELECT 
	student.first_name, 
	student.last_name, 
	student_marks.unit2, 
	student_marks.unit3, 
	student_marks.unit4, 
	student_marks.unit5
FROM student_marks 
INNER JOIN student ON student_marks.student_id=student.id 
WHERE unit2>95 AND unit3>95 AND unit4>95 AND unit5>95;

--8. How many students scored perfect on Unit 3?
SELECT COUNT(student_marks.unit3) FROM student_marks INNER JOIN student ON student_marks.student_id=student.id
WHERE student_marks.unit3=100;
-- Females?
SELECT COUNT(student_marks.unit3) FROM student_marks INNER JOIN student ON student_marks.student_id=student.id
WHERE student_marks.unit3=100 and student.gender='Female';
-- Males?
SELECT COUNT(student_marks.unit3) FROM student_marks INNER JOIN student ON student_marks.student_id=student.id
WHERE student_marks.unit3=100 and student.gender='Male';

--9. What was the average score of each Unit?
SELECT 
	AVG(unit2) AS "UNIT 2 AVERAGE", 
	AVG(unit3) AS "UNIT 3 AVERAGE", 
	AVG(unit4) AS "UNIT 4 AVERAGE", 
	AVG(unit5) AS "UNIT 5 AVERAGE" 
FROM student_marks;

--10. What are the names and email addresses of the students that scored lowest on unit 4?
SELECT MIN(unit4) FROM student_marks;
SELECT student.first_name, student.last_name, student.email, student_marks.unit4 FROM student_marks 
INNER JOIN student ON student_marks.student_id=student.id WHERE unit4=82;


