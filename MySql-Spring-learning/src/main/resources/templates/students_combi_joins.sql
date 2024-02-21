INSERT INTO students (FIRST_NAME, LAST_NAME, EMAIL, PHONE, BIRTHDAY)
VALUES ('Aladdin', 'Lampland', 'aladdin@com.com', '777-8888', '2003-08-14');
INSERT INTO students (FIRST_NAME, LAST_NAME, EMAIL, PHONE, BIRTHDAY)
VALUES ('Simba', 'Kingston', 'simba@king.com', '999-3333', '2000-02-02');

INSERT INTO student_projects (STUDENT_ID, TITLE) VALUES (1, 'Carrot');
INSERT INTO student_projects (STUDENT_ID, TITLE) VALUES (2, 'Mad Hattery');
INSERT INTO student_projects (STUDENT_ID, TITLE) VALUES (3, 'Carpet Physics');
INSERT INTO student_projects (STUDENT_ID, TITLE) VALUES (4, 'Hyena Habitats');


CREATE TABLE project_pairs(
    id          INTEGER PRIMARY KEY auto_increment,
    project1_id INTEGER,
    project2_id INTEGER
);

INSERT INTO project_pairs (project1_id, project2_id)
VALUES(1, 2);
INSERT INTO project_pairs (project1_id, project2_id)
VALUES(3, 4);

/* combining multiple joins */
select a.TITLE, b.TITLE from project_pairs
    join student_projects a
    on project_pairs.project1_id = a.ID
    join student_projects b
    on project_pairs.project2_id = b.ID;