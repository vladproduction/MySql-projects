/*18. Which sales agent made the most in sales in 2009?*/

# select concat(e.FirstName, ' ',e.LastName ) agent, sum(i.Total) as total
#     from employee e
#     join customer c on e.EmployeeId = c.SupportRepId
#     join invoice i on c.CustomerId = i.CustomerId
#     where year(InvoiceDate) = 2009
#     group by e.EmployeeId

# select concat(e.FirstName, ' ',e.LastName ) as 'sales agent', sum(i.Total) as 'total sales'
# from employee e
#          join customer c on e.EmployeeId = c.SupportRepId
#          join invoice i on c.CustomerId = i.CustomerId
# where year(InvoiceDate) = 2009
# group by e.EmployeeId
# order by `total sales` desc limit 1 /*the best in 2009*/


select MAX(TotalSales.Total), TotalSales.Agent
    FROM
(select concat(e.FirstName,' ',e.LastName ) Agent, sum(i.Total) as Total
from employee e
         join chinook.customer c on e.EmployeeId = c.SupportRepId
         join chinook.invoice i on c.CustomerId = i.CustomerId
where year(InvoiceDate) = 2009
group by e.EmployeeId) as TotalSales;




