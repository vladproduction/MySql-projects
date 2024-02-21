create table favourite_books (id int primary key, title text, author text, publish_year int);

insert into favourite_books values (1, 'Java Programming for Kids', 'Yuri Fain', 2004);
insert into favourite_books values (2, 'Thinking in Java', 'Bruce Eckel', 2000);
insert into favourite_books values (3, 'Computer Science', 'Robert Sedgewick', 2018);
insert into favourite_books values (4, 'Data Structures in Java', 'Oswald Campesato', 2023);
insert into favourite_books values (5, 'Core Java', 'Cay S. Horstmann', 2019);

select * from favourite_books;