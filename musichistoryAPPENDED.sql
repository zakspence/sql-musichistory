DELETE FROM SongSongwriter;
DELETE FROM ArtistBand;
DELETE FROM Band;
DELETE FROM PerformanceRelease;
DELETE FROM PerformanceCredit;
DELETE FROM Performance;
DELETE FROM Release;
DELETE FROM Song;
DELETE FROM ArtistInstrument;
DELETE FROM Instrument;
DELETE FROM InstrumentType;
DELETE FROM Artist;
DELETE FROM Country;

DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Instrument;
DROP TABLE IF EXISTS InstrumentType;
DROP TABLE IF EXISTS ArtistInstrument;
DROP TABLE IF EXISTS SongSongwriter;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS PerformanceCredit;
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS Release;
DROP TABLE IF EXISTS PerformanceRelease;
DROP TABLE IF EXISTS Band;
DROP TABLE IF EXISTS ArtistBand;

CREATE TABLE Country (
    CountryId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

CREATE TABLE InstrumentType (
    TypeId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

CREATE TABLE Instrument (
    InstrumentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    InstrumentTypeId INTEGER NOT NULL,
    CountryOfOriginId INTEGER NOT NULL,
    FOREIGN KEY (CountryOfOriginId) REFERENCES Country(CountryId),
    FOREIGN KEY (InstrumentTypeId) REFERENCES InstrumentType(TypeId)
);

CREATE TABLE Artist (
    ArtistId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Birthplace TEXT NOT NULL DEFAULT CountryOfOrigin,
    IsProducer INTEGER DEFAULT 0,
    CountryOfOriginId INTEGER NOT NULL,
    FOREIGN KEY (CountryOfOriginId) REFERENCES Country(CountryId)
);

CREATE TABLE ArtistInstrument (
    ArtistInstrumentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ArtistId INTEGER NOT NULL,
    InstrumentId INTEGER NOT NULL,
    FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId),
    FOREIGN KEY (InstrumentId) REFERENCES Instrument(InstrumentId)
);

CREATE TABLE Song (
    SongId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

CREATE TABLE SongSongwriter (
    SongSongwriterId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ArtistId INTEGER NOT NULL,
    SongId INTEGER NOT NULL,
    FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId),
    FOREIGN KEY (SongId) REFERENCES Song(SongId)
);

CREATE TABLE Performance (
    PerformanceId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    SongId INTEGER NOT NULL,
    Genre TEXT NOT NULL,
    IsLive INTEGER NOT NULL,
    DatePerformed INTEGER NOT NULL,
    FOREIGN KEY (SongId) REFERENCES Song(SongId)
);

CREATE TABLE PerformanceCredit (
    PerformanceCreditId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ArtistInstrumentId INTEGER NOT NULL,
    PerformanceId INTEGER NOT NULL,
    FOREIGN KEY (ArtistInstrumentId) REFERENCES ArtistInstrument(ArtistInstrumentId),
    FOREIGN KEY (PerformanceId) REFERENCES Performance(PerformanceId)
);

CREATE TABLE Release (
    ReleaseId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    DateReleased INTEGER NOT NULL,
    Name TEXT NOT NULL,
    IsAlbum INTEGER DEFAULT 0,
    IsSingle INTEGER DEFAULT 0,
    IsEP INTEGER DEFAULT 0,
    IsVideo INTEGER DEFAULT 0
);

CREATE TABLE PerformanceRelease (
    PerformanceReleaseId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ReleaseId INTEGER NOT NULL,
    PerformanceCreditId INTEGER NOT NULL,
    FOREIGN KEY (ReleaseId) REFERENCES Release(ReleaseId),
    FOREIGN KEY (PerformanceCreditId) REFERENCES PerformanceCredit(PerformanceCreditId)
);

CREATE TABLE Band (
    BandId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ReleaseId INTEGER NOT NULL,
    DateFormed INTEGER NOT NULL,
    Name TEXT NOT NULL,
    FOREIGN KEY (ReleaseId) REFERENCES Release(ReleaseId)
);

CREATE TABLE ArtistBand (
    ArtistBandId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    ArtistId INTEGER NOT NULL,
    BandId INTEGER NOT NULL,
    DateJoined INTEGER NOT NULL,
    FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId),
    FOREIGN KEY (BandId) REFERENCES Band(BandId)
);

INSERT INTO Country VALUES (null, 'United States of America');
INSERT INTO Country VALUES (null, 'Egypt');
INSERT INTO Country VALUES (null, 'Belgium');

INSERT INTO InstrumentType VALUES (null, 'Brass');
INSERT INTO InstrumentType VALUES (null, 'Woodwind');

INSERT INTO Artist VALUES (null, 'Miles Davis', 'Alton, IL', 0, 1);
INSERT INTO Artist VALUES (null, 'John Coltrane', 'Hamlet, NC', 0, 1);

INSERT INTO Instrument VALUES (null, 'Trumpet', 1, 2);
INSERT INTO Instrument VALUES (null, 'Saxaphone', 2, 3);

INSERT INTO ArtistInstrument VALUES (null, 1, 1);
INSERT INTO ArtistInstrument VALUES (null, 2, 2);

INSERT INTO Song VALUES (null, 'Freddie Freeloader');
INSERT INTO Song VALUES (null, 'Giant Steps');

INSERT INTO SongSongwriter VALUES (null, 1, 1);
INSERT INTO SongSongwriter VALUES (null, 2, 2);

INSERT INTO Performance VALUES (null, 1, 'Jazz', 0, 03021959);
INSERT INTO Performance VALUES (null, 2, 'Jazz', 0, 12021959);

INSERT INTO PerformanceCredit VALUES (null, 1, 1);
INSERT INTO PerformanceCredit VALUES (null, 2, 1);
INSERT INTO PerformanceCredit VALUES (null, 2, 2);

INSERT INTO Release (ReleaseId, DateReleased, Name, IsAlbum) VALUES (null, 08171959, 'Kind of Blue', 1);
INSERT INTO Release (ReleaseId, DateReleased, Name, IsAlbum) VALUES (null, 01271960, 'Giant Steps',  1);

INSERT INTO PerformanceRelease VALUES (null, 1, 1);
INSERT INTO PerformanceRelease VALUES (null, 1, 2);
INSERT INTO PerformanceRelease VALUES (null, 2, 3);

INSERT INTO Band VALUES (null, 1, 1944, 'Miles Davis');
INSERT INTO Band VALUES (null, 2, 1945, 'John Coltrane');

INSERT INTO ArtistBand VALUES (null, 1, 1, 1944);
INSERT INTO ArtistBand VALUES (null, 2, 2, 1945);

SELECT * FROM ArtistBand;
