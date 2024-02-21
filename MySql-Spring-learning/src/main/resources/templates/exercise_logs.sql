CREATE TABLE exercise_logs
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    type       TEXT,
    minutes    INTEGER,
    calories   INTEGER,
    heart_rate INTEGER
);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('biking', 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('biking', 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('dancing', 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('dancing', 15, 165, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('tree climbing', 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('tree climbing', 25, 72, 80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('rowing', 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ('hiking', 60, 80, 85);

select * from exercise_logs;
select * from exercise_logs where calories > 50 order by calories;

/*AND operator to combine multiple conditions*/
select * from exercise_logs where calories > 50 and minutes < 30;

/*OR operator to return of any result by some conditions*/
select * from exercise_logs where calories > 50 or heart_rate > 100;

select * from exercise_logs where type = 'biking';

select * from exercise_logs where type = 'biking' or type = 'hiking' or type = 'tree climbing'
                               or type = 'rowing';

/* IN operator check if particular value is in a list of values*/
select * from exercise_logs where type in ('biking', 'hiking', 'tree climbing', 'rowing');

/* NOT IN operator check if particular value is not in a list of values - reverse operation*/
select * from exercise_logs where type not in ('biking', 'hiking', 'tree climbing', 'rowing');

CREATE TABLE drs_favorites
(id INTEGER PRIMARY KEY auto_increment,
 type TEXT,
 reason TEXT);

INSERT INTO drs_favorites(type, reason) VALUES ('biking', 'Improves endurance and flexibility.');
INSERT INTO drs_favorites(type, reason) VALUES ('hiking', 'Increases cardiovascular health.');

select * from drs_favorites;

/*combine data of one table to another by using select IN select*/
select * from exercise_logs where type in (
    select type from drs_favorites
);

SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason = 'Increases cardiovascular health.');

/*LIKE operator using if we have not exactly match data */
SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason LIKE '%cardiovascular%');

/*aggregate functions: how much calories burned of each type of activities*/
select type, sum(calories) as total_calories from exercise_logs group by type;

/*filtering data: during one session*/
select type, sum(calories) as total_calories from exercise_logs
where calories > 150
group by type;
/*but if we need all of the logs filtering by calories > 150 we use HAVING operator*/
select type, sum(calories) as total_calories from exercise_logs
group by type
having total_calories > 150;
/*AVG HAVING*/
SELECT type, AVG(calories) AS avg_calories FROM exercise_logs
GROUP BY type
HAVING avg_calories > 70;

/*HAVING COUNT: at least 2 activities been done*/
select type from exercise_logs group by type having count(*) >= 2;

/*Calculating results with CASE*/
select count(*) from exercise_logs where heart_rate > 220 - 30;

/* 50-90 % of max */
select count(*) from exercise_logs where heart_rate >= round(0.50 * (220 - 30))
                                     and  heart_rate <= round(0.90 * (220 - 30));

/*check summary of logs of each heart_rate zone*/
/* CASE */
SELECT type, heart_rate,
       CASE
           WHEN heart_rate > 220-30 THEN 'above max'
           WHEN heart_rate > ROUND(0.90 * (220-30)) THEN 'above target'
           WHEN heart_rate > ROUND(0.50 * (220-30)) THEN 'within target'
           ELSE 'below target'
           END as "hr_zone"
FROM exercise_logs;

/* CASE AND GROUP BY */
SELECT count(*),
       CASE
           WHEN heart_rate > 220-30 THEN 'above max'
           WHEN heart_rate > ROUND(0.90 * (220-30)) THEN 'above target'
           WHEN heart_rate > ROUND(0.50 * (220-30)) THEN 'within target'
           ELSE 'below target'
           END as "hr_zone"
FROM exercise_logs
GROUP BY hr_zone;



