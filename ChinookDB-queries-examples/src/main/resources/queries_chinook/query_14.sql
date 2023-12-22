/*14. Provide a query that shows the total number of tracks in each playlist. The Playlist name
should be included on the resultant table.*/

select p.Name as 'Playlist Name', count(*) as Tracks
    from playlisttrack plt
    join playlist p on p.PlaylistId = plt.PlaylistId
    group by p.PlaylistId


