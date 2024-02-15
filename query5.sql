--Query 5:  Write a query that lists all the tracks that are not 
--in one of the top 5 genres with longer duration in the database. 

SELECT TrackId, name
FROM tracks
WHERE GenreId IN
(SELECT DISTINCT GenreId genre
FROM tracks
ORDER BY (SELECT max(milliseconds) FROM tracks WHERE GenreId=genre) --Orders by the max milliseconds from an individual song in a genre
--If you want to order by the total number of milliseconds in each genre, replace max with sum
--If you want to order by the average number of milliseconds a song of a genre, replace max with avg
LIMIT (SELECT count(GenreId) from genres) - 5) --Removes the top 5
ORDER BY GenreId
