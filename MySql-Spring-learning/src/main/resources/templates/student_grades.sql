CREATE TABLE student_grades
(
    id                 INTEGER PRIMARY KEY AUTO_INCREMENT,
    name               TEXT,
    number_grade       INTEGER,
    fraction_completed REAL
);

INSERT INTO student_grades (name, number_grade, fraction_completed)
VALUES ('Winston', 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
VALUES ('Winnefer', 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
VALUES ('Winsteen', 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
VALUES ('Wincifer', 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
VALUES ('Winster', 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
VALUES ('Winstonia', 82, 0.9045);

/*Step 1
We've created a database to track student grades, with their name, number grade, and what percent of
  activities they've completed. In this first step, select all of the rows, and display the name,
  number_grade, and percent_completed, which you can compute by multiplying and rounding the fraction_completed
  column.*/
/*step-1*/
SELECT name, number_grade, ROUND(fraction_completed * 100, 2) AS percent_completed
FROM student_grades;

/*Step 2
Now, this step is a little tricky. The goal is a table that shows how many students have earned which letter_grade.
  You can output the letter_grade by using CASE with the number_grade column, outputting 'A' for grades > 90,
  'B' for grades > 80, 'C' for grades > 70, and 'F' otherwise. Then you can use COUNT with GROUP BY to show
  the number of students with each of those grades.*/
/* SELECT …, CASE … FROM … GROUP BY …; */
/* step-2 */
select count(*),
       case
           when number_grade > 90 then 'A'
           when number_grade > 80 then 'B'
           when number_grade > 70 then 'C'
           else 'otherwise'
           end as "letter_grade"
from student_grades
group by letter_grade;

/*variant-2 of step-2*/
SELECT CASE
           WHEN number_grade > 90 THEN 'A'
           WHEN number_grade > 80 THEN 'B'
           WHEN number_grade > 70 THEN 'C'
           ELSE 'F'
           END AS letter_grade,
       COUNT(*) AS number_of_students
FROM student_grades
GROUP BY letter_grade
ORDER BY letter_grade DESC;