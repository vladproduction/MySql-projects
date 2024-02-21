create table movies_sequels (
    id int primary key auto_increment,
    title text,
    released int,
    sequel_id int
);

insert into movies_sequels values (1, 'Harry Potter and the Philosopher`s Stone', 2001, 2);
insert into movies_sequels values (2, 'Harry Potter and the Chamber of Secrets', 2002, 3);
insert into movies_sequels values (3, 'Harry Potter and the Prisoner of Azkaban', 2004, 4);
insert into movies_sequels values (4, 'Harry Potter and the Goblet of Fire', 2005, 5);
insert into movies_sequels values (5, 'Harry Potter and the Order of the Phoenix', 2007, 6);
insert into movies_sequels values (6, 'Harry Potter and the Half-Blood Prince', 2009, 7);
insert into movies_sequels values (7, 'Harry Potter and the Deathly Hallows – Part 1', 2010, 8);
insert into movies_sequels values (8, 'Harry Potter and the Deathly Hallows – Part 2', 2011, NULL);

/*Step 1
We've created a table with all the 'Harry Potter' movies, with a sequel_id column that matches the id of
  the sequel for each movie. Issue a SELECT that will show the title of each movie next to its sequel's
  title (or NULL if it doesn't have a sequel).*/

  select movies_sequels.title as title, movies_sequels.released as year, sequel.sequel_id as sequel
  from movies_sequels
  join movies_sequels sequel
  on movies_sequels.id = sequel.id;
