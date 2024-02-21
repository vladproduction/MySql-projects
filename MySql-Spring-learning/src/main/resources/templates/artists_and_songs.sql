CREATE TABLE artists
(
    id      INTEGER PRIMARY KEY AUTO_INCREMENT,
    name    TEXT,
    country TEXT,
    genre   TEXT
);

INSERT INTO artists (name, country, genre)
VALUES ('Taylor Swift', 'US', 'Pop');
INSERT INTO artists (name, country, genre)
VALUES ('Led Zeppelin', 'US', 'Hard rock');
INSERT INTO artists (name, country, genre)
VALUES ('ABBA', 'Sweden', 'Disco');
INSERT INTO artists (name, country, genre)
VALUES ('Queen', 'UK', 'Rock');
INSERT INTO artists (name, country, genre)
VALUES ('Celine Dion', 'Canada', 'Pop');
INSERT INTO artists (name, country, genre)
VALUES ('Meatloaf', 'US', 'Hard rock');
INSERT INTO artists (name, country, genre)
VALUES ('Garth Brooks', 'US', 'Country');
INSERT INTO artists (name, country, genre)
VALUES ('Shania Twain', 'Canada', 'Country');
INSERT INTO artists (name, country, genre)
VALUES ('Rihanna', 'US', 'Pop');
INSERT INTO artists (name, country, genre)
VALUES ('Guns N` Roses', 'US', 'Hard rock');
INSERT INTO artists (name, country, genre)
VALUES ('Gloria Estefan', 'US', 'Pop');
INSERT INTO artists (name, country, genre)
VALUES ('Bob Marley', 'Jamaica', 'Reggae');

CREATE TABLE artists_songs
(
    id     INTEGER PRIMARY KEY AUTO_INCREMENT,
    artist TEXT,
    title  TEXT
);

INSERT INTO artists_songs (artist, title)
VALUES ('Taylor Swift', 'Shake it off');
INSERT INTO artists_songs (artist, title)
VALUES ('Rihanna', 'Stay');
INSERT INTO artists_songs (artist, title)
VALUES ('Celine Dion', 'My heart will go on');
INSERT INTO artists_songs (artist, title)
VALUES ('Celine Dion', 'A new day has come');
INSERT INTO artists_songs (artist, title)
VALUES ('Shania Twain', 'Party for two');
INSERT INTO artists_songs (artist, title)
VALUES ('Gloria Estefan', 'Conga');
INSERT INTO artists_songs (artist, title)
VALUES ('Led Zeppelin', 'Stairway to heaven');
INSERT INTO artists_songs (artist, title)
VALUES ('ABBA', 'Mamma mia');
INSERT INTO artists_songs (artist, title)
VALUES ('Queen', 'Bicycle Race');
INSERT INTO artists_songs (artist, title)
VALUES ('Queen', 'Bohemian Rhapsody');
INSERT INTO artists_songs (artist, title)
VALUES ('Guns N` Roses', 'Don`t cry');

/*We've created a database of songs and artists, and you'll make playlists from them in this challenge.
  In this first step, select the title of all the songs by the artist named 'Queen'.*/
select * from artists where name = 'Queen';
select artists_songs.title from artists_songs where artist = 'Queen';
/*INNER JOIN*/
SELECT a_s.title
FROM artists_songs AS a_s
         INNER JOIN artists AS a ON a_s.artist = a.name
WHERE a.name = 'Queen';

/*Now you'll make a 'Pop' playlist. In preparation, select the name of all of the artists from the 'Pop'
  genre.
(Tip: Make sure you type it 'Pop', SQL considers that different from 'pop'.)*/
select * from artists where genre = 'Pop';
SELECT name FROM artists WHERE genre = 'Pop';

/*To finish creating the 'Pop' playlist, add another query that will select the title of all the
  songs from the 'Pop' artists. It should use IN on a nested subquery that's based on your previous
  query.*/
select * from artists_songs where artist in (select name from artists where genre like '%Pop');
/*variation-2*/
select artist, title from artists_songs where artist in (select name from artists where genre like '%ock');