create table students (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME TEXT,
    LAST_NAME TEXT,
    EMAIL TEXT,
    PHONE TEXT,
    BIRTHDAY TEXT
);

INSERT INTO students (FIRST_NAME, LAST_NAME, EMAIL, PHONE, BIRTHDAY)
VALUES ('Peter', 'Rabbit', 'peter@rabbit.com', '555-6666', '2002-06-24');
INSERT INTO students (FIRST_NAME, LAST_NAME, EMAIL, PHONE, BIRTHDAY)
VALUES ('Alice', 'Wonderland', 'alice@wonderland.com', '555-4444', '2002-07-04');

select concat(FIRST_NAME, ' ', LAST_NAME ) as 'FULL NAME' from students;

/*creating another table to relate to...*/
create table student_points(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    STUDENT_ID INTEGER,
    TEST TEXT,
    POINT INTEGER
);

insert into student_points (STUDENT_ID, TEST, POINT) VALUES (1, 'Nutrition', 95);
insert into student_points (STUDENT_ID, TEST, POINT) VALUES (2, 'Nutrition', 92);
insert into student_points (STUDENT_ID, TEST, POINT) VALUES (1, 'Chemistry', 85);
insert into student_points (STUDENT_ID, TEST, POINT) VALUES (2, 'Chemistry', 95);

/*JOINing related tables*/
select * from student_points;

/* cross join */
select *
from student_points,
     students;

/* implicit inner join */
select *
from student_points,
     students
where student_points.STUDENT_ID = students.ID;

/* explicit inner join - JOIN*/
select *
from students
         join student_points
              on students.ID = student_points.STUDENT_ID;

select FIRST_NAME, LAST_NAME, EMAIL, TEST, POINT
from students
         join student_points
              on students.ID = student_points.STUDENT_ID;

/* join on where */
select FIRST_NAME, LAST_NAME, EMAIL, TEST, POINT
from students
         join student_points
              on students.ID = student_points.STUDENT_ID
where POINT > 90;

/* Joining related tables with left outer joins */
create table student_projects (
    ID INTEGER PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    STUDENT_ID INTEGER,
    TITLE TEXT
);

INSERT INTO student_projects (STUDENT_ID, TITLE) VALUES (1, 'Carrot');

select * from student_projects;

/*simple join to have combination of 2 tables by using common ID*/
select students.FIRST_NAME, students.LAST_NAME, student_projects.TITLE
from students
join student_projects
on students.ID = student_projects.STUDENT_ID;

/* what if we want to have each student in table even if they don`t have any projects - LEFT OUTER JOIN*/
select students.FIRST_NAME, students.LAST_NAME, student_projects.TITLE
from students
         left outer join student_projects
              on students.ID = student_projects.STUDENT_ID;


