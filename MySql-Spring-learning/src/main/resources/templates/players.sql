create table players (
    id int primary key auto_increment,
    first_name text,
    last_name text,
    email text,
    phone text,
    birthday text,
    buddy_id int
);

insert into players values (1, 'Peter', 'Horn', 'horn@com.com', '111-111', '12-12-2000', 2);
insert into players values (2, 'Garry', 'Neville', 'neville@com.com', '222-222', '20-05-2002', 1);
insert into players values (3, 'Maike', 'Dorr', 'dorr@com.com', '333-333', '12-11-2004', 4);
insert into players values (4, 'Susy', 'Tella', 'tella@com.com', '444-444', '02-03-2001', 3);

/* Joining tables to themselves with self-joins */
select id, players.first_name, players.last_name, players.buddy_id from players;

/* if we want to see for each player email of buddy_id (corresponds to)*/
select players.first_name, players.last_name, buddies.email as buddy_email from players
    join players buddies
    on players.buddy_id = buddies.id;