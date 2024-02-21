/*Make your SQL safer

SQL can be a beautiful thing, but it can also be a dangerous thing. If you're using SQL to access a database
  for an app that's used by hundreds or thousands or even millions of users, you need to be careful -
  because you could accidentally damage or erase all that data. There are various techniques you can use to
  make your SQL safer, however.*/

  /*Avoiding bad updates/deletes
Before you issue an UPDATE, run a SELECT with the same WHERE to make sure you're updating the right
    column and row.
For example, before running:
UPDATE users SET deleted = true WHERE id = 1;
    You could run:
SELECT id, deleted FROM users WHERE id = 1;
Once you decide to run the update, you can use the LIMIT operator to make sure you don't accidentally
    update too many rows:
UPDATE users SET deleted = true WHERE id = 1 LIMIT 1;
Or if you were deleting:
DELETE users WHERE id = 1 LIMIT 1;*/

create table test_table (
    id int primary key auto_increment,
    context text,
    deleted default false
);

select * from test_table;
insert into test_table (context, deleted) VALUES ('context-1', false);
insert into test_table (context, deleted) VALUES ('context-2', false);
insert into test_table (context, deleted) VALUES ('context-3', false);
insert into test_table (context, deleted) VALUES ('context-4', false);

select * from test_table;

UPDATE test_table SET deleted = true WHERE id = 1;
select * from test_table;
SELECT id, deleted FROM test_table WHERE id = 1;
UPDATE test_table SET deleted = true WHERE id = 1 LIMIT 1;
DELETE from test_table WHERE deleted = true LIMIT 1;
select * from test_table;
SELECT * FROM test_table
    where deleted = false;
/**/