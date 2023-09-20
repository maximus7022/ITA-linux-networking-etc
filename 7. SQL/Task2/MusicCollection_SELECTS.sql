-- Show all Ukrainian artists
SELECT *
FROM Artists
WHERE CountryID = (
		SELECT CountryID
		FROM Countries
		WHERE Name = 'Ukraine'
	);
-- Show the most popular genre by the number of tracks
SELECT g.Name AS Genre,
	COUNT(t.TrackID) AS TrackCount
FROM Tracks t
	JOIN Genres g ON t.GenreID = g.GenreID
GROUP BY g.Name
ORDER BY COUNT(t.TrackID) DESC
LIMIT 1;
-- Show the total duration of some album by its name
SELECT Albums.Name,
	SUM(Tracks.Duration) AS TotalDuration
FROM Albums
	JOIN Tracks ON Albums.AlbumID = Tracks.AlbumID
WHERE Albums.Name = 'Franchesko Pierdolini'
GROUP BY Albums.Name;
-- Show the longest track in some album by name
SELECT Tracks.Name,
	MAX(Duration) AS LongestDuration
FROM Tracks
WHERE AlbumID = (
		SELECT AlbumID
		FROM Albums
		WHERE Name = ('Franchesko Pierdolini')
	)
GROUP BY Tracks.Name
ORDER BY LongestDuration DESC
LIMIT 1;
-- Show top 3 artists by the number of albums
SELECT Artists.Name,
	Artists.Surname,
	COUNT(ArtistsAlbums.AlbumID) AS AlbumCount
FROM Artists
	JOIN ArtistsAlbums ON Artists.ArtistID = ArtistsAlbums.ArtistID
GROUP BY Artists.Name,
	Artists.Surname
ORDER BY AlbumCount DESC
LIMIT 3;