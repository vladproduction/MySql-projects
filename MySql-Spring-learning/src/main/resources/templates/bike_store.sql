/*Create your own store! Your store should sell one type of things, like clothing or bikes,
  whatever you want your store to specialize in. You should have a table for all the items in
  your store, and at least 5 columns for the kind of data you think you'd need to store.
  You should sell at least 15 items, and use select statements to order your items by price and
  show at least one statistic about the items.*/

create table bike_store (
                            id int PRIMARY KEY,
                            brand text,
                            type text,
                            price int,
                            color text,
                            year_production int,
                            amount_sells int
);

insert into bike_store values (1, 'Colnago', 'road', 1750, 'white', 2023, 2);
insert into bike_store values (2, 'Scott', 'road', 1650, 'black', 2022, 4);
insert into bike_store values (3, 'Liv', 'road-mix', 2250, 'white-blue', 2019, 13);
insert into bike_store values (4, 'Felt', 'road', 1950, 'red', 2020, 4);
insert into bike_store values (5, 'Polygon', 'road', 1450, 'white-red', 2023, 3);
insert into bike_store values (6, 'Specialized', 'road-mix', 2750, 'black-green', 2023, 2);
insert into bike_store values (7, 'Colnago', 'mounting', 1600, 'dark-red', 2022, 4);
insert into bike_store values (8, 'Giant', 'mounting', 1350, 'white-black', 2020, 2);
insert into bike_store values (9, 'Track', 'mounting', 1250, 'gray', 2021, 8);

/*amount of sells = total*/
select sum(bike_store.price) from bike_store;
/*most  2 brands sells*/
select brand, amount_sells from bike_store order by amount_sells desc limit 2;
/*from less brands sells to most*/
select brand, amount_sells from bike_store order by amount_sells;
/*Ordering by price and showing average price:*/
select brand, price, avg(price) over () as avg_price from bike_store order by price;
/*Ordering by price and showing the most expensive item*/
select brand, price from bike_store order by price desc limit 1;

/*avg price of bikes by brand*/
select bike_store.brand, avg(bike_store.price) as avg_price from bike_store group by bike_store.brand;

/*Total bike sales per year_production*/
select year_production, sum(amount_sells) as total_sales from bike_store group by year_production order by year_production;

/*most popular bike color*/
select color, count(*) as total_bikes from bike_store group by color order by total_bikes desc limit 1;

/*Brands with bikes priced over $1800*/
SELECT brand FROM bike_store WHERE price > 1800;

/*Most expensive bike in each color*/
select color, max(price) as max_price from bike_store group by color order by max_price desc;

/*Amount of bikes been produced by each year*/
SELECT year_production, COUNT(*) AS bikes_produced
FROM bike_store
GROUP BY year_production
ORDER BY year_production;
