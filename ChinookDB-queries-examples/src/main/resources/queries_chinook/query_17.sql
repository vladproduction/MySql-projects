/*17. Provide a query that shows total sales made by each sales agent.*/

select concat(e.FirstName, ' ',e.LastName ) as 'sales agent', sum(i.Total) as 'total sales'
    from employee e
    join customer c on e.EmployeeId = c.SupportRepId
    join invoice i on c.CustomerId = i.CustomerId
    group by e.EmployeeId
