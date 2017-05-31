/*Final project part 2*/

USE university;

/*Query 1*/
/*Displays names of faculty members
 who works in department 1 or 2.*/
SELECT `name`
	FROM faculty
    WHERE dept_id = 1 
		OR dept_id = 2;

/*Query 2*/
/*Displays course ID, section ID,
and faculty name using JOIN…ON syntax.*/
SELECT s.course_id, s.section_id, f.faculty_id, f.`name`
	FROM section s
		JOIN faculty f
			ON s.faculty_id = f.faculty_id
	WHERE s.term_id = 'SP13';

/*Query 3*/
/*Displays a student full name 
with major description.*/
SELECT s.last_name, s.first_name, m.major_desc
	FROM student s, major m
    WHERE s.major_id = m.major_id;

/*Query 4*/
/*Displays names of students, who received an ‘F’ 
as their final grade in winter 2013 using 
JOIN…ON syntax.*/
SELECT s.last_name, s.first_name
	FROM student s
		JOIN registration r
			ON s.student_id = r.student_id
	WHERE s.start_term = 'WN13' 
	  AND r.final_grade = 'F';

/*Query 5*/
/*Displays the titles of all courses 
taught by Professor Sen.*/    
SELECT c.title
	FROM course c
    WHERE c.course_id 
	IN
	(SELECT course_id 
		FROM section s
		WHERE s.faculty_id 
        IN
		(SELECT faculty_id
			FROM faculty f
			WHERE f.`name` = 'Sen'));

/*Query 6*/
/*Looks for all New York and New Jersey students. 
Displays student ID, last name, first name, 
and state.*/
SELECT s.student_id, s.last_name, s.first_name, s.state
	FROM student s
	WHERE state = 'NJ' 
	   OR state = 'NY';

/*Query 7*/
/*For each course ID, displays the maximum
count in descending order.*/
SELECT course_id,MAX(max_count) AS Max_count
	FROM section s
    GROUP BY s.course_id
    ORDER BY Max_count DESC;

/*Query 8*/
/*Displays all instructors and how many 
sections they teach.*/
SELECT f.`name`,COUNT(s.section) AS Num_sections
	FROM faculty f, section s
    WHERE f.faculty_id = s.faculty_id
    GROUP BY f.`name`
    ORDER BY f.`name`;

/*Query 9*/
/*Shows the total enrollment for course
CIS253 in a column named TOTAL ENROLLED.*/
SELECT COUNT(r.student_id) AS 'TOTAL ENROLLED'
	FROM registration r
		JOIN section s 
			ON r.section_id = s.section_id 
            AND s.course_id = 'CIS253';

/*Query 10*/
/*Displays course title, total capacity 
and number of sections in each course, 
where there is more than 1 section.*/
SELECT course.title, SUM(location.capacity) AS Total_capacity,
				COUNT(s.section) AS Section_num
	FROM section s
		JOIN course 
			ON s.course_id = course.course_id
		JOIN location 
			ON s.room_id = location.room_id
	GROUP BY course.title
    HAVING Section_num > 1;

/*Query 11*/
/*Creates a view CSinstructors which shows all 
information about instructors from the Computer
Science department.*/
CREATE OR REPLACE VIEW CSinstructors AS 
SELECT * 
	FROM faculty f
	WHERE f.dept_id = (SELECT d.dept_id
						FROM department d
						WHERE f.dept_id = d.dept_id
							AND dept_name = 'Computer Science');

/*Query 12*/
/*Looks for students who are born in 
the month of October.*/
SELECT last_name,first_name
	FROM student
    WHERE MONTH(birth_date) = 10;
    
/*Query 13*/
/*Creates a new table, Sp13SECT, for Spring 2013 
semester course sections using a subquery.
Includes Course ID, Section ID, Faculty 
ID and Room ID columns only.*/
DROP TABLE IF EXISTS Sp13SECT;

CREATE TABLE Sp13SECT AS 
	(SELECT c.course_id,s.section_id,f.faculty_id,l.room_id
		FROM section s
			JOIN course c 
				ON s.course_id = c.course_id
            JOIN faculty f 
				ON s.faculty_id = f.faculty_id
            JOIN location l 
				ON s.room_id = l.room_id
		WHERE s.term_id = 'SP13');
        
/*Query 14*/
/*Deletes rows from SP13SECT table for 
faculty 'Mobley'*/
DELETE FROM Sp13SECT
	WHERE faculty_id = 
		(SELECT f.faculty_id
			FROM faculty f
			WHERE f.`name` = 'Mobley');

/*Query 15*/
/*Displays course and section ID in all 
sections whose registration is greater 
than 2.*/
SELECT s.section_id,s.course_id
	FROM section s
	JOIN registration r 
		ON s.section_id = r.section_id
	GROUP BY s.section_id
    HAVING COUNT(r.section_id) > 2;

		
		