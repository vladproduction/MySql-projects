/*2. Provide a query only showing the Customers from Brazil.*/

select CustomerId, concat(FirstName, " ", LastName) as 'Full Name', Country
from customer
where Country = 'Brazil';