create table customers (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    name TEXT,
    email TEXT
);

INSERT INTO customers (name, email) VALUES ('Doctor Who', 'doctorwho@timelords.com');
INSERT INTO customers (name, email) VALUES ('Harry Potter', 'harry@potter.com');
INSERT INTO customers (name, email) VALUES ('Captain Awesome', 'captain@awesome.com');

create table orders (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL
);

INSERT INTO orders (customer_id, item, price)
VALUES (1, 'Sonic Screwdriver', 1000.00);
INSERT INTO orders (customer_id, item, price)
VALUES (2, 'High Quality Broomstick', 40.00);
INSERT INTO orders (customer_id, item, price)
VALUES (1, 'TARDIS', 1000000.00);

select * from customers;
select * from orders;

/* Step 1
We've created a database for customers and their orders. Not all of the customers have made orders, however.
   Come up with a query that lists the name and email of every customer followed by the item and price of
   orders they've made. Use a LEFT OUTER JOIN so that a customer is listed even if they've made no orders,
   and don't add any ORDER BY. */

select customers.name, customers.email, item, price from customers
    left outer join orders
on customers.id = orders.customer_id;

/*Step 2
Now, create another query that will result in one row per each customer, with their name, email, and total amount
  of money they've spent on orders. Sort the rows according to the total money spent, from the most spent to the
  least spent.
(Tip: You should always GROUP BY on the column that is most likely to be unique in a row.)*/

select name, email, sum(price) as 'total_amount_of_orders' from customers

    left outer join orders
    on customers.id = orders.customer_id

group by name, email order by total_amount_of_orders desc;

/*my modernization; same but other view:*/
select concat(name,'/ ', email) as 'customer', sum(price) as 'total_spent'
from customers
        left outer join orders
        on customers.id = orders.customer_id
group by customer
order by total_spent desc;








