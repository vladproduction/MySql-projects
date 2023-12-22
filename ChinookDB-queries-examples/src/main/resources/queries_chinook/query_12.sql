/*12. Provide a query that includes the purchased track name AND artist name with each invoice
line item.*/

select il.InvoiceLineId, t.Name Track, a2.Name Artist
    from invoiceline il
    join track t on t.TrackId = il.TrackId
    join album a on a.AlbumId = t.AlbumId
    join artist a2 on a2.ArtistId = a.ArtistId