/*7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for
all invoices and customers.*/

select i.InvoiceId, i.InvoiceDate, Total, concat(c.FirstName, " ", c.LastName) as 'Customer Full Name',
										  BillingCountry,
										  concat(e.FirstName, " ", e.LastName) as 'Employee Full Name'
	from invoice i
    join customer c on c.CustomerId = i.CustomerId
    join employee e on e.EmployeeId = c.SupportRepId;
    