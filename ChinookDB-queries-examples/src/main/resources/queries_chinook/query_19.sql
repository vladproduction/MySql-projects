/*19. Which sales agent made the most in sales in 2010?*/

select concat(e.FirstName, ' ',e.LastName ) as agent, sum(i.Total) as total
from employee e
         join customer c on e.EmployeeId = c.SupportRepId
         join invoice i on c.CustomerId = i.CustomerId
where year(InvoiceDate) = 2010
group by e.EmployeeId