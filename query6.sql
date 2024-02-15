--Query 6:  Define an insightful query on 
--your own that involves at least three tables

--Query I came up with: list every artist, sorted by their shortest track, as well as the genre of that track

SELECT DISTINCT artists.name artistName,tracks.Milliseconds millis, genres.Name
FROM tracks
INNER JOIN albums on tracks.AlbumId=albums.AlbumId
INNER JOIN artists on albums.ArtistId=artists.ArtistId
INNER JOIN genres on tracks.GenreId=genres.GenreId --The joins make one big table that we can then filter
WHERE millis=(SELECT min(Milliseconds) FROM tracks 
		INNER JOIN albums on tracks.AlbumId=albums.AlbumId
		INNER JOIN artists on albums.ArtistId=artists.ArtistId
		WHERE artists.Name=artistName) --This section makes sure the shortest song is returned
ORDER BY (SELECT min(Milliseconds) FROM tracks 
		INNER JOIN albums on tracks.AlbumId=albums.AlbumId
		INNER JOIN artists on albums.ArtistId=artists.ArtistId
		WHERE artists.Name=artistName); --This section makes sure that the order is from shortest to longest song