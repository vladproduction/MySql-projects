/*6. Provide a query that shows the invoices associated with each sales agent. The resultant table
should include the Sales Agent’s full name.*/

select i.*, concat(e.FirstName, " ", e.LastName) as 'Sales Agent'
	from invoice i
    left join customer c on c.CustomerId = i.CustomerId
    left join employee e on c.SupportRepId = e.EmployeeId