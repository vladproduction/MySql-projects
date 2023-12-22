/*1. Provide a query showing Customers (just their full names, customer ID and country) who are
not in the US.*/

select CustomerId, concat(FirstName, " ", LastName) as 'Full Name', Country
from customer
where country <> 'USA';