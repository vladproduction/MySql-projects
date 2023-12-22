/*15. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should
include the Album name, Media type and Genre.*/

select t.Name as track, a.Title as album, m.Name as type, g.Name as genre
    from track t
    join album a on a.AlbumId = t.AlbumId
    join mediatype m on m.MediaTypeId = t.MediaTypeId
    join genre g on g.GenreId = t.GenreId