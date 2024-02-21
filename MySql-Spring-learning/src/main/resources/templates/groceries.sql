
# drop table groceries;
create table groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INT, aisle INT);

INSERT INTO groceries VALUES (1, 'Bananas', 4, 7);
INSERT INTO groceries VALUES(2, 'Peanut Butter', 1, 2);
INSERT INTO groceries VALUES(3, 'Dark Chocolate Bars', 2, 2);
INSERT INTO groceries VALUES(4, 'Ice cream', 1, 12);
INSERT INTO groceries VALUES(5, 'Cherries', 6, 2);
INSERT INTO groceries VALUES(6, 'Chocolate syrup', 1, 4);

select * from groceries;
select name from groceries;
SELECT * FROM groceries ORDER BY aisle;
SELECT * FROM groceries where groceries.aisle > 5 ORDER BY aisle;

/*Aggregating data (max-min-sum-avg)*/
select sum(groceries.quantity) from groceries;
select name, max(groceries.quantity) from groceries group by name;
SELECT SUM(quantity) FROM groceries GROUP BY aisle;
select groceries.aisle, sum(groceries.quantity) from groceries group by aisle;
select groceries.name, quantity, min(groceries.quantity) from groceries group by quantity, name;

