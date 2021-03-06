--How many tracks does each album have? Your solution should include Album id and its number of tracks sorted from highest to lowest.
SELECT  AlbumId, COUNT(AlbumId) AS "Count_Track_Each_Album" 
FROM tracks GROUP BY AlbumId  ORDER BY Count_Track_Each_Album DESC ; 

--Find the album title of the tracks. Your solution should include track name and its album title.
SELECT  tracks.Name,albums.Title  FROM tracks INNER JOIN albums ON albums.AlbumId=tracks.AlbumId;
 
--Find the minimum duration of the track in each album. Your solution should include album id, album title and duration of the track sorted from highest to lowest.
SELECT tracks.AlbumId,albums.Title,MIN(tracks.Milliseconds) FROM tracks INNER JOIN albums ON albums.AlbumId=tracks.AlbumId 
GROUP BY tracks.AlbumId ORDER BY Milliseconds DESC;

--Find the total duration of each album. Your solution should include album id, album title and its total duration sorted from highest to lowest.
SELECT tracks.AlbumId,albums.Title, SUM(tracks.Milliseconds) FROM albums INNER JOIN tracks ON albums.AlbumId=tracks.AlbumId 
GROUP BY tracks.AlbumId ORDER BY SUM(tracks.Milliseconds) DESC;

--Based on the previous question, find the albums whose total duration is higher than 70 minutes. Your solution should include album title and total duration.
SELECT albums.Title, SUM(tracks.Milliseconds) AS sum_milliseconds FROM  tracks INNER JOIN albums ON albums.AlbumId=tracks.AlbumId 
GROUP BY tracks.AlbumId HAVING sum_milliseconds>4200000 ORDER BY sum_milliseconds DESC ;


