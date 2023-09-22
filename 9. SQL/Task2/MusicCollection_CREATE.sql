-------------------------------------
---------------CREATES---------------
-------------------------------------
CREATE TABLE Countries (
	CountryID serial PRIMARY KEY,
	Name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE Artists (
	ArtistID serial PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Surname VARCHAR(50) NOT NULL,
	CountryID INT REFERENCES Countries(CountryID)
);
CREATE TABLE Albums (
	AlbumID serial PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Year INT NOT NULL
);
CREATE TABLE ArtistsAlbums (
	ArtistID INT REFERENCES Artists(ArtistID),
	AlbumID INT REFERENCES Albums(AlbumID),
	PRIMARY KEY(ArtistID, AlbumID)
);
CREATE TABLE Genres (
	GenreID serial PRIMARY KEY,
	Name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE Tracks (
	TrackID serial PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Duration TIME NOT NULL,
	Text TEXT UNIQUE NOT NULL,
	AlbumID INT REFERENCES Albums(AlbumID),
	GenreID INT REFERENCES Genres(GenreID)
);
CREATE TABLE ArtistsTracks (
	ArtistID INT REFERENCES Artists(ArtistID),
	TrackID INT REFERENCES Tracks(TrackID),
	PRIMARY KEY(ArtistID, TrackID)
);