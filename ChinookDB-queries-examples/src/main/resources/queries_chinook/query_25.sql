/*25.Provide a query that shows the top 5 most purchased tracks over all.*/

select t.Name, count(il.InvoiceLineId)
    from track t, invoiceline il, invoice i
    where t.TrackId = il.TrackId
    and il.InvoiceId = i.InvoiceId
    group by t.Name
    order by count(il.InvoiceLineId)
    desc
    limit 7;