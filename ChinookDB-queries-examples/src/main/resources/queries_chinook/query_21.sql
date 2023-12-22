/*21.Provide a query that shows the # of customers assigned to each sales agent.
*/

select e.EmployeeId, concat(e.FirstName, ' ' ,e.LastName) as 'sales agent', count(CustomerId) as 'total customers'
	from customer c
    join employee e on c.SupportRepId = e.EmployeeId
    where e.Title like 'Sales % Agent'
    group by e.EmployeeId;