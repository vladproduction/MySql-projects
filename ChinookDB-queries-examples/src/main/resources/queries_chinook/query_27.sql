/*27.Provide a query that shows the most purchased Media Type.*/

select m.Name, count(Quantity) as 'total sold copies'
    from mediatype m
    join track t on m.MediaTypeId = t.MediaTypeId
    join invoiceline i on t.TrackId = i.TrackId
    group by t.MediaTypeId
    order by 'total sold copies' desc