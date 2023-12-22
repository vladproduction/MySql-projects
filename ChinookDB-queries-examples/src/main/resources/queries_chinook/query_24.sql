/*24.Provide a query that shows the most purchased track of 2013.*/

# select t.Name, sum(Quantity) as quantity
#     from invoice
#     join invoiceline i on invoice.InvoiceId = i.InvoiceId
#     join track t on t.TrackId = i.TrackId
#     where year(InvoiceDate) = 2013
#     group by i.TrackId
#     order by Quantity desc

select t.Name, count(il.InvoiceLineId)
    from track t, invoiceline il, invoice i
    where t.TrackId = il.TrackId
    and il.InvoiceId = i.InvoiceId
    and year(i.InvoiceDate) = 2013
    group by t.Name
    order by count(il.InvoiceLineId)
    desc
    limit 1;
