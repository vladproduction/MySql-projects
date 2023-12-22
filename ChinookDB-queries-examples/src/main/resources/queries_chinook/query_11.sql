/*11. Provide a query that includes the track name with each invoice line item.*/

select InvoiceLineId, t.Name
    from invoiceline il
    join track t on t.TrackId = il.TrackId