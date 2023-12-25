select name, age from students;
select age, name from students;
select name, title from students, book where students.id = book.id;
select * from students where age in (20,21,22,23);