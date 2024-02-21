create table friends (
    id int primary key auto_increment,
    full_name text,
    age int
);

insert into friends (full_name, age) VALUES ('Mickael Jordan', 23);
insert into friends (full_name, age) VALUES ('Scotty Pippen', 26);
insert into friends (full_name, age) VALUES ('Shakill O`Neal', 28);
insert into friends (full_name, age) VALUES ('John Stockton', 21);

create table friends_hobbies(
    id int primary key auto_increment,
    friend_id int,
    name text
);

insert into friends_hobbies (friend_id, name) VALUES (1, 'swim');
insert into friends_hobbies (friend_id, name) VALUES (1, 'run');
insert into friends_hobbies (friend_id, name) VALUES (2, 'skate');
insert into friends_hobbies (friend_id, name) VALUES (2, 'bike');
insert into friends_hobbies (friend_id, name) VALUES (3, 'draw');
insert into friends_hobbies (friend_id, name) VALUES (3, 'jump');
insert into friends_hobbies (friend_id, name) VALUES (3, 'sing');
insert into friends_hobbies (friend_id, name) VALUES (4, 'fly');
insert into friends_hobbies (friend_id, name) VALUES (4, 'watch');
insert into friends_hobbies (friend_id, name) VALUES (4, 'dancing');

create table friends_to_friends(
    id int primary key auto_increment,
    friend1_id int,
    friend2_id int
);

insert into friends_to_friends (friend1_id, friend2_id) VALUES (1, 4);
insert into friends_to_friends (friend1_id, friend2_id) VALUES (2, 3);

/*Step 1
We've created a database for a friend networking site, with a table storing data on each person,
  a table on each person's hobbies, and a table of friend connections between the people. In this first step,
  use a JOIN to display a table showing people's names with their hobbies.*/

select friends.full_name, friends_hobbies.name from friends
    join friends_hobbies
    on friends.id = friends_hobbies.friend_id;

/* Step 2
Now, use another SELECT with a JOIN to show the names of each pair of friends,
   based on the data in the friends_to_friends table. */

select a.full_name, b.full_name
from friends_to_friends
         join friends a
              on friends_to_friends.friend1_id = a.id
         join friends b
              on friends_to_friends.friend2_id = b.id;