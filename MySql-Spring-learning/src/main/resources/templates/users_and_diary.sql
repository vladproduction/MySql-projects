create table users (
    id int primary key auto_increment,
    name text
);

insert into users (name) value ('John');
insert into users (name) value ('Jack');
insert into users (name) value ('Nick');

CREATE TABLE diary_logs (
    id      INTEGER PRIMARY KEY auto_increment,
    user_id INTEGER,
    date    TEXT,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

insert into diary_logs (user_id, date, content)
VALUES (1, '20-02-2024',
    'today I`m happy, and I plan to running 35 min, so after eat a lot of sweets!');

select * from diary_logs;

insert into diary_logs (user_id, date, content)
VALUES (1, '20-02-2024',
        'I run 35 min!!!');

select * from diary_logs;

update diary_logs set  content = 'today I`m happy, and I plan to running 35 min, so after I feel myself great!!!'
    where id = 1;

select * from diary_logs;

delete from diary_logs where id = 1;

select * from diary_logs;