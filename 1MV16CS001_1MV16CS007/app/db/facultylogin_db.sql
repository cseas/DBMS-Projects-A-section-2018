create table facultyloginTable(
FACULTY_ID varchar(20),
FACULTY_TYPE VARCHAR(10),
password varchar(20),
Constraint fk_user_id foreign key(FACULTY_ID) REFERENCES teacher(teacher_id) on delete cascade
);

INSERT into facultyloginTable(Faculty_id,User_type,password)
Values("teacher","Teacher","TEACHER123");

INSERT into facultyloginTable(Faculty_id,User_type,password)
Values("CS002","Teacher","TEACHER123");

INSERT into facultyloginTable(Faculty_id,User_type,password)
Values("CS003","Teacher","TEACHER123");

INSERT into facultyloginTable(Faculty_id,User_type,password)
Values("CS004","Teacher","TEACHER123");




INSERT into facultyloginTable(Faculty_id,User_type,password)
Values("admin","Admin","admin123");

INSERT into facultyloginTable(Faculty_id,User_type,password)
Values("CS006","Admin","admin123");
