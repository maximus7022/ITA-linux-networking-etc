-------------------------------------
---------------INSERTS---------------
-------------------------------------
INSERT INTO Countries(Name)
VALUES ('Ukraine'),
	('UK'),
	('Italy'),
	('Japan')
RETURNING *;
INSERT INTO Genres(Name)
VALUES ('Rock'),
	('Pop'),
	('House'),
	('HipHop')
RETURNING *;
INSERT INTO Artists(Name, Surname, CountryID)
VALUES ('Oleksandr', 'Klopotkov', '1'),
	('Sean', 'Omalley', '2'),
	('Oleg', 'Skripka', '1'),
	('Toto', 'Kutunio', '3')
RETURNING *;
INSERT INTO Albums(Name, Year)
VALUES ('Franchesko Pierdolini', '1994'),
	('Nashe', '2022'),
	('Ogo', '2015'),
	('Ocean of Dreams', '2019')
RETURNING *;
INSERT INTO ArtistsAlbums(ArtistID, AlbumID)
VALUES ('1', '2'),
	('3', '3'),
	('4', '1'),
	('2', '4')
RETURNING *;
INSERT INTO Tracks(Name, Duration, Text, AlbumID, GenreID)
VALUES (
		'Song 1',
		'04:30:00',
		'This is the lyrics for Song 1.',
		1,
		2
	),
	(
		'Song 2',
		'03:15:00',
		'This is the lyrics for Song 2.',
		2,
		1
	),
	(
		'Song 3',
		'05:00:00',
		'This is the lyrics for Song 3.',
		1,
		2
	),
	(
		'Song 4',
		'04:10:00',
		'This is the lyrics for Song 4.',
		3,
		4
	),
	(
		'Song 5',
		'03:45:00',
		'This is the lyrics for Song 5.',
		2,
		1
	)
RETURNING *;
INSERT INTO ArtistsTracks(ArtistID, TrackID)
VALUES ('4', '1'),
	('1', '2'),
	('4', '3'),
	('3', '4'),
	('1', '5')
RETURNING *;