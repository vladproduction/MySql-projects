/*26.Provide a query that shows the top 3 best selling artists.*/

/*not enough correct query*/

select a.name, count(il.TrackId) as 'total sales'
    from artist a, album a2, track t, invoiceline il
        where a.ArtistId = a2.ArtistId
        and a2.AlbumId = t.AlbumId
        and t.TrackId = il.TrackId
    group by a.name
    order by 'total sales' desc
    limit 3;

