/*Project: Famous people

In this project, you’re going to make your own table with some small set of “famous people”,
  then make more tables about things they do and join those to create nice human readable lists.

For example, here are types of famous people and the questions your data could answer:

Movie stars: What movies are they in? Are they married to each other?
Singers: What songs did they write? Where are they from?
Authors: What books did they write?
Fictional characters: How are they related to other characters? What books do they show up in?*/

create table actors(
    id int primary key auto_increment,
    first_name text,
    last_name text,
    genre text
);
/*Ocean's Eleven*/
insert into actors (first_name, last_name, genre) VALUES ('Brad', 'Pitt', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('George', 'Clooney', 'mix');
/*avatar*/
insert into actors (first_name, last_name, genre) VALUES ('Sam', 'Worthington', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Zoe', 'Saldana', 'mix');
/*titanic*/
insert into actors (first_name, last_name, genre) VALUES ('Leonardo', 'DiCaprio', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Kate', 'Winslet', 'mix');
/*Star Wars: Episode IV*/
insert into actors (first_name, last_name, genre) VALUES ('Mark', 'Hamill', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Harrison', 'Ford', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Carrie', 'Fisher', 'mix');
/*shrek-2*/
insert into actors (first_name, last_name, genre) VALUES ('Mike', 'Myers', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Eddie', 'Murphy', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Cameron', 'Diaz', 'mix');
/*The Lion King*/
insert into actors (first_name, last_name, genre) VALUES ('Matthew', 'Broderick', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('James', 'Earl Jones', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Jeremy', 'Irons', 'mix');
/*Disney's Up*/
insert into actors (first_name, last_name, genre) VALUES ('Ed', 'Asner', 'mix');
insert into actors (first_name, last_name, genre) VALUES ('Jordan', 'Nagai', 'mix');
/*Rocky*/
insert into actors (first_name, last_name, genre) VALUES ('Sylvester', 'Stallone', 'mix');
/*Ironman*/
insert into actors (first_name, last_name, genre) VALUES ('Robert', 'Downey Jr.', 'mix');


/* Movie Appearances Table (to connect actors and movies) */
CREATE TABLE movie_appearances
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    movie_id  INT NOT NULL,
    actor_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies (id),
    FOREIGN KEY (actor_id) REFERENCES actors (id)
);

/* inserting data into TABLE movie_appearances: */
/*avatar*/
insert into movie_appearances (movie_id, actor_id) VALUES (1, 3);
insert into movie_appearances (movie_id, actor_id) VALUES (1, 4);
/*titanic*/
insert into movie_appearances (movie_id, actor_id) VALUES (2, 5);
insert into movie_appearances (movie_id, actor_id) VALUES (2, 6);
/*Star Wars: Episode IV - A New Hope*/
insert into movie_appearances (movie_id, actor_id) VALUES (3, 7);
insert into movie_appearances (movie_id, actor_id) VALUES (3, 8);
insert into movie_appearances (movie_id, actor_id) VALUES (3, 9);
/*Shrek 2*/
insert into movie_appearances (movie_id, actor_id) VALUES (4, 10);
insert into movie_appearances (movie_id, actor_id) VALUES (4, 11);
insert into movie_appearances (movie_id, actor_id) VALUES (4, 12);
/*The Lion King*/


insert into movie_appearances (movie_id, actor_id) VALUES (5, 13);
insert into movie_appearances (movie_id, actor_id) VALUES (5, 14);
insert into movie_appearances (movie_id, actor_id) VALUES (5, 15);
/*Disney`s Up*/
insert into movie_appearances (movie_id, actor_id) VALUES (6, 16);
insert into movie_appearances (movie_id, actor_id) VALUES (6, 17);
/*Rocky*/
insert into movie_appearances (movie_id, actor_id) VALUES (7, 18);
/*Ironman*/
insert into movie_appearances (movie_id, actor_id) VALUES (8, 19);
/*Ocean`s Eleven*/
insert into movie_appearances (movie_id, actor_id) VALUES (9, 1);
insert into movie_appearances (movie_id, actor_id) VALUES (9, 2);

select movies.name as 'movie title', first_name as actor_name, last_name as actor_surname from movies
left join movie_appearances ma on movies.id = ma.movie_id
left join actors a on a.id = ma.actor_id
where a.last_name = 'Pitt';
