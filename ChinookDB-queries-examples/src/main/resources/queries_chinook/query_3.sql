/*3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table
should show the customer’s full name, Invoice ID, Date of the invoice and billing country.
*/

select concat(c.FirstName, " ", c.LastName) as 'Full Name', InvoiceId, InvoiceDate, BillingCountry
	from invoice i
    join customer c on c.CustomerId = i.CustomerId
    where BillingCountry = 'Brazil';