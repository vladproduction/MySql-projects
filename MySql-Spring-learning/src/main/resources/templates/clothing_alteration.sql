/*Step 1
We've created a database of clothes, and decided we need a price column. Use ALTER to add a 'price'
  column to the table. Then select all the columns in each row to see what your table looks like now.*/

create table clothing (
    id int primary key auto_increment,
    brand text,
    color text,
    size int
);

insert into clothing (brand, color, size) VALUES ('adidas', 'red', 50);
insert into clothing (brand, color, size) VALUES ('adidas', 'green', 52);
insert into clothing (brand, color, size) VALUES ('nike', 'white', 50);
insert into clothing (brand, color, size) VALUES ('nike', 'yellow', 48);
insert into clothing (brand, color, size) VALUES ('reebok', 'black', 54);

select * from clothing;

alter table clothing add price int ;

select * from clothing;

/*Step 2
Now assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 should be 20 dollars,
  item 3 should be 30 dollars. When you're done, do another SELECT of all the rows to check that it
  worked as expected.*/

update clothing set
    price = 10 where id = 1;

update clothing set
    price = 20 where id = 2;

update clothing set
    price = 30 where id = 3;

update clothing set
    price = 40 where id = 4;

select * from clothing;

/*Step 3
Now insert a new item into the table that has all three attributes filled in, including 'price'.
  Do one final SELECT of all the rows to check it worked.*/

insert into clothing (brand, color, size, price) values ('polar', 'blue', 50, 1000);

select * from clothing;





