

USE university;

DROP TABLE IF EXISTS university.registration;
DROP TABLE IF EXISTS university.section;
DROP TABLE IF EXISTS university.faculty;
DROP TABLE IF EXISTS university.location;
DROP TABLE IF EXISTS university.course;
DROP TABLE IF EXISTS university.department;
DROP TABLE IF EXISTS university.student;
DROP TABLE IF EXISTS university.term;
DROP TABLE IF EXISTS university.major;



CREATE TABLE university.major (
	major_id INT(3) NOT NULL,
	major_desc TEXT DEFAULT NULL,
		PRIMARY KEY (major_id)
	);
  
CREATE TABLE university.term (
	term_id VARCHAR(4) NOT NULL,
	term_name VARCHAR(20) DEFAULT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
		PRIMARY KEY (term_id)
	);
  
CREATE TABLE university.student (
	student_id INT(5) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	street VARCHAR(30) DEFAULT NULL,
	city VARCHAR(15) DEFAULT NULL,
	state VARCHAR(2) DEFAULT NULL,
	zip VARCHAR(5) DEFAULT NULL,
	start_term VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	major_id INT(5) DEFAULT NULL,
	Phone VARCHAR(12) DEFAULT NULL,
	student_type VARCHAR(5) DEFAULT NULL,
		PRIMARY KEY (student_id),
		CONSTRAINT start_term_student_fk FOREIGN KEY (start_term) 
            REFERENCES university.term (term_id),
		CONSTRAINT major_id_student_fk FOREIGN KEY (major_id)
			REFERENCES university.major (major_id)
	);
    
CREATE TABLE university.department (
	dept_id INT(4) NOT NULL AUTO_INCREMENT,
	dept_name VARCHAR(45) NOT NULL,
		PRIMARY KEY (dept_id)
	);
  
CREATE TABLE university.course (
	course_id VARCHAR(10) NOT NULL,
	title VARCHAR(45) NULL,
	credits INT(2) DEFAULT 0,
	dept_id INT(2) NOT NULL,
		PRIMARY KEY (course_id),
		CONSTRAINT dept_id_course_fk FOREIGN KEY (dept_id)
			REFERENCES university.department (dept_id)
	);
    
CREATE TABLE university.location (
	room_id INT(3) NOT NULL,
	building VARCHAR(25) NOT NULL,
	room_no INT(3) NOT NULL,
	capacity INT(3) NOT NULL,
	room_type CHAR(1) NOT NULL,
	description VARCHAR(20) NOT NULL,
		PRIMARY KEY (room_id)
	);
  
CREATE TABLE university.faculty (
	faculty_id INT NOT NULL,
	`name` VARCHAR(25) NOT NULL,
	room_id INT(3) NOT NULL,
	Phone INT(3) NULL,
	dept_id INT(3) NOT NULL,
		PRIMARY KEY (faculty_id),
		CONSTRAINT dept_id_faculty_fk FOREIGN KEY (dept_id)
			REFERENCES university.department (dept_id),
		CONSTRAINT room_id_faculty_fk FOREIGN KEY (room_id)
			REFERENCES university.location (room_id)
	);

CREATE TABLE university.section (
	section_id INT(4) NOT NULL,
	course_id VARCHAR(10) NOT NULL,
	section CHAR(2) NOT NULL,
	term_id VARCHAR(5) NOT NULL,
	faculty_id INT NULL,
	`day` CHAR(2) NULL,
	max_count INT(2) NOT NULL,
	start_time VARCHAR(5) NOT NULL DEFAULT 'TBA',
	end_time VARCHAR(5) NOT NULL DEFAULT 'TBA',
	room_id INT NULL,
		PRIMARY KEY (section_id),
		CONSTRAINT course_id_section_fk FOREIGN KEY (course_id)
			REFERENCES university.course (course_id),
		CONSTRAINT term_id_section_fk FOREIGN KEY (term_id)
			REFERENCES university.term (term_id),
		CONSTRAINT faculty_id_section_fk FOREIGN KEY (faculty_id)
			REFERENCES university.faculty (faculty_id),
		CONSTRAINT room_id_section_fk FOREIGN KEY (room_id)
			REFERENCES university.location (room_id)
		);
    
CREATE TABLE university.registration (
	student_id INT(5) NOT NULL,
	section_id INT(4) NOT NULL,
	midterm_grade CHAR(1) CHECK (midterm_grade IN ('A','B','C','D','F','W')),
	final_grade CHAR(1) CHECK (final_grade IN('A','B','C','D','F','W')),
		CONSTRAINT registration_stuid_csid_pk
			PRIMARY KEY (student_id,section_id),
		CONSTRAINT student_id_reg_fk FOREIGN KEY (student_id)
			REFERENCES university.student (student_id),
		CONSTRAINT section_id_reg_fk FOREIGN KEY (section_id)
			REFERENCES university.section (section_id)
	)ENGINE = INNODB;