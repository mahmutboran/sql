--WRITE A QUERY THAT RETURNS ALL COLUMNS FROM TRACKS TABLE
SELECT * FROM tracks;

--WRITE A QUERY THAT RETURNS THE NAME OF COMPOSERS OF EACH TRACK
SELECT Name,Composer FROM tracks;

--WRITE A QUERY THAT RETURNS UNIQUE ALBUMID, MEDIATYPEID FROM TRACKS TABLE
SELECT DISTINCT AlbumId,MediaTypeId FROM tracks;

--WRITE A QUERY THAT RETURNS TRACK NAME AND TRACKID OF ‘Jorge Ben’
SELECT TrackId,Name,Composer FROM tracks WHERE Composer="Jorge Ben";

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS GREATER THAN $25
SELECT * FROM invoices WHERE total>25; 

--WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS LESS THAN $15. JUST RETURN 5 ROWS
SELECT * FROM invoices WHERE total<15 LIMIT 5; 

--WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH 1 TOTAL AMOUNT IS GREATER THAN $10. 
--THEN SORT THE TOTAL AMOUNTS IN DESCENDING ORDER, LASTLY DISPLAY TOP 2 ROWS
SELECT * FROM invoices WHERE total>10 ORDER BY total DESC LIMIT 2; 

--WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH BILLING COUNTRY IS NOT CANADA. 
--THEN SORT THE TOTAL AMOUNTS IN ASCENDING ORDER, LASTLY DISPLAY TOP 10 ROWS
SELECT * FROM invoices WHERE  BillingCountry<>"Canada" ORDER BY total ASC LIMIT 10; 

--WRITE A QUERY THAT RETURNS INVOICEID, CUSTOMERID AND TOTAL DOLLAR AMOUNT FOR EACH INVOICE. 
--THEN SORT THEM FIRST BY CUSTOMERID IN ASCENDING, THEN TOTAL DOLLAR AMOUNT IN DESCENDING ORDER.
SELECT InvoiceId,CustomerId,total FROM invoices ORDER BY CustomerId ASC, total DESC; 

--WRITE A QUERY THAT RETURNS ALL TRACK NAMES THAT START WITH ‘B’ AND END WITH ‘S’
SELECT Name FROM tracks WHERE Name LIKE "B%S";

--WRITE A QUERY THAT RETURNS THE NEWEST DATE AMONG THE INVOICE DATES BETWEEN 2008 AND 2011
SELECT * FROM invoices WHERE InvoiceDate BETWEEN "2008%" AND "2011%" ORDER BY InvoiceDate DESC LIMIT 1 ;

--WRITE A QUERY THAT RETURNS THE FIRST AND LAST NAME OF THE CUSTOMERS
-- WHO HAVE ORDERS FROM NORWAY AND BELGIUM,
SELECT FirstName,LastName,Country FROM customers WHERE Country="Norway" OR country="Belgium";

--WRITE A QUERY THAT RETURNS THE TRACK NAMES OF ‘ZAPPA’
SELECT name ,Composer FROM tracks WHERE Composer LIKE "%zappa%";

--HOW MANY TRACKS AND INVOICES ARE THERE IN THE DIGITAL MUSIC STORE, DISPLAY SEPERATELY
SELECT count(TrackID)AS SUM_OF_TRACKS ,count(InvoiceId) AS SUM_OF_INVOICES FROM tracks,invoices;

--HOW MANY COMPOSERS ARE THERE IN THE DIGITAL MUSIC STORE
SELECT COUNT(DISTINCT Composer) "Sum_of_Composer" FROM tracks ;

--HOW MANY TRACKS DOES EACH ALBUM HAVE, DISPLAY ALBUMID AND NUMBER OF TRACKS SORTED FROM HIGHEST TO LOWEST
SELECT COUNT( Name)AS Number_Of_Album_Tracks,AlbumId FROM tracks GROUP BY AlbumId ORDER BY Number_Of_Album_Tracks DESC;

--WRITE A QUERY THAT RETURNS TRACK NAME HAVING THE MINIMUM AND MAXIMUM DURATION, DISPLAY SEPERATELY
SELECT Name, MIN(Milliseconds),name,Max(Milliseconds) FROM tracks;

-- WRITE A QUERY THAT RETURNS THE TRACKS HAVING DURATION LESS THAN THE AVERAGE DURATION
SELECT *,(SELECT AVG(Milliseconds) 
FROM tracks)AS avg_seconds FROM tracks 
WHERE Milliseconds<(SELECT AVG(Milliseconds) FROM tracks);

 --WRITE A QUERY THAT RETURNS THE TOTAL NUMBER OF EACH COMPOSER’s TRACK.
SELECT Composer ,COUNT(Name) As Number_Of_Composer_Track FROM tracks GROUP BY Composer; 
SELECT Composer ,COUNT(*) As Number_Of_Composer_Track FROM tracks WHERE Composer IS NOT NULL GROUP BY Composer;

--WRITE A QUERY THAT RETURNS THE GENRE OF EACH TRACK.
SELECT tracks.Name,genres.Name FROM tracks INNER JOIN genres ON tracks.GenreId=genres.GenreId;

--WRITE A QUERY THAT RETURNS THE ARTIST’s ALBUM INFO.
SELECT artists.Name,albums.Title FROM artists INNER  JOIN  albums ON albums.ArtistId=artists.ArtistId;

--WRITE A QUERY THAT RETURNS THE MINIMUM DURATION OF THE TRACK IN EACH ALBUM. DISPLAY ALBUMID, ALBUM TITLE AND DURATION OF THE TRACK. 
--THEN SORT THEM FROM HIGHEST TO LOWEST
SELECT tracks.AlbumId,albums.Title,tracks.Name,MIN(tracks.Milliseconds)AS Min_Track
FROM tracks INNER JOIN albums ON tracks.AlbumId=albums.AlbumId 
GROUP BY tracks.AlbumId
ORDER BY tracks.Milliseconds DESC;

--WRITE A QUERY THAT RETURNS ALBUMS WHOSE TOTAL DURATION IS HIGHER THAN 60 MIN. 
--DISPLAY ALBUM TITLE AND THEIR DURATIONS. THEN SORT THE RESULT FROM HIGHEST TO LOWEST
SELECT tracks.AlbumId,albums.Title ,SUM(tracks.Milliseconds) AS Total_Album_Duratıon
FROM tracks  INNER JOIN albums ON albums.AlbumId=tracks.AlbumId
GROUP BY tracks.AlbumId HAVING  Total_Album_Duratıon>3600000 
ORDER BY Total_Album_Duratıon DESC;

--WRITE A QUERY THAT RETURNS TRACKID,TRACK NAME AND ALBUMID INFO OF THE ALBUM 
--WHOSE TITLE ARE ‘Prenda Minha’, 'Heart of the Night'
SELECT tracks.TrackId,tracks.Name,albums.AlbumId,albums.Title
FROM tracks INNER JOIN albums ON tracks.AlbumId=albums.AlbumId
WHERE albums.Title="Prenda Minha" OR albums.Title="Heart of the Night" OR albums.Title = 'Out Of Exile';

SELECT tracks.TrackId, tracks.name, tracks.AlbumId
FROM tracks
JOIN albums
ON tracks.AlbumId = albums.AlbumId
WHERE albums.Title = 'Prenda Minha' OR albums.Title = 'Heart of the Night' OR albums.Title = 'Out Of Exile';
