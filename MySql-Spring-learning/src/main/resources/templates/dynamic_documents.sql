/*Step 1
We've created a database for a documents app, with rows for each document with it's title, content, and author.
  In this first step, use UPDATE to change the author to 'Jackie Draper' for all rows where it's currently 'Jackie Paper'.
  Then re-select all the rows to make sure the table changed like you expected.*/

create table documents(
    id int primary key auto_increment,
    title text,
    content text,
    author text
);

INSERT INTO documents (author, title, content)
VALUES ('Puff T.M. Dragon', 'Fancy Stuff', 'Ceiling wax, dragon wings, etc.');
INSERT INTO documents (author, title, content)
VALUES ('Puff T.M. Dragon', 'Living Things', 'They`re located in the left ear, you know.');
INSERT INTO documents (author, title, content)
VALUES ('Jackie Paper', 'Pirate Recipes', 'Cherry pie, apple pie, blueberry pie.');
INSERT INTO documents (author, title, content)
VALUES ('Jackie Paper', 'Boat Supplies', 'Rudder - guitar. Main mast - bed post.');
INSERT INTO documents (author, title, content)
VALUES ('Jackie Paper', 'Things I`m Afraid Of', 'Talking to my parents, the sea, giant pirates, heights.');

select * from documents;

update documents set author = 'Jackie Draper'
    where author = 'Jackie Paper';

select * from documents;

/*Step 2
Now you'll delete a row, being very careful not to delete all the rows. Only delete the row where the title is
  'Things I'm Afraid Of'. Then re-select all the rows to make sure the table changed like you expected.*/
delete from documents where title = 'Things I`m Afraid Of';
select * from documents;

