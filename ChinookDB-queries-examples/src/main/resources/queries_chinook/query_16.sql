/*16. Provide a query that shows all Invoices but includes the # of invoice line items.*/

select i.InvoiceId as Invoices, count(*) as 'invoice line items'
    from invoice i
    join chinook.invoiceline i2 on i.InvoiceId = i2.InvoiceId
    group by i.InvoiceId