-- brief guide to learn SQL queries for common cases along with examples:

-- 1. Basic SELECT Statement
-- To retrieve data from a database:
/*SELECT column1, column2 FROM table_name;*/

-- 2. Filtering Data with WHERE
-- You can filter records using conditions:
/*SELECT * FROM table_name WHERE condition;*/
/*SELECT * FROM EMPLOYEE WHERE SALARY > 50000;*/

-- 3. Sorting Results with ORDER BY
-- Sort results by one or more columns:
/*SELECT * FROM table_name ORDER BY column1 [ASC|DESC];*/
/*SELECT * FROM EMPLOYEE ORDER BY LASTNAME ASC;*/

-- 4. Grouping Data with GROUP BY
-- Group rows that have the same values in specified columns:
/*SELECT column1, COUNT(*) FROM table_name GROUP BY column1;*/
/*SELECT DEPARTMENT, COUNT(*) FROM EMPLOYEE GROUP BY DEPARTMENT;*/

-- 5. Filtering Groups with HAVING
-- Filter groups with conditions applied:
/*SELECT column1, COUNT(*) FROM table_name GROUP BY column1 HAVING COUNT(*) > 5;*/
/*SELECT DEPARTMENT, COUNT(*) FROM EMPLOYEE GROUP BY DEPARTMENT HAVING COUNT(*) > 3;*/

-- 6. Join Operations (INNER JOIN, LEFT JOIN)
-- Use joins to combine rows from two or more tables based on a related column:

-- INNER JOIN: Only return rows where there is a match.
/*SELECT E.FIRSTNAME, D.NAME
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.DEPARTMENT = D.ID;*/

-- LEFT JOIN: Return all rows from the left table and the matched rows from the right.
/*SELECT E.FIRSTNAME, D.NAME
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPARTMENT = D.ID;*/

-- 7. Aggregation Functions
-- Common aggregate functions include:
-- COUNT(column_name): Counts the number of rows.
-- SUM(column_name): Returns the sum of a numeric column.
-- AVG(column_name): Calculates the average of a numeric column.
-- MIN(column_name) and MAX(column_name): Retrieves the minimum and maximum values.

/*SELECT DEPARTMENT, SUM(SALARY) AS TotalSalary, AVG(SALARY) AS AverageSalary FROM EMPLOYEE GROUP BY DEPARTMENT;*/

-- 8. Inserting Data into a Table
-- To add new records:

/*INSERT INTO table_name (column1, column2) VALUES (value1, value2);*/
/*INSERT INTO DEPARTMENT (NAME, LOCATION) VALUES ('HR', 'New York');*/

-- 9. Updating Records
-- To modify existing records:
/*UPDATE table_name SET column1 = value1 WHERE condition;*/
/*UPDATE EMPLOYEE SET SALARY = 60000 WHERE ID = 3;*/


-- 10. Deleting Records
-- To remove records:
/*DELETE FROM table_name WHERE condition;*/
/*DELETE FROM EMPLOYEE WHERE ID = 5;*/

/*Additional Resources
Online SQL Tutorials: Websites like W3Schools, Codecademy, or SQLZoo offer interactive SQL tutorials.
Books: "SQL in 10 Minutes, Sams Teach Yourself" is a great book for quick learning.
Practice Platforms: Use platforms like LeetCode, HackerRank, or SQL Fiddle to practice SQL queries.*/




















