create table persons (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    NAME TEXT,
    AGE INTEGER
);

insert into persons (NAME, AGE) VALUES ('John', 18);
insert into persons (NAME, AGE) VALUES ('Jack', 19);
insert into persons (NAME, AGE) VALUES ('Bob', 26);
insert into persons (NAME, AGE) VALUES ('Dany', 20);

create table hobbies(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    PERSON_ID INTEGER,
    NAME TEXT
);

INSERT INTO hobbies (PERSON_ID, NAME) VALUES (1, 'drawing');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (1, 'coding');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (2, 'dancing');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (2, 'coding');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (3, 'skating');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (3, 'rowing');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (3, 'drawing');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (4, 'coding');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (4, 'dilly-dallying');
INSERT INTO hobbies (PERSON_ID, NAME) VALUES (4, 'meowing');

/*Step 1
We've created a database of people and hobbies, and each row in hobbies is related to a row in persons
  via the person_id column. In this first step, insert one more row in persons and then one more row in
  hobbies that is related to the newly inserted person.*/

select persons.NAME from persons;
insert into persons (NAME, AGE) VALUES ('Frank', 25);
insert into hobbies (PERSON_ID, NAME) VALUES (5, 'workout');
select * from hobbies;

/*Step 2
Now, select the 2 tables with a join so that you can see each person's name next to their hobby.*/
select persons.NAME as person, h.NAME as hobby from persons
    join hobbies h on persons.ID = h.PERSON_ID;

/*Step 3
Now, add an additional query that shows only the name and hobbies of 'John',
  using JOIN combined with WHERE.*/
select persons.NAME as person, h.NAME as hobby
from persons
         join hobbies h on persons.ID = h.PERSON_ID
where persons.NAME = 'John';