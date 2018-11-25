create table studentloginTable(
USER_ID varchar(20),
password varchar(20),
Constraint fk_user_id foreign key(USER_ID) REFERENCES student(stud_id) on delete cascade
);

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS001","abhi123");

INSERT into studentloginTable(Student_id,password)
Values("student","student123");

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS003","abhi123");

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS004","abhi123");

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS005","adit123");

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS006","adit123");

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS007","adit123");

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS008","aish123");

INSERT into studentloginTable(Student_id,password)
Values("1MV16CS009","aksh123");




















