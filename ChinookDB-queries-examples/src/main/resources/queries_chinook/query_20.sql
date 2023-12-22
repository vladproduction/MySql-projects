/*20. Which sales agent made the most in sales over all?*/

select  concat(e.FirstName, ' ',e.LastName ) as 'sales agent',sum(i.Total) as 'total sales'
from employee e
         join customer c on e.EmployeeId = c.SupportRepId
         join invoice i on c.CustomerId = i.CustomerId
group by e.EmployeeId
order by `total sales` desc  limit 1;

