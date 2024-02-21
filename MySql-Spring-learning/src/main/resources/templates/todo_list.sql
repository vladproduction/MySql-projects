CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);

INSERT INTO todo_list VALUES (1, 'Wash the dishes', 15);
INSERT INTO todo_list VALUES (2, 'vacuuming', 20);
INSERT INTO todo_list VALUES (3, 'Learn some stuff on KA', 30);
INSERT INTO todo_list VALUES (4, 'reading', 30);
INSERT INTO todo_list VALUES (5, 'watch game', 90);

/*Select the SUM of minutes it will take to do all of the items on your todo_list.
  You should only have one SELECT statement.*/

select sum(todo_list.minutes) from todo_list;