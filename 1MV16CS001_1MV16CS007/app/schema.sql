-- Created by Abhijeet Singh
-- USN: 1MV16CS001

-- drop table if it exists
-- refer: http://ora-exp.blogspot.com/2013/03/oracle-drop-table-if-exists.html
-- SIMPLE WAY, if execute immediate fails, because table not exists, transaction will be committed
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE teacher cascade constraints';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table teacher(
	dept_name varchar(10),
	f_name varchar(10),
	m_name varchar(10),
	l_name varchar(10),
	teacher_id varchar(10),
	Primary key(teacher_id),
	Constraint fk_id1 foreign key(dept_name)references dept(dept_name)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE section cascade constraints';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table section (
	building number(2),
	room_no number(3),
	academic_year number(4),
	sem number(1),
	section_id varchar(10),
	course_id varchar(10),
	timeslot_id varchar(10),
	primary key(course_id, section_id, sem, academic_year),
	Constraint fk_id2 foreign key(course_id) references course_info(course_id),
	Constraint fk_id3 foreign key(building,room_no) references classroom(building,room_no)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE teacher_course';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table teacher_course(
	course_id varchar(10),
	section_id varchar(10),
	sem number(1),
	academic_year number(4),
	teacher_id varchar(10),
	primary key (course_id,section_id,sem,academic_year,teacher_id),
	Constraint fk_id4 foreign key (teacher_id) references teacher(teacher_id),
	Constraint fk_id5 foreign key(course_id,section_id,sem,academic_year) references section(course_id, section_id, sem, academic_year)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE timeslot';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table timeslot(
	timeslot_id  varchar(10),
	week_day varchar(3),
	start_hour number(2),
	start_min number(2),
	end_hour number(2),
	end_min number(2),
	primary key(timeslot_id, week_day, start_hour, start_min)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE classroom cascade constraints';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table classroom (
	capacity number(3),
	room_no number(3),
	building number(2),
	primary key(building,room_no)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE course_info cascade constraints';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table course_info (
	course_id varchar(10),
	dept_name varchar(10),
	title varchar(10),
	no_of_hours number(2),
	credits varchar(10),
	primary key (course_id),
	Constraint fk_id6 foreign key(dept_name) references dept(dept_name)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE dept cascade constraints';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table dept (
	dept_name varchar(10),
	building number(2),
	primary key(dept_name)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE student cascade constraints';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table student (
	stud_id varchar(10),
	stud_name varchar(10),
	dept_name varchar(10),
	primary key(stud_id),
	Constraint fk_id7 foreign key(dept_name) references dept(dept_name)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE student_course';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table student_course (
	stud_id varchar(10),
	course_id varchar(10),
	academic_year number(4),
	section_id varchar(10),
	sem number(1),
	grade varchar(2),
	primary key(stud_id,course_id,section_id,sem,academic_year),
	Constraint fk_id8 foreign key(course_id,section_id,sem,academic_year) references section(course_id,section_id,sem,academic_year),
	Constraint fk_id9 foreign key(stud_id) references student(stud_id)
	);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE local_guardian';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table local_guardian (
	teacher_id varchar(10),
	stud_id varchar(10),
	primary key(stud_id),
	Constraint fk_id10 foreign key(stud_id) references student (stud_id),
	Constraint fk_id11 foreign key(teacher_id) references teacher(teacher_id)
);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE faculty_login';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table faculty_login (
  FACULTY_ID varchar(20),
  FACULTY_TYPE VARCHAR(10),
  faculty_pass varchar(20),
  Constraint fk_fac_id foreign key(FACULTY_ID)
    REFERENCES teacher(teacher_id) on delete cascade
);

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE student_login';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE <> -942 THEN
      RAISE;
    END IF;
END;
/

create table student_login (
  USER_ID varchar(20),
  student_pass varchar(20),
  Constraint fk_stud_id foreign key(USER_ID) 
    REFERENCES student(stud_id) on delete cascade
);
