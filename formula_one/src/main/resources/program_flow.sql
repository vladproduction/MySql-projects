/*program flow*/

-- assume database schema and all tables is created

-- insert customer
-- insert data into customer (50 rows) /*insert_customers.sql*/
/*read from customer after insertion*/
select * from customer;

-- insert team
-- insertion data into team(10 teams) /*insert_teams.sql*/
/*read from team after insertion*/
select * from team;

-- insert venue
-- insertion data into venue(23 venues) /*insert_venues.sql script*/
/*read from venue after insertion*/
select * from venue;

-- insert driver
-- insertion data into driver(20 pilots) /*insert_drivers.sql script*/
-- a many-to-one relationship between the driver table and the team table;
-- this means that one team can have multiple drivers associated with it, while each driver is linked to exactly one team;
/*read from driver after insertion*/
select * from driver;

-- insert event
-- insertion data into event (3 types for each venue) /*insert_events.sql*/
-- a one-to-many relationship between venue table and event table;
-- this means that one venue can hold multiple events associated with it, each event has a type where it links to the concrete venue;
/*read from driver after insertion*/
select * from event;

-- insert ticket
-- insertion data into ticket (tickets for event types RACE and QUALIFYING for a competitions) /*insert_tickets.sql*/
-- a one-to-many relationship between customer table and event table;
-- that mean the concrete customer can purchase a multiple tickets for different events;
/*read from ticket after insertion*/
select * from ticket;


-- insert participation
-- insertion data into participation /*insert_participation.sql*/
-- (we`re associating driver with event (ticket has been sale) and Position pilot placed value (assume all pilots finished, place between 1 not bigger than amount of drivers))
-- many-to-many relation between driver and event tables;
-- meaning many pilots could take part in many events;
select * from participation;

-- update operation;
-- let say customer want to change his seat place;
select * from ticket; -- check for all tickets
select * from ticket where CustomerID = 307; -- find concrete customer by ID from ticket table
UPDATE ticket
SET SeatNumber = '99'
WHERE TicketID = 1 AND EventID = 1 AND SeatNumber = '100' AND Price = 200.00 AND CustomerID = 307; -- updating place from 100 --> 99
select * from ticket where TicketID = 1; -- check for update


-- delete operation;
-- let say customer want to decline his payment for Qualification and to refuse ticket;
select * from ticket; -- check for all tickets
select * from ticket where CustomerID = 307; -- find concrete customer by ID from ticket table
DELETE FROM ticket
WHERE TicketID = 2 AND CustomerID = 307;
select * from ticket where CustomerID = 307; -- check for deletion data
-- 38 records were before removing, and 37 stands after
-- as well amount of tickets for this customer changed properly


